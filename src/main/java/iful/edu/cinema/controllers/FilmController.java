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
import org.springframework.web.servlet.ModelAndView;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Film;

@Controller
public class FilmController {

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/filmDetails", method = RequestMethod.GET)
	public String filmDetails(@RequestParam("film_id") int id, ModelMap mp) {
		Film film = sqliteDao.getFilmByID(id);
		mp.addAttribute("film", film);
		return "film";
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

			return new ModelAndView("redirect:filmList");
		}
		return new ModelAndView("newFilm");
	}

	@RequestMapping(value = "/filmList")
	public String filmList(ModelMap mp) {
		List<Film> filmList = sqliteDao.getFilmList();
		mp.addAttribute("filmList", filmList);
		return "filmList";
	}

	@RequestMapping(value = "/deleteFilm")
	public String deleteFilm(@RequestParam("film_id") int id) {
		sqliteDao.deleteFilmById(id);
		return "redirect:filmList";
	}

}
