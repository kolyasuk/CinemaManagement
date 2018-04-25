<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${context}/resources/css/form-style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Новий кінотеарт</title>
</head>
<body>
	<a href="/cinema/">Додому</a>
	<a href="cinemaList">Список кінотеатрів</a>
	<br>
	<div class="envelope">
		<div class="content">
			<div class="form-wrapper">
				<form:form method="POST" commandName="cinema"
					action="processingCinema" enctype="multipart/form-data"
					name="myForm">
					<div class="wrapper">

						<form:input path="id" cssStyle="visibility: hidden;" />
						<form:label path="name" title="Поле для вводу назви кінотеатру">
							<spring:message text="Назва кінотеатру:" />
						</form:label>
						<form:input path="name" title="Поле для вводу назви кінотеатру"/>
						<br> <span id="error0" class="error">Введіть коректну назву.</span>

						<form:label path="address" title="Поле для вводу адреси кінотеатру">
							<spring:message text="Адреса:" />
						</form:label>
						<form:input path="address" title="Поле для вводу адреси кінотеатру"/>
						<br> <span id="error1" class="error">Введіть адресу у форматі: *вул. Назва Вулиці, номер будинку, місто*</span>

						<form:label path="description" title="Поле для вводу опису кінотеатру">
							<spring:message text="Опис:" />
						</form:label>
						<form:textarea cols="50" rows="10" path="description" title="Поле для вводу опису кінотеатру"/>
						<br> <span id="error2" class="error">Опис повинен бути між 15 та 600 символами</span> <img alt="cinema"
							<c:if test="${cinema.id == 0}">class="hide-cinema-image"</c:if>
							id="image"
							<c:if test="${cinema.id != 0}">class="show-cinema-image" src="image/displayCinemaImage?id=${cinema.id}"</c:if>>
						<br>
						
						<form:label path="site" title="Поле для вводу веб-сайту кінотеатру">
							<spring:message text="Веб-сайт:" />
						</form:label>
						<form:input path="site" title="Поле для вводу веб-сайту кінотеатру"/>
						<br> <span id="error3" class="error">Введіть сайт.</span>
						
						<form:label path="telephone" title="Поле для вводу телефону кінотеатру">
							<spring:message text="Телефон:" />
						</form:label>
						<form:input path="telephone" title="Поле для вводу телефону кінотеатру"/>
						<br> <span id="error4" class="error">Введіть коректний номер телефону.</span>

						<form:label for="file"  path="image" title="Поле для вводу зображення кінотеатру">
							<spring:message text="Зображення:" />
						</form:label>
						<input class="submit" type="file" accept="image/*" name="file" id="file"
							onchange="loadFile(event)" title="Поле для вводу зображення кінотеатру"/> <br> <span id="error5"
							class="error">Виберіть зображення.</span>

						<button type="submit" class="submit" title="Клікніть для вводу даних">Ввести</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		const formElem = document.getElementsByName('myForm')[0];
		formElem.onsubmit = validate;
		const imageElem = document.getElementById("image");

		var loadFile = function(event) {
			var output = document.getElementById('image');
			output.src = URL.createObjectURL(event.target.files[0]);
			document.getElementById("image").classList.add("show-cinema-image");
			document.getElementById("image").classList.remove("hide-cinema-image");
		};

		function validate(event) {
			const nameElem = document.getElementsByName('name')[0].value.length;
		    const addressElem = document.getElementsByName('address')[0].value.length;
		    const descElem = document.getElementsByName('description')[0].value.length;
		    const siteElem = document.getElementsByName('site')[0].value.length;
		    const telephoneElem = document.getElementsByName('telephone')[0].value.length;
		    const fileElem = document.getElementById("image");
		    
			if (nameElem < 3 || nameElem > 15) {
				document.getElementById("error0").classList.add("show");
			}else document.getElementById("error0").classList.remove("show");
			
			if (addressElem < 25 || addressElem > 65) {
				document.getElementById("error1").classList.add("show");
			}else document.getElementById("error1").classList.remove("show");
			
			if (descElem < 15 || descElem > 300) {
				document.getElementById("error2").classList.add("show");
			}else document.getElementById("error2").classList.remove("show");
			
			if (siteElem < 4 || nameElem > 64) {
				document.getElementById("error3").classList.add("show");
			}else document.getElementById("error3").classList.remove("show");
			
			if (telephoneElem < 10 || nameElem > 13) {
				document.getElementById("error4").classList.add("show");
			}else document.getElementById("error4").classList.remove("show");
			
			if (fileElem.classList.contains("hide-cinema-image")) {
				document.getElementById("error5").classList.add("show");
			}else document.getElementById("error5").classList.remove("show");
			
			if(document.getElementsByClassName('show').length > 0){
				event.preventDefault();
			}
		}
	</script>
</body>
</html>