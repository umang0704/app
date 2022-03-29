
<%@page import="java.io.OutputStream"%>
<%@page import="com.eea.models.Account"%>
<%@page import="com.eea.models.AccountDetails"%>
<%@page import="java.util.Map"%>
<%@page import="com.eea.dto.response.BaseResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setMaxInactiveInterval(300);
Integer accountId = (Integer) session.getAttribute("accountId");
if (accountId != null) {
	BaseResponse baseResponse = (BaseResponse) request.getAttribute("baseResponse");
	if (baseResponse != null) {
		Map<String, Object> data = (Map<String, Object>) baseResponse.getData();
		AccountDetails accountDetails = (AccountDetails) data.get("accountDetails");
		Account account = accountDetails.getAccount();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="../views/css/profileSettings.css" />
<title>EEA | <%=account.getAccountName()%></title>
</head>
<body>
	<div class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-light bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="/eea/index">E-Election Assist</a> <a
					class="navbar-brand"
					href="/eea/home/<%=session.getAttribute("accountId")%>">Home</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" action="/logout">
						<button class="btn btn-danger" type="submit">Log Out</button>
					</form>
				</div>
			</div>
		</nav>
	</div>
	<!--  Message -->
	<%
	if (baseResponse.getMessage() != null && !baseResponse.getMessage().isEmpty()) {
	%>
	<div
		class="alert alert-<%=baseResponse.getMessageType()%> alert-dismissible fade show"
		role="alert"><%=baseResponse.getMessage()%>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	}
	%>
	<!-- Body -->
	<div class="container-fluid d-flex justify-content-center">
		<div class="card p-1 m-4">
			<div class="row updateDetails d-flex justify-content-center">
				<div class="formHeading col-12 m-1 d-flex justify-content-center">
					<h1>Update Profile Details</h1>
				</div>
				<div class="formDiv col-12">
					<form action="/eea/update" method="post"
						class="updateForm form m-2" enctype="multipart/form-data">
						<div class="form-group d-flex justify-content-center">
							<div class="d-flex justify-content-center align-items-center">
								<label for="selectPic"> <img class="btn-outline-danger"
									src="../static/add-image.png" alt="Add Image" />
								</label> <input name="accountImage" id="selectPic" type="file"
									class="profilePicture" onchange="loadFile(event)"
									accept="image/*" />
							</div>

							<button id="modalImage" type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#exampleModal"
								style="display: none"></button>
							<label for="modalImage"> <img class="rounded-circle"
								style="width: 70px !important; height: 70px !important"
								src="/eea/accountImage/<%=account.getAccountId()%>" alt="" /></label>
								
								<p class="d-flex justify-content-center">
									<img id="output" class="rounded-circle "style="width:70px;height:70px" />
								</p>
						</div>

						<div class="form-group p-1">
							<label for="email">Email</label> <input name="accountEmail"
								type="email" class="form-control"
								value="<%=account.getAccountEmail()%>" disabled />
						</div>
						<div class="form-group p-1">
							<label for="name">Name</label> <input name="accountName"
								type="text" class="form-control"
								value="<%=account.getAccountName()%>" />
						</div>
						<div class="form-group p-1">
							<label for="name">About</label> <input name="about" type="text"
								class="form-control" value="<%=accountDetails.getAbout()%>" />
						</div>
						<div class="d-flex justify-content-center">
							<button class="btn btn-outline-success" type="submit">Update</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<div class="container-fluid p-0">
		<div class="container">
			<footer class="py-3 my-4">
				<ul class="nav justify-content-center border-bottom pb-3 mb-3">
					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">Home</a></li>
<!-- 					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">Features</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">Pricing</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">FAQs</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">About</a></li> -->
				</ul>
				<p class="text-center text-muted">© 2021 Company, Inc</p>
			</footer>
		</div>
	</div>

	<!--  Modals-->
	<!--  Profile Image Modals-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><%=account.getAccountName()%></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body d-flex justify-content-center">
					<img style="width: 200px !important" alt=""
						src="/eea/accountImage/<%=account.getAccountId()%>">

				</div>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript; choose one of the two! -->


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

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
	<!--  Custom Script-->
	<script>
		var loadFile = function(event) {
			var image = document.getElementById('output');
			image.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>
</body>
</html>
<%
}
}
%>
