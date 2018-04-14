package iful.edu.cinema.controllers;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Cinema;

@Controller
public class CinemaController {

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/cinemaDetails", method = RequestMethod.GET)
	public String cinemaDetails(@RequestParam("cinema_id") int id, ModelMap mp) {
		Cinema cinema = sqliteDao.getCinemaByID(id);
		mp.addAttribute("cinema", cinema);
		return "cinema";
	}

	@RequestMapping(value = "/newCinema", method = RequestMethod.GET)
	public String newCinema(@ModelAttribute("cinema") Cinema cinema, ModelMap mp) {
		return "newCinema";
	}

	@RequestMapping(value = "/addingCinema", method = RequestMethod.POST)
	public String addingCinema(@Valid @ModelAttribute("cinema") Cinema cinema, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {

		if (!bindingResult.hasErrors()) {
			try {
				cinema.setImage(file.getBytes());
				sqliteDao.inputCinema(cinema);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:cinemaList";
		}

		return "newCinema";
	}

	@RequestMapping(value = "/cinemaList")
	public String cinemaList(ModelMap mp) {
		List<Cinema> cinemaList = sqliteDao.getCinemaList();
		mp.addAttribute("cinemaList", cinemaList);
		return "cinemaList";
	}

	@RequestMapping(value = "/deleteCinema")
	public String deleteCinema(@RequestParam("cinema_id") int id) {
		sqliteDao.deleteCinemaById(id);
		return "redirect:cinemaList";
	}

}
