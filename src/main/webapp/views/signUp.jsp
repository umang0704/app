<%@page import="com.eea.dto.response.BaseResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
BaseResponse baseResponse = (BaseResponse) request.getAttribute("baseResponse");
%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Sign Up</title>
</head>
<body style="margin: 0; border: 0">

	<jsp:include page="header.jsp" />

	<div class="container-fliud">
		<%
		if (baseResponse.getMessage() != null && !baseResponse.getMessage().isEmpty()) {
		%>
		<div class="alert alert-<%= baseResponse.getMessageType() %> alert-dismissible fade show"
			role="alert"><%=baseResponse.getMessage() %>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
		}
		%>
		<div class="row">
			<div class="col-4"></div>

			<div class="col-4 m-4 p-3 bg-light rounded">
				<h1>Sign Up</h1>
				<form class="form p-3" action="/eea/createAccount" method="post"
					enctype="application/json">
					<div class="form-group btn-outline-primary border rounded p-2">
						<div class="d-flex justify-content-between">
							<label class="form-label">Political Entity <input
								class="form-control" type="radio" name="accountType"
								name="Political Entity" value="POLITICAL_ENTITY" /></label> <label
								for="Individual"> Individual <input class="form-control"
								type="radio" name="accountType" name="Individual"
								value="INDIVIDUAL" /></label>
						</div>
					</div>

					<div class="form-group">
						<label class="form-label">Name</label> <input class="form-control"
							type="text" name="accountName" placeholder="Enter Name." />
					</div>
					<div class="form-group">
						<label class="form-label">Email</label> <input
							class="form-control" type="text" name="accountEmail"
							placeholder="Enter Email." />
					</div>
					<div class="form-group">
						<label class="form-label">Password</label> <input
							class="form-control" type="password" name="accountPassword"
							placeholder="Enter Password." />
					</div>
					<div class="form-group">
						<label class="form-label">Confirm Password</label> <input
							class="form-control" type="password"
							name="accountConfirmPassword" placeholder="Re- Enter Password." />
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-outline-success" type="submit">Sign
							Up</button>
					</div>
				</form>
			</div>

			<div class="col-4"></div>
		</div>
	</div>

	<div class="container-fluid">
		<jsp:include page="footer.jsp" />
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>