<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
<title>Сеанси</title>
</head>
<body>

	<div class="container">
		<div class="container panel">
			<div class="row justify-content-end">
				<form class="form-inline" name="searchForm" action="search">
					<select class="select" name="searchField">
						<option value="all">-- Пошук по: --</option>
						<option value="film_name" style="color: #4CAF50;">Фільм</option>
						<option value="cinema_name" style="color: #f44336;">Кінотеатр</option>
						<option value="hall_name" style="color: #008CBA;">Зал</option>
					</select> <input class="form-control mr-sm-2" name="searchValue"
						type="search" placeholder="Пошук" aria-label="Search">
					<button class="button button-session my-2 my-sm-0" type="submit">Пошук</button>
				</form>
				<a href="newFilm" title="Додати фільм"><button class="button button-film">Додати фільм</button></a> 
				<a href="newCinema" title="Додати кінотеарт"><button class="button button-cinema">Додати кінотеарт</button></a>
				<a href="newHall" title="Додати зал"><button class="button button-hall">Додати зал</button></a>
			</div>
		</div>

		<h1 style="text-align: center;">
			Список <select onchange="location = this.value;">
				<option
					<c:if test="${requestScope['javax.servlet.forward.request_uri'] == '/cinema/'}">selected</c:if>
					value="/cinema/">Поточних</option>
				<option
					<c:if test="${requestScope['javax.servlet.forward.request_uri'] != '/cinema/'}">selected</c:if>
					value="allSessions">Усіх</option>
			</select> сесій:
		</h1>

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
		<a href="newSession/" title="Додати сесію"><button
				class="button button-session">Додати сесію</button></a>
		<nav aria-label="Page navigation example">
		<ul class="pagination">
			<h4>Сторінка:</h4>

			<c:if
				test="${pageCount => param[\"page_id\"] || param[\"page_id\"]==null}">
				<c:forEach var="number" begin="1" end="${pageCount}">
					<li class="page-item"><a class="page-link"
						href="?page_id=${number}">${number}</a></li>
				</c:forEach>
			</c:if>


			<c:if test="${pageCount <= param[\"page_id\"]}">
				<c:forEach var="number" begin="1" end="${param[\"page_id\"]}">
					<li class="page-item"><a class="page-link"
						href="?page_id=${number}">${number}</a></li>
				</c:forEach>
			</c:if>
		</ul>
		</nav>
	</div>
</body>
</html>
