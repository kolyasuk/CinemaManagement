<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Список фільмів</title>
</head>
<body>
<a href="/cinema/">Додому</a><br>
<h3 style="text-align: center;">Фільми:  <a href="newFilm" title="Додати фільм">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col">Назва</th>
				<th scope="col">Рік</th>
				<th scope="col">Жанр</th>
				<th scope="col">Режисер</th>
				<th scope="col">Країна</th>
				<th scope="col">Тривалість</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="film" items="${filmList}">
				<tr>
					<th scope="row">${film.id}</th>
					<td><a href="filmDetails?film_id=${film.id}">${film.name}</a></td>
					<td>${film.year}</td>
					<td>${film.genre}</td>
					<td>${film.director}</td>
					<td>${film.country}</td>
					<td>${film.movie_length}</td>
					<td><a href="deleteFilm?film_id=${film.id}" title="Видалити фільм"><img alt="delete" width="24px"
								src="${context}/resources/img/delete-image.png"></a>
						<a href="editFilm?film_id=${film.id}" title="Редагувати фільм"><img alt="edit" width="24px"
								src="${context}/resources/img/edit-image.png"></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>