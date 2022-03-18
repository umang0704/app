<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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

<title>EEA</title>
</head>
<body style="border: 0, margin: 0">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid m-4">
		<div class="row d-flex justify-content-around">
			<div class="col-8 d-flex justify-content-center align-items-center">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100 img-fluid rounded"
								src="https://source.unsplash.com/900x600/?india"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100 img-fluid rounded"
								src="https://source.unsplash.com/900x600/?modi"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100 img-fluid rounded"
								src="https://source.unsplash.com/900x600/?gandhi"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100 img-fluid rounded"
								src="https://source.unsplash.com/900x600/?india,politics"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<form class="p-2 m-4">
					<h1>Sign In</h1>
					<div class="form-group">
						<label for="exampleDropdownFormEmail2">Email address</label> <input
							type="email" class="form-control" id="exampleDropdownFormEmail2"
							placeholder="Enter Email">
					</div>
					<div class="form-group">
						<label for="exampleDropdownFormPassword2">Password</label> <input
							type="password" class="form-control"
							id="exampleDropdownFormPassword2" placeholder="Enter Password">
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"/>
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