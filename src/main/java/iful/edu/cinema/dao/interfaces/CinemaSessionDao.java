package iful.edu.cinema.dao.interfaces;

import java.util.List;

import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.CinemaSession;
import iful.edu.cinema.objects.Film;
import iful.edu.cinema.objects.Hall;

public interface CinemaSessionDao {

	void inputSession(CinemaSession session);

	void updateSession(CinemaSession session);

	void deleteSessionById(int id);

	List<CinemaSession> getCurrentCinemaSessions();

	CinemaSession getCinemaSessionByID(int id);

	void inputFilm(Film film);

	Cinema getCinemaByID(int id);

	Film getFilmByID(int id);

	List<Film> getFilmList();

	List<Cinema> getCinemaList();

	List<Hall> getHallList();

}
