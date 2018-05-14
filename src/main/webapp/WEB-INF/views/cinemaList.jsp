<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Список кінотеатрів</title>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<a href="/cinema/">Додому</a><br>
<h3 style="text-align: center;">Кінотеатри:  <a href="newCinema" title="Додати кінотеатр">+</a></h3>
	<table class="table table-hover" style="width: 80%; margin: auto;">
		<thead class="thead-dark">
			<tr >
				<th scope="col">id</th>
				<th scope="col">Назва</th>
				<th scope="col">Номер телефону</th>
				<th scope="col">Адреса</th>
				<th scope="col">Веб-сайт</th>
				<th scope="col">#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cinema" items="${cinemaList}">
				<tr>
					<th scope="row">${cinema.id}</th>
					<td><a href="cinemaDetails?cinema_id=${cinema.id}">${cinema.name}</a></td>
					<td>${cinema.telephone}</td>
					<td><a href="https://www.google.com/maps/place/${cinema.address}" target="_blank" title="Знайти ${cinema.name} на Google Maps">${cinema.address}</a> </td>
					<td><a href="${cinema.site}" target="_blank" title="Веб-сайт кінотеатру ${cinema.name}">${cinema.site}</a></td>
					<td><a href="deleteCinema?cinema_id=${cinema.id}" title="Видалити кінотеатр"><img alt="delete" width="24px"
								src="${context}/resources/img/delete-image.png"></a>
						<a href="editCinema?cinema_id=${cinema.id}" title="Редагувати кінотеатр"><img alt="edit" width="24px"
								src="${context}/resources/img/edit-image.png"></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>