<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Add new session</title>
</head>
<body>
<a href="/cinema/">Home</a><br>
	<form:form method="POST" name="frmAddUser" commandName="session" action="/cinema/addOrEditSession">
		<div class="form-row">		
			<div class="col">
				<form:input path="id" name="id" value="${session.id}"></form:input>
			</div>
			<div class="col">
				<form:select class="form-control" path="film_id" name="filmName" title="Select film here">
					<c:forEach var="film" items="${filmList}">
						<option title="Click to select" <c:if test="${film.id == session.film_id}">selected style="color: red;" </c:if> value="${film.id}">${film.name}</option>
					</c:forEach>
				</form:select>
			</div>
			<div class="col">
				<form:select class="form-control" path="cinema_id" name="cinemaName" title="Select cinema here">
					<c:forEach var="cinema" items="${cinemaList}">

						<option title="Click to select" <c:if test="${cinema.id == session.cinema_id}">selected style="color: red;"</c:if> value="${cinema.id}">${cinema.name}</option>

					</c:forEach>
				</form:select>
			</div>
			<div class="col">
				<form:select class="form-control" path="hall_id"  name="hallName" title="Select hall here">
					<c:forEach var="hall" items="${hallList}">
						<c:if test="${true}">	<!-- show halls of current cinema -->
							<option title="Click to select" <c:if test="${hall.id == session.hall_id}">selected style="color: red;"</c:if> value="${hall.id}">${hall.name}</option>
						</c:if>
					</c:forEach>
				</form:select>
			</div>
			<div class="col">
				<input type="date" name="date" value="${session.show_date}"  title="Input date here">
			</div>
			<div class="col">
				<input type="time" name="time" value="${session.show_time}" title="Input time here">
			</div>
			<div class="col">
				<input type="number" name="ticket_price" value="${session.ticket_price}" step="1" title="Input price here">
			</div>


			<div class="col">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form:form>

</body>
</html>