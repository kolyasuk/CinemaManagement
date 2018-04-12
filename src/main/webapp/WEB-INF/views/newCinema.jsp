<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/cinema/"> Back</a>
	<form:form method="POST" commandName="cinema" action="addingCinema" enctype="multipart/form-data">
	
		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input path="name"  />
		<br>
		
		<form:label path="address">
			<spring:message text="Address:" />
		</form:label>
		<form:input path="address"/>
		<br>
		
		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea path="description"/>
		<br>
		
		<form:label path="image">
			<spring:message text="Image:" />
		</form:label>
		<input type="file" accept="image/*" name="file"/>
		
		<button type="submit" title="Click to add cinema">Insert</button>
	</form:form>
	
	
</body>
</html>