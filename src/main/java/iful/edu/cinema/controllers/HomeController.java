package iful.edu.cinema.controllers;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/deleteSession")
	public ModelAndView deleteSession(@RequestParam("session_id") int id, ModelAndView md, HttpServletRequest request) {
		sqliteDao.deleteSessionById(id);
		md.setViewName("redirect:/");
		return md;
	}

	@RequestMapping(value = "/addSession")
	public ModelAndView addSession(ModelAndView md, HttpServletRequest request) {
		List<Film> filmList = sqliteDao.getFilmList();
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		List<Hall> hallList = sqliteDao.getHallList();
		md.addObject("filmList", filmList);
		md.addObject("cinemaList", cinemaList);
		md.addObject("hallList", hallList);
		md.setViewName("newSession");
		return md;
	}

	@RequestMapping(value = "/inputingSession")
	public ModelAndView inputingSession(ModelAndView md, HttpServletRequest request) {
		CinemaSession cinemaSession = new CinemaSession();
		cinemaSession.setFilm_id(Integer.valueOf(request.getParameter("film")));
		cinemaSession.setCinema_id(Integer.valueOf(request.getParameter("cinema")));
		cinemaSession.setHall_id(Integer.valueOf(request.getParameter("hall")));
		cinemaSession.setShow_date(Date.valueOf(request.getParameter("date")));
		cinemaSession.setShow_time(Time.valueOf(request.getParameter("time") + ":00"));
		cinemaSession.setTicket_price(Double.valueOf(request.getParameter("ticket_price")));
		sqliteDao.inputSession(cinemaSession);
		md.setViewName("redirect:/");
		return md;
	}

}
