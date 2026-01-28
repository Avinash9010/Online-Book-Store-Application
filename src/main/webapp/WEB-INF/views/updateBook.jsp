<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="updateBook" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>Book ID:</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>Book Name:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Book Description:</td>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<td>Book Price:</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>Upload Image:</td>
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