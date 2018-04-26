<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/form-style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Новий зал</title>
</head>
<body>
	<a href="/cinema/">Додому</a>
	<a href="hallList">Список залів</a>
	<br>
	<div class="envelope">
		<div class="content">
			<div class="form-wrapper">
				<form:form method="POST" commandName="hall" action="processingHall">
					<div class="wrapper">
						<form:input path="id" cssStyle="visibility: hidden;" />
						<form:label path="name" title="Поле для вводу назви залу">
							<spring:message text="Назва:" />
						</form:label>
						<form:input path="name" title="Поле для вводу назви залу"/>
						<br>
						<form:errors path="name" cssClass="error show"></form:errors>


						<form:label path="floor" title="Поле для вводу поверху залу">
							<spring:message text="Поверх:" />
						</form:label>
						<form:input path="floor" type="number" min="0" title="Поле для вводу поверху залу"/>
						<br>
						<form:errors path="floor" cssClass="error show"></form:errors>
						
						<form:label path="seats" title="Поле для вводу розміру залу">
							<spring:message text="Кількість місць:" />
						</form:label>
						<form:input path="seats" type="number" min="0" title="Поле для вводу розміру залу"/>
						<br>
						<form:errors path="seats" cssClass="error show"></form:errors>
						


						<form:label path="description" title="Поле для вводу опису залу">
							<spring:message text="Опис:" />
						</form:label>
						<form:textarea cols="50" rows="10" path="description" title="Поле для вводу опису залу"/>
						<br>
						<form:errors path="description" cssClass="error show"></form:errors>


						<form:label path="cinema_id" title="Виберіть кінотеатр">
							<spring:message text="Кінотеарт:" />
						</form:label>

						<form:select class="form-control" path="cinema_id" name="cinema"
							title="Виберіть кінотеатр">
							<option disabled selected value>-- select an option --</option>
							<c:forEach var="cinema" items="${cinemaList}">
								<option title="Клікніть для вибору"
									<c:if test="${cinema.id == hall.cinema_id}">selected style="color: red;"</c:if>
									value="${cinema.id}">${cinema.name}</option>
							</c:forEach>
						</form:select>
						<br>
						<form:errors path="cinema_id" cssClass="error show"></form:errors>


						<button class="submit" type="submit" title="Клікніть для вводу даних">Ввести</button>
							</div>
				</form:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
</script>


</body>
</html>