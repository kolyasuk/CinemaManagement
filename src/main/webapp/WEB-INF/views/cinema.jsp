<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cinema.name}</title>
</head>
<body>
	<a href="/cinema/">Додому</a>
	<a href="cinemaList" title="Список кінотеатрів">Список кінотеатрів</a>

	<div class="container">
		<div class="col-sm-6">
			<div class="card crd" style="width: 850px;">
				<img class="card-img-top"
					src="image/displayCinemaImage?id=${cinema.id}" alt="Card image cap">
				<div class="card-body">
					<h1 class="card-title">${cinema.name}</h1>
					<p class="card-text">${cinema.description}</p>
					<p class="card-text">
						<b>Телефон:</b> ${cinema.telephone}
					</p>
					<p class="card-text">
						<b>Адреса:</b> <a class="card-link"
							href="https://www.google.com/maps/place/${cinema.address}"
							target="_blank" title="Знайти ${cinema.name} на Google Maps">${cinema.address}</a>
					</p>
					<p class="card-text">
						<b>Веб-сайт:</b> <a class="card-link" href="${cinema.site}"
							target="_blank" title="Веб-сайт кінотеатру ${cinema.name}">${cinema.site}</a>
					</p>
					<div class="row my-btns">
					<a class="btn btn-success" title="Додати кінотеарт" href="newCinema">Новий</a>
					<a class="btn btn-primary" title="Редагувати кінотеарт" href="editCinema?cinema_id=${cinema.id}">Редагувати</a>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>