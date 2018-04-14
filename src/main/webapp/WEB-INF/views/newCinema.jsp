<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/cinema/">Home</a>
	<br>
	<form:form method="POST" commandName="cinema" action="addingCinema"
		enctype="multipart/form-data" name="myForm" onsubmit="return valid(event)">

		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input path="name" />
		<br>
		<form:errors path="name"></form:errors>
		<br>

		<form:label path="address">
			<spring:message text="Address:" />
		</form:label>
		<form:input path="address" />
		<br>
		<form:errors path="address"></form:errors>
		<br>

		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea path="description" />
		<br>
		<form:errors path="description"></form:errors>
		<br>

		<form:label path="image">
			<spring:message text="Image:" />
		</form:label>
		<input type="file" accept="image/*" name="file"/>
		<br>
		<span id="imageError"></span>
		<br>

		<button type="submit" title="Click to add cinema">Insert</button>
	</form:form>

	<script type="text/javascript">
		const formElem = document.getElementsByName('form')[0];
		var file = document.forms["myForm"]["file"];
		const formValues = [];

		function valid(event) {

			for(let i = 0; i < event.target.length - 1; i++) {
				formValues.push(event.target[i].value);
			}
				if(file.value.length < 1){ 
					 event.preventDefault();
					document.getElementById("imageError").innerText = "Insert image, please!";
	 			}else{
	 				document.getElementById("imageError").innerText = "";
					return;
				} 
	
 			
		}
	</script>
</body>
</html>