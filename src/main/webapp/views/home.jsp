<%@page import="com.eea.models.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.eea.models.Account"%>
<%@page import="com.eea.models.AccountDetails"%>
<%@page import="java.util.Map"%>
<%@page import="com.eea.dto.response.BaseResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setMaxInactiveInterval(300);
BaseResponse baseResponse = (BaseResponse) request.getAttribute("baseResponse");
if (baseResponse != null) {
	Map<String, Object> map = (Map<String, Object>) baseResponse.getData();
	AccountDetails accountDetails = (AccountDetails) map.get("accountDetails");
	if (accountDetails != null) {
		Account account = accountDetails.getAccount();
		session.setAttribute("accountId", account.getAccountId());
		String name = account.getAccountName();
		Integer followers = accountDetails.getFollowers();
		if (followers == null)
	followers = 0;
		Integer profileViews;
		String about = "";
		if(accountDetails.getAbout()!=null) about = accountDetails.getAbout();
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

<title>EEA | <%=name%></title>
</head>
<body>
	<div class="container-fluid p-0"> 
        <nav class= "navbar navbar-expand-lg navbar-light bg-primary">
          <div class="container-fluid d-flex justify-content-between">
          	<div >
                <a class="navbar-brand" href="/eea/index">E-Election Assist</a>
                <a class="navbar-brand" href="/eea/home/<%=account.getAccountId()%>">Home</a>
          	</div>
            <form class="d-flex" action="/eea/logout">
                <button class="btn btn-danger" type="submit">Log Out</button>
            </form> 
          </div>
        </nav>
      </div>
	<!-- Body -->
	<div class="container-fluid p-0">
		<div class="row">
			<!-- Profile Card -->
			<div class="col-3">
				<div class="card m-3" style="width: 18rem;">
					<div class="d-flex justify-content-around align-items-center p-2">
						<div>
							<button id="modalImage" type="button" data-toggle="modal"
								data-target="#profilePicModal" style="display: none"></button>
							<label for="modalImage"> <img class="rounded-circle"
								style="width: 70px !important; height: 70px !important"
								src="/eea/accountImage/<%=account.getAccountId()%>" alt="..." />
							</label>
						</div>
						<div class="d-flex justify-content-center">
							<h5><%=name%></h5>
						</div>
					</div>
					<hr> 
						<div class="row  d-flex justify-content-center"
							style="width: 15rem;">
							<div class="col-12 text-center" style="width: 15rem;">
								<h5>About</h5>
							</div>
							<div class="col-12 d-flex justify-content-end">
								<p style="overflow-wrap: break-word; word-wrap: break-word; hyphens: auto;"><%=about%></p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-8 text-center">
								<h5>Followers</h5>
							</div>
							<div class="col-2">
								<p class="btn btn-light"><%=followers%></p>
							</div>
						</div>
						<div class="row">
							<div class="col-8 text-center">
								<h5>Profile Views</h5>
							</div>
							<div class="col-2">
								<p class="btn btn-light">-</p>
							</div>
						</div> 
					<hr>
					<div class="row d-flex">
						<div class="col-12 m-1 d-flex justify-content-center">
							<form action="/eea/accountSetting" method="post">
								<button class="btn btn-outline-primary"
									style="width: 150px !important">Account Setting</button>
							</form>
						</div>
						<div class="col-12 m-1 d-flex justify-content-center">
							<form action="/eea/profile" method="post">
								<button class="btn btn-outline-primary"
									style="width: 150px !important">Profile Setting</button>
							</form>
						</div>
						<div class="col-12 m-1 d-flex justify-content-center">
							<%
							session.setAttribute("accountId", account.getAccountId());
							%>
							<a href="/eea/posts" class="btn btn-outline-primary"
								style="width: 150px !important">My Posts</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-9">
				<div class="createPost col-12 d-flex justify-content-center"
					style="width: 100%;">
					<form action="/eea/createPost" method="post" class="createPost m-2"
						enctype="multipart/form-data" style="width: 100%">
						<textarea name="text" class="postContent form-control m-1"
							style="resize: none; width: 80%;"></textarea>
						<input name="image" type="file" id="image" class="uploadImage"
							style="display: none;" onchange="loadFile(event)"
							accept="image/*"> <label for="image"><img
							for="addImage" src="/static/add-image.png" alt=""></label>
						<button class="post btn btn-success m-1" type="submit">Post</button>
						<p class="d-flex justify-content-center">
							<img id="output"/>
						</p>
					</form>
				</div>
				<div class="col-12">
					<div class="allPosts m-1"
						style="border-width: 1px; width: 80%; height: 600px; overflow-y: auto;">

						<!--  Single Post 1-->
						<%
						Post post = (Post) map.get("createdPost");
						if (post != null) {
						%>
						<div class="singlePost m-2 p-2"
							style="border: solid; border-width: 1px; border-radius: 10px;">
							<div class="row">
								<div class="col-12">
									<div class="row">
										<div class="col-1">
											<div>
												<img src="/eea/accountImage/<%= post.getAccountDetails().getAccount().getAccountId() %>"
													class="profile-image card-img-top rounded-circle" alt="...">
											</div>
										</div>
										<div class="col-10">
											<div class="row">
												<div class="col-12">
													<h5><%=post.getAccountDetails().getAccount().getAccountName()%>
													</h5>
												</div>
												<p><%=post.getTimestamp().toString().substring(0, 10) + " | " + post.getTimestamp().toString().substring(11, 19)%></p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
								<p><%=post.getText()%></p>
							</div>
							<%
							if (post.getImage() != null) {
							%>
							<div class="col-12 d-flex justify-content-center">
								<div class="img">
									<img class="postImage"
										src="/eea/postImage/<%=post.getPostId()%>" alt=""
										style="width: 500px;">
								</div>
							</div>
							<%
							}
							%>

							<div class="col-12 m-2">
								<div class="row d-flext jystify-content-around">
									<div class="col-1 d-flex ">
										<div class="row">
											<div class="col-12">
												<a href=""> <img src="/static/like.png" alt="">
												</a>
											</div>
											<div class="col-12">
												<a href=""> <img src="/static/comment.png" alt="">
												</a>
											</div>
										</div>
									</div>
									<div class="col-10 ">
										<form action="" class="comment">
											<div class="row d-flex justify-content-around">
												<div class="col-10">
													<input type="text" class="commentText"
														style="width: 100%; height: 50px;">
												</div>
												<div class="col-1">
													<button class="postCommentBtn m-1"
														style="border: none; background-color: white;">
														<img src="/static/post.png" alt="">
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<%
						}
						%>
						<!-- Single Post 2 Begin -->

						<div class="singlePost m-2 p-2"
							style="border: solid; border-width: 1px; border-radius: 10px;">
							<div class="row">
								<div class="col-12">
									<div class="row">
										<div class="col-1">
											<div>
												<img src="https://source.unsplash.com/70x70/?profilepicture"
													class="profile-image card-img-top rounded-circle" alt="...">
											</div>
										</div>
										<div class="col-10">
											<div class="row">
												<div class="col-12">
													<h5>Umang Yadav</h5>
												</div>
												<p>March 12, 2022 | 10:00pm</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
								<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
									Possimus iusto minima, itaque temporibus ex, ea reprehenderit
									libero omnis ad obcaecati voluptatum, quod porro. Libero error
									maiores ut. Explicabo, magni? Ratione?</p>
							</div>
							<div class="col-12 d-flex justify-content-center">
								<div class="img">
									<img class="postImage"
										src="https://source.unsplash.com/1000x700/?post" alt=""
										style="width: 500px;">
								</div>
							</div>
							<div class="col-12 m-2">
								<div class="row d-flext jystify-content-around">
									<div class="col-1 d-flex ">
										<div class="row">
											<div class="col-12">
												<a href=""> <img src="/static/like.png" alt="">
												</a>
											</div>
											<div class="col-12">
												<a href=""> <img src="/static/comment.png" alt="">
												</a>
											</div>
										</div>
									</div>
									<div class="col-10 ">
										<form action="" class="comment">
											<div class="row d-flex justify-content-around">
												<div class="col-10">
													<input type="text" class="commentText"
														style="width: 100%; height: 50px;">
												</div>
												<div class="col-1">
													<button class="postCommentBtn m-1"
														style="border: none; background-color: white;">
														<img src="/static/post.png" alt="">
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Single Post Begin -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid p-0">
		<div class="container">
			<footer class="py-3 my-4">
				<ul class="nav justify-content-center border-bottom pb-3 mb-3">
					<li class="nav-item"><a href="#"
						class="nav-link px-2 text-muted">Home</a></li>
					<!-- 		<li class="nav-item"><a href="#"
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
	<!--  Profile Picture-->
	<div class="modal fade" id="profilePicModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<img class="rounded-circle" style="width: 200px !important" alt=""
						src="/eea/accountImage/<%=account.getAccountId()%>">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript; choose one of the two! -->

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
	<!-- Custom Java Script -->
	<script>
		var loadFile = function(event) {
			var image = document.getElementById('output'); 
			image.src = URL.createObjectURL(event.target.files[0]);
			image.height = "200";
		};
	</script>

</body>
</html>
<%
}
} else {
BaseResponse baseResponse2 = new BaseResponse();
baseResponse2.setMessage("Check Credentials.");
baseResponse2.setMessageType("danger");
session.setAttribute("baseResponse", baseResponse2);
response.sendRedirect("/eea/index");
}
%>

