<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cinema.name}</title>
</head>
<body>
	<a href="/cinema/"> Back</a><br>
	${cinema.name}<br>
	<img alt="cinema" src="image/displayCinemaImage?id=${cinema.id}" width="600" height="300"><br>
	${cinema.address}<br>
	${cinema.description}
</body>
</html>