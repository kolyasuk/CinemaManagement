<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${film.name}</title>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<a href="/cinema/"> Домашня сторінка</a>
	<br>

	<div class="container film" style="width: 750px;">
		<div class="card" style="width: 750px;">
			<div class="card-body">
				<h3 class="mt-0">${film.name}</h3>
				<div class="media">

					<img class="mr-3" src="image/displayFilmImage?id=${film.id}"
						width="200" height="280" alt="Generic placeholder image">
					<div class="details">
						<span><b>Рік випуску:</b> ${film.year}</span><br> <span><b>Країна:</b>
							${film.country}</span><br> <span><b>Жанр:</b> ${film.genre}</span><br>
						<span><b>Тривалість:</b> ${film.movie_length}</span><br> <span><b>Режисер:</b>
							${film.director}</span><br>
					</div>
					<div class="media-body">
						<span>${film.description}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-btns" style="right: -85px;">
			<a class="btn btn-success" title="Додати фільм" href="newFilm">Новий</a>
			<a class="btn btn-primary" title="Редагувати фільм" href="editFilm?film_id=${film.id}">Редагувати</a>
		</div>
	</div>
</body>
</html>