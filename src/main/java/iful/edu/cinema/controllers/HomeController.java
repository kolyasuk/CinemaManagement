package iful.edu.cinema.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.CinemaSession;
import iful.edu.cinema.objects.Film;
import iful.edu.cinema.objects.Hall;

@Controller
public class HomeController {

	static SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
	private static final Date CURRENT_DATE = Date.valueOf(dt1.format(new java.util.Date()));
	private static final String CURRENT_TIME = "08:00";

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/")
	public String sessionList(ModelMap mp) {
		List<CinemaSession> list = sqliteDao.getCurrentCinemaSessions();
		mp.addAttribute("list", list);
		return "home";
	}

	@RequestMapping(value = "/?order_by", method = RequestMethod.GET)
	public ModelAndView sessionListOrder(@RequestParam("order_by") String order, ModelAndView md, HttpServletRequest request) {
		System.out.println("test");
		md.setViewName("home");
		return md;
	}

	@RequestMapping(value = "/filmDetails", method = RequestMethod.GET)
	public String filmDetails(@RequestParam("film_id") int id, ModelMap mp) {
		Film film = sqliteDao.getFilmByID(id);
		mp.addAttribute("film", film);
		return "film";
	}

	@RequestMapping(value = "/cinemaDetails", method = RequestMethod.GET)
	public String cinemaDetails(@RequestParam("cinema_id") int id, ModelMap mp) {
		Cinema cinema = sqliteDao.getCinemaByID(id);
		mp.addAttribute("cinema", cinema);
		return "cinema";
	}

	@RequestMapping(value = "/newSession", method = RequestMethod.GET)
	public String addSession(@ModelAttribute("session") CinemaSession cinemaSession, ModelMap mp) {
		List<Film> filmList = sqliteDao.getFilmList();
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		List<Hall> hallList = sqliteDao.getHallList();
		mp.addAttribute("filmList", filmList);
		mp.addAttribute("cinemaList", cinemaList);
		mp.addAttribute("hallList", hallList);

		cinemaSession.setShow_date(CURRENT_DATE);

		cinemaSession.setShow_time(CURRENT_TIME);

		return "newSession";
	}

	@RequestMapping(value = "/editSession", method = RequestMethod.GET)
	public String editSession(@RequestParam("session_id") int id, ModelMap mp) {
		CinemaSession cinemaSession = sqliteDao.getCinemaSessionByID(id);
		List<Film> filmList = sqliteDao.getFilmList();
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		List<Hall> hallList = sqliteDao.getHallList();
		mp.addAttribute("session", cinemaSession);
		mp.addAttribute("filmList", filmList);
		mp.addAttribute("cinemaList", cinemaList);
		mp.addAttribute("hallList", hallList);
		return "newSession";
	}

	@RequestMapping(value = "/addOrEditSession", method = RequestMethod.POST)
	public String addOREditSession(@ModelAttribute("session") CinemaSession cinemaSession, HttpServletRequest request) {
		cinemaSession.setShow_date(Date.valueOf(request.getParameter("date")));
		cinemaSession.setShow_time(request.getParameter("time"));
		cinemaSession.setTicket_price(Integer.valueOf(request.getParameter("ticket_price")));
		if (cinemaSession.getId() > 0) {
			sqliteDao.updateSession(cinemaSession);
		} else {
			sqliteDao.inputSession(cinemaSession);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/deleteSession")
	public String deleteSession(@RequestParam("session_id") int id) {
		sqliteDao.deleteSessionById(id);
		return "redirect:/";
	}

	@RequestMapping(value = "/newFilm", method = RequestMethod.GET)
	public String addFilm(@ModelAttribute("film") Film film) {
		film.setMovie_length("00:00:00");

		return "newFilm";
	}

	@RequestMapping(value = "/addingFilm", method = RequestMethod.POST)
	public ModelAndView addingFilm(@Valid @ModelAttribute("film") Film film, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
		System.out.println(bindingResult.getFieldError());
		if (!bindingResult.hasErrors()) {

			try {
				film.setImage(file.getBytes());
				sqliteDao.inputFilm(film);
			} catch (IOException e) {
				e.printStackTrace();
			}

			return new ModelAndView("redirect:/");
		}
		return new ModelAndView("newFilm");
	}

	@RequestMapping(value = "/newCinema", method = RequestMethod.GET)
	public String newCinema(@ModelAttribute("cinema") Cinema cinema, ModelMap mp) {
		return "newCinema";
	}

	@RequestMapping(value = "/addingCinema", method = RequestMethod.POST)
	public String addingCinema(@ModelAttribute("cinema") Cinema cinema, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
		try {
			cinema.setImage(file.getBytes());
			sqliteDao.inputCinema(cinema);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/newHall", method = RequestMethod.GET)
	public String newHall(@ModelAttribute("hall") Hall hall, ModelMap mp) {
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		mp.addAttribute("cinemaList", cinemaList);
		return "newHall";
	}

	@RequestMapping(value = "/addingHall", method = RequestMethod.POST)
	public String addingHall(@ModelAttribute("hall") Hall hall, BindingResult bindingResult) {
		sqliteDao.inputHall(hall);

		return "redirect:/";
	}

}
