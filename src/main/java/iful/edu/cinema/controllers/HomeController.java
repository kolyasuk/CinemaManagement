package iful.edu.cinema.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/")
	public ModelAndView sessionList(ModelAndView md, HttpServletRequest request) {
		List<CinemaSession> list = sqliteDao.getCurrentCinemaSessions();
		md.addObject("list", list);
		md.setViewName("home");
		return md;
	}

	@RequestMapping(value = "/?order_by", method = RequestMethod.GET)
	public ModelAndView sessionListOrder(@RequestParam("order_by") String order, ModelAndView md, HttpServletRequest request) {
		System.out.println("test");
		md.setViewName("home");
		return md;
	}

	@RequestMapping(value = "/filmDetails", method = RequestMethod.GET)
	public ModelAndView filmDetails(@RequestParam("film_id") int id, ModelAndView md, HttpServletRequest request) {
		Film film = sqliteDao.getFilmByID(id);
		md.addObject("film", film);
		md.setViewName("film");
		return md;
	}

	@RequestMapping(value = "/cinemaDetails", method = RequestMethod.GET)
	public ModelAndView cinemaDetails(@RequestParam("cinema_id") int id, ModelAndView md, HttpServletRequest request) {
		Cinema cinema = sqliteDao.getCinemaByID(id);
		md.addObject("cinema", cinema);
		md.setViewName("cinema");
		return md;
	}

	@RequestMapping(value = "/addSession")
	public ModelAndView addSession(@ModelAttribute("session") CinemaSession cinemaSession, ModelAndView md, HttpServletRequest request) {
		List<Film> filmList = sqliteDao.getFilmList();
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		List<Hall> hallList = sqliteDao.getHallList();
		md.addObject("filmList", filmList);
		md.addObject("cinemaList", cinemaList);
		md.addObject("hallList", hallList);

		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
		cinemaSession.setShow_date(Date.valueOf(dt1.format(new java.util.Date())));

		cinemaSession.setShow_time("10:00");

		md.setViewName("newSession");
		return md;
	}

	@RequestMapping(value = "/editSession")
	public ModelAndView editSession(@RequestParam("session_id") int id, ModelAndView md, HttpServletRequest request) {
		CinemaSession cinemaSession = sqliteDao.getCinemaSessionByID(id);
		List<Film> filmList = sqliteDao.getFilmList();
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		List<Hall> hallList = sqliteDao.getHallList();
		md.addObject("session", cinemaSession);
		md.addObject("filmList", filmList);
		md.addObject("cinemaList", cinemaList);
		md.addObject("hallList", hallList);
		md.setViewName("newSession");
		return md;
	}

	@RequestMapping(value = "/addOrEditSession")
	public ModelAndView addOREditSession(@ModelAttribute("session") CinemaSession cinemaSession, ModelAndView md, HttpServletRequest request) {
		cinemaSession.setShow_date(Date.valueOf(request.getParameter("date")));
		cinemaSession.setShow_time(request.getParameter("time"));
		cinemaSession.setTicket_price(Integer.valueOf(request.getParameter("ticket_price")));
		if (cinemaSession.getId() > 0) {
			sqliteDao.updateSession(cinemaSession);
		} else {
			sqliteDao.inputSession(cinemaSession);
		}
		md.setViewName("redirect:/");
		return md;
	}

	@RequestMapping(value = "/deleteSession")
	public ModelAndView deleteSession(@RequestParam("session_id") int id, ModelAndView md, HttpServletRequest request) {
		sqliteDao.deleteSessionById(id);
		md.setViewName("redirect:/");
		return md;
	}

	@RequestMapping(value = "/addFilm")
	public ModelAndView addFilm(@ModelAttribute("film") Film film, HttpServletRequest request, HttpServletResponse responce) {
		film.setMovie_length("00:00:00");

		return new ModelAndView("newFilm");
	}

	@RequestMapping(value = "/addingFilm")
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

}
