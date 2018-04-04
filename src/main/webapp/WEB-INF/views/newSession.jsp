<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" name="frmAddUser" action="/cinema/inputingSession">
		<div class="form-row">
			<div class="col">
				<select class="form-control" name="film">
					<c:forEach var="film" items="${filmList}">
						<option value="${film.id}">${film.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col">
				<select class="form-control" name="cinema">
					<c:forEach var="cinema" items="${cinemaList}">
						<option value="${cinema.id}">${cinema.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col">
				<select class="form-control" name="hall">
					<c:forEach var="hall" items="${hallList}">
						<option value="${hall.id}">${hall.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col">
				<input type="date" name="date">
			</div>
			<div class="col">
				<input type="time" name="time">
				</p>
			</div>
			<div class="col">
				<input type="number" value="35" name="ticket_price" step="1">
			</div>


			<div class="col">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>


		</div>
	</form>
</body>
</html>