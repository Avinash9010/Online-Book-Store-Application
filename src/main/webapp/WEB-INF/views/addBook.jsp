<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<form action="addBook" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>Name</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>Upload Image</td>
					<td><input type="file" name="image"></td>
				</tr>
				<tr>
					<td><input type="submit" name="b1"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>