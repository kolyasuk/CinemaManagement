package iful.edu.cinema.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.CinemaSession;

@Controller
public class HomeController {

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

}
