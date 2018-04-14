package iful.edu.cinema.controllers;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.CinemaSession;
import iful.edu.cinema.objects.Film;
import iful.edu.cinema.objects.Hall;

@Controller
public class SessionController {

	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");
	private static final Date CURRENT_DATE = Date.valueOf(DATE_FORMATTER.format(new java.util.Date()));
	private static final String CURRENT_TIME = "08:00";

	@Autowired
	private SqliteDao sqliteDao;

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

}
