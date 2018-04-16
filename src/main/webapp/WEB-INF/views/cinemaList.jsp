<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cinema List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<a href="/cinema/">Home</a><br>
<h3 style="text-align: center;">Cinemas:  <a href="newCinema" title="Add cinema">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col">Name</th>
				<th scope="col">Address</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cinema" items="${cinemaList}">
				<tr>
					<th scope="row">${cinema.id}</th>
					<td><a href="cinemaDetails?cinema_id=${cinema.id}">${cinema.name}</a></td>
					<td>${cinema.address}</td>
					<td><a href="deleteCinema?cinema_id=${cinema.id}">Delete</a></td>
					<td><a href="editCinema?cinema_id=${cinema.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>