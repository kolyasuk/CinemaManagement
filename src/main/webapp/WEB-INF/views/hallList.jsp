<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hall List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<a href="/cinema/">Home</a><br>
<h3 style="text-align: center;">Halls:  <a href="newHall" title="Add hall">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col">Name</th>
				<th scope="col">Floor</th>
				<th scope="col">Description</th>
				<th scope="col">Cinema_id</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="hall" items="${hallList}">
				<tr>
					<th scope="row">${hall.id}</th>
					<td>${hall.name}</td>
					<td>${hall.floor}</td>
					<td>${hall.description}</td>
					<td>${hall.cinema_id}</td>
					<td><a href="deleteHall?hall_id=${hall.id}">Delete</a></td>
					<td><a href="editHall?hall_id=${hall.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>