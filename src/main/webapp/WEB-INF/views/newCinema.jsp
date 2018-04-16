<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new cinema</title>
</head>
<body>
	<a href="/cinema/">Home</a><a href="cinemaList">Cinema List</a>
	<br>
	<form:form method="POST" commandName="cinema" action="addingCinema"
		enctype="multipart/form-data" name="myForm">

		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input path="name" />
		<br>
		<span id="error0" class="error">Name must be between 3 and 15.</span>

		<form:label path="address">
			<spring:message text="Address:" />
		</form:label>
		<form:input path="address" />
		<br>
		<span id="error1" class="error">Please, input correct address
			like: *вул. Назва Вулиці, номер будинку, місто*</span>

		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea path="description" />
		<br>
		<span id="error2" class="error">Description must be between 15
			and 150.</span>

		<form:label path="image">
			<spring:message text="Image:" />
		</form:label>
		<input type="file" accept="image/*" name="file" />
		<br>
		<span id="error3" class="error">Please, input image!</span>

		<button type="submit" title="Click to add cinema">Insert</button>
	</form:form>

	<script type="text/javascript">
		const formElem = document.getElementsByName('myForm')[0];
		formElem.onsubmit = validate;

		function validate(event) {
			const nameElem = document.getElementsByName('name')[0].value.length;
		    const addressElem = document.getElementsByName('address')[0].value.length;
		    const descElem = document.getElementsByName('description')[0].value.length;
		    const fileElem = document.getElementsByName('file')[0].value.length;
		    
			if (nameElem < 3 || nameElem > 15) {
				document.getElementById("error0").classList.add("show");
			}else document.getElementById("error0").classList.remove("show");
			
			if (addressElem < 25 || addressElem > 65) {
				document.getElementById("error1").classList.add("show");
			}else document.getElementById("error1").classList.remove("show");
			
			if (descElem < 15 || descElem > 150) {
				document.getElementById("error2").classList.add("show");
			}else document.getElementById("error2").classList.remove("show");
			
			if (fileElem < 1) {
				document.getElementById("error3").classList.add("show");
			}else document.getElementById("error3").classList.remove("show");
			
			if(document.getElementsByClassName('show').length > 0){
				event.preventDefault();
			}
		}
	</script>
</body>
</html>