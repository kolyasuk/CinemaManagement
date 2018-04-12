<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<a href="/cinema/"> Back</a>
	<br>
	<form:form name="filmForm" action="addingFilm" commandName="film"
		enctype="multipart/form-data" method="POST">
		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input cssClass="stle" path="name" name="name" />
		<br>
		<form:errors path="name" cssStyle="color:red;"></form:errors>
		<br>

		<form:label path="year">
			<spring:message text="Year:" />
		</form:label>
		<form:input cssClass="stle" path="year" name="year"/>
		<br>
		<form:errors path="year" cssStyle="color:red;"></form:errors>
		<br>

		<form:label path="director">
			<spring:message text="Director:" />
		</form:label>
		<form:input cssClass="stle" path="director" name="director" />
		<br>
		<form:errors path="director" cssStyle="color:red;"></form:errors>
		<br>

		<form:label path="country">
			<spring:message text="Country:" />
		</form:label>
		<form:input cssClass="stle" path="country" name="country"/>
		<br>
		<form:errors path="country" cssStyle="color:red;"></form:errors>
		<br>

		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea cols="50" rows="10" cssClass="stle" path="description" name="description"/>
		<br>
		<form:errors path="description" cssStyle="color:red;"></form:errors>
		<br>

		<form:label path="movie_length">
			<spring:message text="Length:" />
		</form:label>
		<form:input cssClass="stle" path="movie_length" name="movie_length" />
		<br>
		<form:errors path="movie_length" cssStyle="color:red;"></form:errors>
		<br>
		

		<form:label path="image">
			<spring:message text="Image:" />
		</form:label>
		<input type="file" accept="image/*" name="file"/>
		<br>

		<button type="submit" title="Click to add film" onclick="return validation()">
			<spring:message text="Insert" />
		</button>
	</form:form>


	<script type="text/javascript">
		function validation() {
			var a = 0;
			var name = document.forms["filmForm"]["name"].value;
			var year = document.forms["filmForm"]["year"].value;
			var director = document.forms["filmForm"]["director"].value;
			var country = document.forms["filmForm"]["country"].value;
			var description = document.forms["filmForm"]["description"].value;
			var movie_length = document.forms["filmForm"]["movie_length"].value;
			
			if (name.length>0 && year.length>0 && director.length>0 && country.length>0 && description.length>15 && movie_length.length>0) {
				var x = document.forms["filmForm"]["file"].value;
				if (x == null || x == "") {
					alert("Please, select film image");
					return false;
				}
			}
		}
	</script>

</body>
</html>