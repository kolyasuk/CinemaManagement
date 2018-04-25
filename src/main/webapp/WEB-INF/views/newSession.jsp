<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/form-style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Нова сесію</title>
</head>
<body>
	<a href="/cinema/">Додому</a>
	<br>
	<div class="envelope">
		<div class="content">
			<div class="form-wrapper">
				<form:form method="POST" name="myForm" commandName="session"
					action="/cinema/processingSession">
					<div class="wrapper">
						<div class="col">
							<form:input path="id" cssStyle="visibility: hidden;"></form:input>
						</div>
						<div class="col">
							<form:label path="film_id" title="Поле для вибору фільму">
								<spring:message text="Фільм:" />
							</form:label>
							<form:select class="form-control" path="film_id"
								title="Поле для вводу фільму">
								<c:forEach var="film" items="${filmList}">
									<option title="Клікніть для вибору"
										<c:if test="${film.id == session.film_id}">selected style="color: red;" </c:if>
										value="${film.id}">${film.name}</option>
								</c:forEach>
							</form:select>
						</div>
						<br>
						<div class="col">
							<form:label path="cinema_id" title="Поле для вибору кінотеатру">
								<spring:message text="Кінотеатр:" />
							</form:label>
							<form:select class="form-control" path="cinema_id"
								title="Поле для вибору кінотеатру">
								<c:forEach var="cinema" items="${cinemaList}">

									<option title="Клікніть для вибору"
										<c:if test="${cinema.id == session.cinema_id}">selected style="color: red;"</c:if>
										value="${cinema.id}">${cinema.name}</option>

								</c:forEach>
							</form:select>
						</div>
						<br>
						<div class="col">
							<form:label path="hall_id" title="Поле для вибору залу">
								<spring:message text="Зал:" />
							</form:label>
							<form:select class="form-control" path="hall_id"
								title="Поле для вибору залу">
								<c:forEach var="hall" items="${hallList}">
									<c:if test="${true}">
										<!-- show halls of current cinema -->
										<option title="Клікніть для вибору"
											<c:if test="${hall.id == session.hall_id}">selected style="color: red;"</c:if>
											value="${hall.id}">${hall.name}</option>
									</c:if>
								</c:forEach>
							</form:select>
						</div>
						<br>
						<div class="row">
							<div class="col">
								<form:label path="show_date" for="date" title="Поле для вводу дати">
									<spring:message text="Дата:" />
								</form:label>
								<input type="date" name="date" id="date" value="${session.show_date}"
									title="Поле для вводу дати"><br>
									<span id="error0" class="error">Please, input
							correct date</span>
							</div>
							<div class="col">
								<form:label path="show_time" for="time" title="Поле для вводу часу">
									<spring:message text="Час:" />
								</form:label>
								<input type="time" name="time" id="time" value="${session.show_time}"
									title="Поле для вводу часу"><br>
									<span id="error1" class="error">Please, input
							correct time</span>
							</div>
						</div>
						<div class="col">
							<form:label path="ticket_price" for="ticket_price" title="Поле для вводу ціни квитка">
								<spring:message text="Ціна квитка:" />
							</form:label>
							<input type="number" name="ticket_price" id="ticket_price"
								value="${session.ticket_price}" step="1"
								title="Поле для вводу ціни квитка"><br>
									<span id="error2" class="error">Please, input
							correct price</span>
						</div>
						<br>
						<div class="col">
							<button class="submit" type="submit" class="btn btn-primary" title="Клікніть для вводу даних">Ввести</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
		const formElem = document.getElementsByName('myForm')[0];
		formElem.onsubmit = validate;

		function validate(event) {
			const dateElem = document.getElementsByName('date')[0].value.length;
		    const timeElem = document.getElementsByName('time')[0].value.length;
		    const priceElem = document.getElementsByName('ticket_price')[0].value;
		    
			if (dateElem < 1) {
				document.getElementById("error0").classList.add("show");
			}else document.getElementById("error0").classList.remove("show");
			
			if (timeElem < 1) {
				document.getElementById("error1").classList.add("show");
			}else document.getElementById("error1").classList.remove("show");
			
			if (priceElem <1) {
				document.getElementById("error2").classList.add("show");
			}else document.getElementById("error2").classList.remove("show");
			
			
			if(document.getElementsByClassName('show').length > 0){
				event.preventDefault();
			}
		}
	</script>

</body>
</html>