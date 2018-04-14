package iful.edu.cinema.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.Hall;

@Controller
public class HallController {

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/newHall", method = RequestMethod.GET)
	public String newHall(@ModelAttribute("hall") Hall hall, ModelMap mp) {
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		mp.addAttribute("cinemaList", cinemaList);
		return "newHall";
	}

	@RequestMapping(value = "/addingHall", method = RequestMethod.POST)
	public String addingHall(@Valid @ModelAttribute("hall") Hall hall, BindingResult bindingResult, ModelMap mp) {
		if (!bindingResult.hasErrors()) {
			sqliteDao.inputHall(hall);
			return "redirect:hallList";
		}
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		mp.addAttribute("cinemaList", cinemaList);
		return "newHall";
	}

	@RequestMapping(value = "/hallList")
	public String hallList(ModelMap mp) {
		List<Hall> hallList = sqliteDao.getHallList();
		mp.addAttribute("hallList", hallList);
		return "hallList";
	}

	@RequestMapping(value = "/deleteHall")
	public String deleteHall(@RequestParam("hall_id") int id) {
		sqliteDao.deleteHallById(id);
		return "redirect:hallList";
	}

}
