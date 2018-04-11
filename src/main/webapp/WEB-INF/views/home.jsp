<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Home</title>
</head>
<body>
	<h3 style="text-align: center;">Current sessions:  <a href="addSession/" title="Add session">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col"><a href="?order_by=film_name">Film </a><a href="#" title="Film list">▤</a> <a href="addFilm" title="Add film">+</a></th>
				<th scope="col">Cinema <a href="#" title="Cinema list">▤</a> <a href="#" title="Add cinema">+</a></th>
				<th scope="col">Hall <a href="#" title="Hall list">▤</a> <a href="#" title="Add hall">+</a></th>
				<th scope="col">Date</th>
				<th scope="col">Time</th>
				<th scope="col">Price</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<th scope="row">${item.id}</th>
					<td><a href="filmDetails?film_id=${item.film_id}">${item.film_name}</a></td>
					<td><a href="cinemaDetails?cinema_id=${item.cinema_id}">${item.cinema_name}</a></td>
					<td>${item.hall_name}</td>
					<td>${item.show_date}</td>
					<td>${item.show_time}</td>
					<td>${item.ticket_price}</td>
					<td><a href="deleteSession?session_id=${item.id}">Delete</a></td>
					<td><a href="editSession?session_id=${item.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
