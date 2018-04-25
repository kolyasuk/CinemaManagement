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
	href="${context}/resources/css/form-style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Новий фільм</title>
</head>
<body>
	<a href="/cinema/">Додому</a>
	<a href="filmList">Список фільмів</a>
	<br>
	<div class="envelope">
		<div class="content">
			<div class="form-wrapper">
				<form:form name="filmForm" action="processingFilm"
					commandName="film" enctype="multipart/form-data" method="POST">
					<div class="wrapper">
						<form:input path="id" cssStyle="visibility: hidden;" />
						<form:label path="name" title="Поле для вводу назви фільму">
							<spring:message text="Назва:" />
						</form:label>
						<form:input path="name" name="name" title="Поле для вводу назви фільму" />
						<br> <span id="error0" class="error">Введіть ім'я.</span>

						<form:label path="year" title="Поле для вводу року виходу фільму">
							<spring:message text="Рік виходу:" />
						</form:label>
						<form:input path="year" name="year" title="Поле для вводу року виходу фільму"/>
						<br> <span id="error1" class="error">Введіть правильний рік.</span>
							
						<form:label path="genre" title="Поле для вводу жанру фільму">
							<spring:message text="Жанр:" />
						</form:label>
						<form:input path="genre" name="genre" title="Поле для вводу жанру фільму"/>
						<br> <span id="error2" class="error">Введіть жанр.</span>

						<form:label path="director" title="Поле для вводу режисеру фільму">
							<spring:message text="Режисер:" />
						</form:label>
						<form:input path="director" name="director" title="Поле для вводу режисеру фільму"/>
						<br> <span id="error3" class="error">Введіть режисера.</span>

						<form:label path="country" title="Поле для вводу країни фільму">
							<spring:message text="Країна:" />
						</form:label>
						<form:input path="country" name="country" title="Поле для вводу країни фільму"/>
						<br> <span id="error4" class="error">Введіть країну.</span>

						<form:label path="description" title="Поле для вводу опису фільму">
							<spring:message text="Опис:" />
						</form:label>
						<form:textarea cols="50" rows="10" path="description"
							name="description" title="Поле для вводу опису фільму" />
						<br> <span id="error5" class="error">Опис повинен містити не менше 15 символів.</span>
						<form:label path="movie_length" title="Поле для вводу тривалості фільму">
							<spring:message text="Тривалість фільму:" />
						</form:label>
						<form:input path="movie_length" name="movie_length" title="Поле для вводу тривалості фільму"/>
						<br> <span id="error6" class="error">Введіть правильну довжину у форматі: hh:mm:ss.</span> <img alt="film"
							<c:if test="${film.id == 0}">class="hide-film-image"</c:if>
							id="image"
							<c:if test="${film.id != 0}">class="show-film-image" src="image/displayFilmImage?id=${film.id}"</c:if>>
						<br>

						<form:label for="file" path="image" title="Поле для вводу банеру фільму">
							<spring:message text="Зображення:" />
						</form:label>
						<input class="submit" type="file" accept="image/*" id="file" name="file"
							onchange="loadFile(event)" title="Поле для вводу банеру фільму"/> <br> <span id="error7"
							class="error">Завантажте зображення.</span>

						<button class="submit" type="submit" title="Клікніть для вводу даних">
							<spring:message text="Ввести" />
						</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>




	<script type="text/javascript">
		const formElem = document.getElementsByName('filmForm')[0];
		formElem.onsubmit = validate;
		const imageElem = document.getElementById("image");

		var loadFile = function(event) {
			var output = document.getElementById('image');
			output.src = URL.createObjectURL(event.target.files[0]);
			document.getElementById("image").classList.add("show-film-image");
			document.getElementById("image").classList
					.remove("hide-film-image");
		};
		function validate(event) {
			const nameElem = document.getElementsByName('name')[0].value.length;
			const yearElem = document.getElementsByName('year')[0].value;
			const genreElem = document.getElementsByName('genre')[0].value.length;
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
			
			if (genreElem < 4) {
				document.getElementById("error2").classList.add("show");
			} else
				document.getElementById("error2").classList.remove("show");

			if (directorElem < 2) {
				document.getElementById("error3").classList.add("show");
			} else
				document.getElementById("error3").classList.remove("show");

			if (countryElem < 2) {
				document.getElementById("error4").classList.add("show");
			} else
				document.getElementById("error4").classList.remove("show");

			if (descriptionElem < 15) {
				document.getElementById("error5").classList.add("show");
			} else
				document.getElementById("error5").classList.remove("show");

			if (movie_lengthElem.length != 8 || movie_lengthElem == "00:00:00") {
				document.getElementById("error6").classList.add("show");
			} else
				document.getElementById("error6").classList.remove("show");

			if (fileElem.classList.contains("hide-film-image")) {
				document.getElementById("error7").classList.add("show");
			} else {
				document.getElementById("error7").classList.remove("show");
			}

			if (document.getElementsByClassName('show').length > 0) {
				event.preventDefault();
			}
		}
	</script>

</body>
</html>