package iful.edu.cinema.utils;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.CinemaSession;
import iful.edu.cinema.objects.Film;

@Controller
public class ParseUtils {

	private SqliteDao sqliteDao;

	public ParseUtils() {
		super();
	}

	public ParseUtils(SqliteDao sqliteDao) {
		super();
		this.sqliteDao = sqliteDao;
	}

	public void parseKosmos(String cinemaURL) {
		Document homePage = null;
		try {
			homePage = Jsoup.connect(cinemaURL).get();
			Elements homePageMovieData = homePage.getElementsByClass("showtime-movie");
			for (int i = 0; i < homePageMovieData.size(); i++) {
				Document moviePage = null;
				try {
					moviePage = Jsoup.connect(cinemaURL.substring(0, 20) + homePageMovieData.get(i).getElementsByTag("a").attr("href")).get();
				} catch (IOException e) {
					e.printStackTrace();
				}
				Element allMovieData = moviePage.getElementsByClass("movie-in-details").get(0);
				if (sqliteDao.getFilmByName(allMovieData.getElementsByTag("h1").first().html()).size() == 0) {
					sqliteDao.inputFilm(getFilmByParseKosmos(allMovieData));
				} else {
					Film filmFromDB = sqliteDao.getFilmByName(allMovieData.getElementsByTag("h1").first().html()).get(0);
					Film freshFilm = getFilmByParseKosmos(allMovieData);
					if (!freshFilm.equals(filmFromDB)) {
						sqliteDao.updateFilm(compareFilmFields(filmFromDB, freshFilm));
					}

				}
				Document affichePage = Jsoup.connect("https://bilet.vkino.com.ua/afisha/liniakino-kosmos/").get();

				inputKosmosSessionByParse(i, allMovieData, affichePage);

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void parseLumere(String cinemaURL) {
		Document homePage = null;
		try {
			homePage = Jsoup.connect(cinemaURL).get();
			Elements homePageMovieData = homePage.getElementsByClass("cinema-list").get(0).getElementsByClass("descr");

			for (int i = 0; i < homePageMovieData.size(); i++) {
				Document moviePage = null;
				try {
					moviePage = Jsoup.connect(cinemaURL + homePageMovieData.get(i).getElementsByClass("more").attr("href")).get();
				} catch (IOException e) {
					e.printStackTrace();
				}
				Element allMovieData = moviePage.getElementsByClass("movie-detailed").get(0);
				if (sqliteDao.getFilmByName(allMovieData.getElementsByClass("title").first().html()).size() == 0) {
					sqliteDao.inputFilm(getFilmByParseLumere(allMovieData));
				} else {
					Film filmFromDB = sqliteDao.getFilmByName(allMovieData.getElementsByClass("title").first().html()).get(0);
					Film freshFilm = getFilmByParseLumere(allMovieData);
					if (!freshFilm.equals(filmFromDB)) {
						sqliteDao.updateFilm(compareFilmFields(filmFromDB, freshFilm));
					}
				}

				Elements scheduleTable = moviePage.getElementById("weekSchedule").getElementsByTag("tr");
				inputLumereSessionByParse(allMovieData, scheduleTable);

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void inputKosmosSessionByParse(int filmNumber, Element allMovieData, Element affichePage) {
		Elements filmSchedule = affichePage.getElementsByClass("showstimes").get(filmNumber).getAllElements();
		for (int x = 0; x < filmSchedule.size(); x++) {
			if (affichePage.getElementsByClass("showstimes").get(filmNumber).getAllElements().get(x).is(".show-time")) {

				String currentTime = filmSchedule.get(x).getElementsByTag("a").html();
				String currentPrice = filmSchedule.get(x).getElementsByClass("price-list").html();
				int currentFilmId = sqliteDao.getFilmByName(allMovieData.getElementsByTag("h1").first().html()).get(0).getId();
				if (checkSessionDuplicate(Constants.KOSMOS_ID, Constants.DATE_FORMATTER.format(new java.util.Date()), currentTime, sqliteDao.getSessionBySearch("film_name", allMovieData.getElementsByTag("h1").first().html()))) {
					CinemaSession cinemaSession = new CinemaSession();
					cinemaSession.setCinema_id(Constants.KOSMOS_ID);
					cinemaSession.setHall_id(20);
					cinemaSession.setFilm_id(currentFilmId);
					cinemaSession.setShow_time(currentTime);
					cinemaSession.setTicket_price(currentPrice);
					cinemaSession.setShow_date(Date.valueOf(Constants.DATE_FORMATTER.format(new java.util.Date())));
					sqliteDao.inputSession(cinemaSession);
				}

			}
			if (filmSchedule.get(x).is(".date") && x != 1) {
				break;
			}

		}

	}

	private void inputLumereSessionByParse(Element allMovieData, Elements scheduleTable) {
		int dayCounter = 0;
		for (int b = 1; b < scheduleTable.size(); b++) {
			Elements currentDay = scheduleTable.get(b).getElementsByTag("td");
			if (currentDay.first().hasText() && dayCounter == 0 || !currentDay.first().hasText()) {
				int currentFilmId = sqliteDao.getFilmByName(allMovieData.getElementsByClass("title").first().html()).get(0).getId();
				String currentPrice = currentDay.get(4).html();
				String currentTime = currentDay.get(1).html();
				String currentHall = currentDay.get(3).html().substring(0, currentDay.get(3).html().length() - 4);
				if (checkSessionDuplicate(Constants.LUMERE_ID, Constants.DATE_FORMATTER.format(new java.util.Date()), currentTime, sqliteDao.getSessionBySearch("film_name", allMovieData.getElementsByClass("title").first().html()))) {
					CinemaSession cinemaSession = new CinemaSession();
					cinemaSession.setFilm_id(currentFilmId);
					cinemaSession.setCinema_id(Constants.LUMERE_ID);

					cinemaSession.setHall_id(sqliteDao.getHallByName(currentHall).getId());

					cinemaSession.setShow_date(Date.valueOf(Constants.DATE_FORMATTER.format(new java.util.Date())));
					cinemaSession.setShow_time(currentTime);
					cinemaSession.setTicket_price(currentPrice);

					sqliteDao.inputSession(cinemaSession);
				}
				dayCounter++;
			} else
				break;
		}
	}

	private static Film getFilmByParseKosmos(Element allMovieData) {
		Film film = new Film();
		film.setName(allMovieData.getElementsByTag("h1").first().html());
		try {
			film.setImage(ImageRecover.recoverImageFromUrl(allMovieData.getElementsByTag("img").attr("src").toString()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		film.setDescription(allMovieData.getElementsByClass("story").text());
		if (allMovieData.getElementsByClass("trailer").first().childNodes().size() != 1) {
			film.setTrailer_URL(allMovieData.getElementsByClass("trailer").first().getElementsByTag("iframe").first().attr("src").toString());
		}
		for (int x = 0; x < allMovieData.getElementsByClass("details").get(0).getElementsByTag("dl").get(0).getAllElements().size(); x++) {
			Element movieDatails = allMovieData.getElementsByClass("details").get(0).getElementsByTag("dl").get(0).getAllElements().get(x);
			switch (movieDatails.ownText()) {
			case "Прем'єра":
				String fullFilmData = movieDatails.nextElementSibling().ownText();
				int filmYear = Integer.valueOf(fullFilmData.substring(fullFilmData.length() - 4, fullFilmData.length()));
				film.setYear(filmYear);
				break;
			case "Країна":
				film.setCountry(movieDatails.nextElementSibling().ownText());
				break;
			case "Режисер":
				film.setDirector(movieDatails.nextElementSibling().ownText());
				break;
			case "Жанр":
				film.setGenre(movieDatails.nextElementSibling().ownText());
				break;
			case "Тривалість":
				film.setMovie_length(movieDatails.nextElementSibling().ownText());
				break;
			}
		}
		return film;
	}

	private static Film getFilmByParseLumere(Element allMovieData) {
		Film film = new Film();
		film.setName(allMovieData.getElementsByClass("title").first().html());
		try {
			film.setImage(ImageRecover.recoverImageFromUrl(allMovieData.getElementsByTag("img").attr("src").toString()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		film.setDescription(allMovieData.getElementsByClass("descr").text());

		if (allMovieData.getElementsByClass("trailers").first().childNodes().size() != 1) {
			film.setTrailer_URL(allMovieData.getElementsByClass("trailers").first().getElementsByTag("iframe").first().attr("src").toString());
		}

		for (int x = 0; x < allMovieData.getElementsByClass("info").get(0).getElementsByClass("param").size(); x++) {
			Element movieDatails = allMovieData.getElementsByClass("info").get(0).getElementsByClass("param").get(x);
			switch (movieDatails.ownText()) {
			case "Рік:":
				film.setYear(Integer.valueOf(movieDatails.getElementsByTag("strong").html()));
				break;
			case "Країна:":
				film.setCountry(movieDatails.getElementsByTag("strong").html());
				break;
			case "Режисер:":
				film.setDirector(movieDatails.getElementsByTag("strong").html());
				break;
			case "Жанр:":
				film.setGenre(movieDatails.getElementsByTag("strong").html());
				break;
			case "Тривалість:":
				film.setMovie_length(movieDatails.getElementsByTag("strong").html());
				break;
			}
		}
		return film;
	}

	private static Film compareFilmFields(Film filmFromDB, Film freshFilm) {
		if (filmFromDB.getCountry().length() < freshFilm.getCountry().length()) {
			filmFromDB.setCountry(freshFilm.getCountry());
		}
		if (filmFromDB.getDescription().length() < freshFilm.getDescription().length()) {
			filmFromDB.setDescription(freshFilm.getDescription());
		}
		if (StringUtils.isEmpty(filmFromDB.getDirector()) && !StringUtils.isEmpty(freshFilm.getDirector())) {
			filmFromDB.setDirector(freshFilm.getDirector());
		}
		if (filmFromDB.getGenre().length() < freshFilm.getGenre().length()) {
			filmFromDB.setGenre(freshFilm.getGenre());
		}
		if (filmFromDB.getImage() == null && freshFilm.getImage() != null) {
			filmFromDB.setImage(freshFilm.getImage());
		}
		if (filmFromDB.getTrailer_URL() == null && freshFilm.getTrailer_URL() != null) {
			filmFromDB.setTrailer_URL(freshFilm.getTrailer_URL());
		}
		if (StringUtils.isEmpty(filmFromDB.getMovie_length()) && !StringUtils.isEmpty(freshFilm.getMovie_length())) {
			filmFromDB.setMovie_length(freshFilm.getMovie_length());
		}
		if (filmFromDB.getYear() == 0 && freshFilm.getYear() != 0) {
			filmFromDB.setYear(freshFilm.getYear());
		}

		return filmFromDB;
	}

	private static boolean checkSessionDuplicate(int cinemaId, String data, String time, List<CinemaSession> list) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCinema_id() == cinemaId && list.get(i).getShow_time().equals(time) && data.equals(Constants.DATE_FORMATTER.format(list.get(i).getShow_date()))) {
				return false;
			}
		}
		return true;
	}

}
