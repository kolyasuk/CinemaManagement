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

	List<CinemaSession> getCinemaSessions(boolean type, int page);

	CinemaSession getCinemaSessionByID(int id);

	List<CinemaSession> getSessionBySearch(String fieldName, String value);

	void inputFilm(Film film);

	void updateFilm(Film film);

	void deleteFilmById(int id);

	Film getFilmByID(int id);

	List<Film> getFilmByName(String name);

	List<Film> getFilmList();

	void inputCinema(Cinema cinema);

	void deleteCinemaById(int id);

	void updateCinema(Cinema cinema);

	Cinema getCinemaByID(int id);

	List<Cinema> getCinemaList();

	void inputHall(Hall hall);

	void deleteHallById(int id);

	void updateHall(Hall hall);

	Hall getHallByID(int id);

	Hall getHallByName(String name);

	List<Hall> getHallList();

}
