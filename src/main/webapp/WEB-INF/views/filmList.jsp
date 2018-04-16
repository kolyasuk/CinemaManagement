<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Film List</title>
</head>
<body>
<a href="/cinema/">Home</a><br>
<h3 style="text-align: center;">Films:  <a href="newFilm" title="Add film">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col">Name</th>
				<th scope="col">Year</th>
				<th scope="col">Director</th>
				<th scope="col">Country</th>
				<th scope="col">Length</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="film" items="${filmList}">
				<tr>
					<th scope="row">${film.id}</th>
					<td><a href="filmDetails?film_id=${film.id}">${film.name}</a></td>
					<td>${film.year}</td>
					<td>${film.director}</td>
					<td>${film.country}</td>
					<td>${film.movie_length}</td>
					<td><a href="deleteFilm?film_id=${film.id}">Delete</a></td>
					<td><a href="editFilm?film_id=${film.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>