package iful.edu.cinema.dao.impl;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import iful.edu.cinema.dao.interfaces.CinemaSessionDao;
import iful.edu.cinema.objects.Cinema;
import iful.edu.cinema.objects.CinemaSession;
import iful.edu.cinema.objects.Film;
import iful.edu.cinema.objects.Hall;

@Component("sqliteDao")
public class SqliteDao implements CinemaSessionDao {

	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public Cinema getCinemaByID(int id) {
		String sql = "select * from cinema where id=:id";
		MapSqlParameterSource paramMap = new MapSqlParameterSource("id", id);
		return jdbcTemplate.queryForObject(sql, paramMap, new RowMapper<Cinema>() {
			@Override
			public Cinema mapRow(ResultSet rs, int rowNum) throws SQLException {
				Cinema cinema = new Cinema();
				cinema.setId(rs.getInt("id"));
				cinema.setName(rs.getString("name"));
				cinema.setImage(rs.getBytes("image"));
				cinema.setAddress(rs.getString("address"));
				cinema.setDescription(rs.getString("description"));
				return cinema;
			}
		});

	}

	@Override
	public Film getFilmByID(int id) {
		String sql = "select * from film where id=:id";
		MapSqlParameterSource paramMap = new MapSqlParameterSource("id", id);

		return jdbcTemplate.queryForObject(sql, paramMap, new RowMapper<Film>() {

			@Override
			public Film mapRow(ResultSet rs, int rowNum) throws SQLException {
				Film film = new Film();
				film.setId(rs.getInt("id"));
				film.setName(rs.getString("name"));
				film.setYear(rs.getInt("year"));
				film.setDirector(rs.getString("director"));
				film.setCountry(rs.getString("country"));
				film.setMovie_length(rs.getString("movie_length"));
				film.setImage(rs.getBytes("image"));
				film.setDescription(rs.getString("description"));
				return film;
			}
		});
	}

	@Override
	public List<CinemaSession> getCurrentCinemaSessions() {
		String sql = "select * from sessionView";
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				CinemaSession session = new CinemaSession();
				session.setId(rs.getInt("session_id"));
				session.setCinema_id(rs.getInt("cinema_id"));
				session.setCinema_name(rs.getString("cinema_name"));
				session.setFilm_id(rs.getInt("film_id"));
				session.setFilm_name(rs.getString("film_name"));
				session.setHall_id(rs.getInt("hall_id"));
				session.setHall_name(rs.getString("hall_name"));
				session.setShow_date(Date.valueOf(rs.getString("session_date")));
				session.setShow_time(Time.valueOf(rs.getString("session_time")));
				session.setTicket_price(rs.getInt("ticket_price"));

				return session;
			}
		});
	}

	@Override
	public void deleteSessionById(int id) {
		String sql = "delete from session where id=:id";
		MapSqlParameterSource paramMap = new MapSqlParameterSource("id", id);
		jdbcTemplate.update(sql, paramMap);
	}

	@Override
	public List<Film> getFilmList() {
		String sql = "select * from film";
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Film film = new Film();
				film.setId(rs.getInt("id"));
				film.setName(rs.getString("name"));
				film.setYear(rs.getInt("year"));
				film.setDirector(rs.getString("director"));
				film.setCountry(rs.getString("country"));
				film.setMovie_length(rs.getString("movie_length"));
				film.setImage(rs.getBytes("image"));
				film.setDescription(rs.getString("description"));
				return film;
			}
		});
	}

	@Override
	public List<Cinema> getCinemaList() {
		String sql = "select * from cinema";
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Cinema cinema = new Cinema();
				cinema.setId(rs.getInt("id"));
				cinema.setName(rs.getString("name"));
				cinema.setImage(rs.getBytes("image"));
				cinema.setAddress(rs.getString("address"));
				cinema.setDescription(rs.getString("description"));
				return cinema;
			}
		});
	}

	@Override
	public List<Hall> getHallList() {
		String sql = "select * from hall";
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Hall hall = new Hall();
				hall.setId(rs.getInt("id"));
				hall.setName(rs.getString("name"));

				return hall;
			}
		});
	}

	@Override
	public void inputSession(CinemaSession session) {
		String sql = "insert into session (film_id, cinema_id, hall_id, date, time, ticket_price) VALUES (:film_id, :cinema_id, :hall_id, :date, :time, :ticket_price)";
		MapSqlParameterSource paramMap = new MapSqlParameterSource();
		paramMap.addValue("film_id", session.getFilm_id());
		paramMap.addValue("cinema_id", session.getCinema_id());
		paramMap.addValue("hall_id", session.getHall_id());
		paramMap.addValue("date", session.getShow_date().toString());
		paramMap.addValue("time", session.getShow_time().toString());
		paramMap.addValue("ticket_price", session.getTicket_price());

		jdbcTemplate.update(sql, paramMap);

	}

}
