<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/cinema/"> Back</a>
	<form:form method="POST" commandName="hall" action="addingHall">
	
		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input path="name"  />
		<br>
		
		<form:label path="floor">
			<spring:message text="Floor:" />
		</form:label>
		<form:input path="floor" type="number"/>
		<br>
		
		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea path="description"/>
		<br>

		<form:label path="cinema_id">
			<spring:message text="Cinema:" />
		</form:label>
		<form:select class="form-control" path="cinema_id" name="cinema" title="Select cinema here">
			<c:forEach var="cinema" items="${cinemaList}">
				<option title="Click to select" <c:if test="${cinema.id == hall.cinema_id}">selected style="color: red;"</c:if> value="${cinema.id}">${cinema.name}</option>
			</c:forEach>
		</form:select>
		<br>

		<button type="submit" title="Click to add hall">Insert</button>
	</form:form>

</body>
</html>