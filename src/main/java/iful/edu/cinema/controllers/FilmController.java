package iful.edu.cinema.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	@RequestMapping(value = "/editFilm", method = RequestMethod.GET)
	public String editFilm(@RequestParam("film_id") int id, ModelMap mp) {
		Film film = sqliteDao.getFilmByID(id);
		mp.addAttribute("film", film);
		return "newFilm";
	}

	@RequestMapping(value = "/processingFilm", method = RequestMethod.POST)
	public String addingFilm(@ModelAttribute("film") Film film, @RequestParam("file") MultipartFile file) {
		try {
			if (file.isEmpty()) {
				byte[] i = sqliteDao.getFilmByID(film.getId()).getImage();
				film.setImage(i);
			} else {
				film.setImage(file.getBytes());
			}
			if (film.getId() > 0) {
				sqliteDao.updateFilm(film);
			} else {
				sqliteDao.inputFilm(film);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:filmList";
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
