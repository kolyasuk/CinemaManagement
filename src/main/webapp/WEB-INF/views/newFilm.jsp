<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new film</title>
</head>
<body>
	<a href="/cinema/">Home</a>
	<a href="filmList">Film List</a>
	<br>
	<form:form name="filmForm" action="processingFilm" commandName="film"
		enctype="multipart/form-data" method="POST">
		<form:input path="id" cssStyle="visibility: hidden;"/>
		<form:label path="name">
			<spring:message text="Name:" />
		</form:label>
		<form:input path="name" name="name" />
		<br>
		<span id="error0" class="error">Input name, please!</span>

		<form:label path="year">
			<spring:message text="Year:" />
		</form:label>
		<form:input path="year" name="year" />
		<br>
		<span id="error1" class="error">Input correct year.</span>

		<form:label path="director">
			<spring:message text="Director:" />
		</form:label>
		<form:input path="director" name="director" />
		<br>
		<span id="error2" class="error">Input director, please!</span>

		<form:label path="country">
			<spring:message text="Country:" />
		</form:label>
		<form:input path="country" name="country" />
		<br>
		<span id="error3" class="error">Input country, please!</span>

		<form:label path="description">
			<spring:message text="Description:" />
		</form:label>
		<form:textarea cols="50" rows="10" path="description"
			name="description" />
		<br>
		<span id="error4" class="error">Minimum size of description is
			15.</span>
		<form:label path="movie_length">
			<spring:message text="Length:" />
		</form:label>
		<form:input path="movie_length" name="movie_length" />
		<br>
		
		<span id="error5" class="error">Input correct length! Pattern:
			hh:mm:ss.</span>
			
		<img alt="film" <c:if test="${film.id == 0}">class="hide-film-image"</c:if> id="image"
			<c:if test="${film.id != 0}">class="show-film-image" src="image/displayFilmImage?id=${film.id}"</c:if>>
		<br>
		
		<form:label path="image">
			<spring:message text="Image:" />
		</form:label>
		<input type="file" accept="image/*" name="file" onchange="loadFile(event)" />
		<br>
		<span id="error6" class="error">Input image, please!</span>

		<button type="submit" title="Click to add film">
			<spring:message text="Insert" />
		</button>
	</form:form>




	<script type="text/javascript">
		const formElem = document.getElementsByName('filmForm')[0];
		formElem.onsubmit = validate;
		const imageElem = document.getElementById("image");

		var loadFile = function(event) {
			var output = document.getElementById('image');
			output.src = URL.createObjectURL(event.target.files[0]);
			document.getElementById("image").classList.add("show-film-image");
			document.getElementById("image").classList.remove("hide-film-image");
		};
		function validate(event) {
			const nameElem = document.getElementsByName('name')[0].value.length;
			const yearElem = document.getElementsByName('year')[0].value;
			const directorElem = document.getElementsByName('director')[0].value.length;
			const countryElem = document.getElementsByName('country')[0].value.length;
			const descriptionElem = document.getElementsByName('description')[0].value.length;
			const movie_lengthElem = document.getElementsByName('movie_length')[0].value;
			const fileElem = document.getElementById("image");

			if (nameElem < 1) {
				document.getElementById("error0").classList.add("show");
			} else
				document.getElementById("error0").classList.remove("show");

			if (yearElem < 1895) {
				document.getElementById("error1").classList.add("show");
			} else
				document.getElementById("error1").classList.remove("show");

			if (directorElem < 2) {
				document.getElementById("error2").classList.add("show");
			} else
				document.getElementById("error2").classList.remove("show");

			if (countryElem < 2) {
				document.getElementById("error3").classList.add("show");
			} else
				document.getElementById("error3").classList.remove("show");

			if (descriptionElem < 15) {
				document.getElementById("error4").classList.add("show");
			} else
				document.getElementById("error4").classList.remove("show");

			if (movie_lengthElem.length != 8 || movie_lengthElem == "00:00:00") {
				document.getElementById("error5").classList.add("show");
			} else
				document.getElementById("error5").classList.remove("show");

			if (fileElem.classList.contains("hide-film-image")) {
				document.getElementById("error6").classList.add("show");
			} else {
				document.getElementById("error6").classList.remove("show");
			}

			if (document.getElementsByClassName('show').length > 0) {
				event.preventDefault();
			}
		}
	</script>

</body>
</html>