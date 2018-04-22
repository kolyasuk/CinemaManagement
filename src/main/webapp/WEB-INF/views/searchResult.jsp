<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Search result</title>
</head>
<body>
<a href="/cinema/">Home</a><br>
<h1 style="text-align: center;">Знайдені сесії(${fn:length(list)}):</h1>
	<div class="container">
		<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">id</th>
						<th scope="col">Фільм <a href="filmList"
							title="Список фільмів"><img width="16px"
								src="${context}/resources/img/film-list-image.png"></a></th>
						<th scope="col">Кінотеатр <a href="cinemaList"
							title="Список кінотеатрів"><img width="16px"
								src="${context}/resources/img/cinema-list-image.png"></a></th>
						<th scope="col">Зал <a href="hallList" title="Список залів"><img
								width="16px" src="${context}/resources/img/hall-list-image.png"></a></th>
						<th scope="col">Дата</th>
						<th scope="col">Час</th>
						<th scope="col">Ціна квитка</th>
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
							<td><a href="deleteSession?session_id=${item.id}"
								title="Видалити сесію"><img alt="delete" width="24px"
									src="${context}/resources/img/delete-image.png"></a> <a
								href="editSession?session_id=${item.id}" title="Редагувати сесію"><img
									alt="edit" width="24px"
									src="${context}/resources/img/edit-image.png"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

</body>
</html>