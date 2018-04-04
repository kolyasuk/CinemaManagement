package iful.edu.cinema.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.Film;

@Controller
@RequestMapping("/image")
public class ImageController {

	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/displayCinemaImage", method = RequestMethod.GET)
	public void showCinemaImage(@RequestParam("id") Integer id, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {

		Cinema cinema = sqliteDao.getCinemaByID(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(cinema.getImage());
		response.getOutputStream().flush();

		response.getOutputStream().close();
	}

	@RequestMapping(value = "/displayFilmImage", method = RequestMethod.GET)
	public void showFilmImage(@RequestParam("id") Integer id, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {

		Film film = sqliteDao.getFilmByID(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(film.getImage());
		response.getOutputStream().flush();

		response.getOutputStream().close();
	}

}
