<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EEA</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
</head>
<body>

	<div class="container mt-2">
		<h1>Log In</h1>
		<form action="/eea/loginAuth" method="post">
			<label class="form-label">Email </label> <input type="text"
				name="loginEmail" class="form-control" placeholder="Enter Email" />

			<label class="form-label">Password</label> <input type="text"
				name="loginPassword" class="form-control"
				placeholder="Enter Password" />

			<button type="submit" class="btn btn-primary">Submit</button>
			 
		</form>
		<a href="/eea/signUp" class="btn btn-primary">Sign Up</a>
		 <a href=""	class="btn btn-primary">Forgot Password.</a>
	</div>
</body>
</html>
