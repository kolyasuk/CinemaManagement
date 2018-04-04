<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Film</title>
</head>
<body>
	<a href="/cinema/"> Back</a><br>
	<img alt="film" src="image/displayFilmImage?id=${film.id}" width="200" height="280"><br>
	${film.name}<br>
	${film.year}<br>
	${film.director}<br>
	${film.country}<br>
	${film.description}<br>
	${film.movie_length}<br>
</body>
</html>