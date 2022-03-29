<%@page import="com.eea.models.Account"%>
<%@page import="com.eea.models.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.eea.dto.response.BaseResponse"%>
<%@page import="com.eea.models.AccountDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<% 
	AccountDetails accountDetails = (AccountDetails)session.getAttribute("accountDetails");
	if(accountDetails!=null){
		Account account = accountDetails.getAccount();
		session.setAttribute("accountId", account.getAccountId());
		List<Post> posts = accountDetails.getAccountPost();
		Integer followers = 0;
		if(accountDetails.getFollowers()!=null) followers=accountDetails.getFollowers();
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>EEA | <%= account.getAccountName() %></title>
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
      <!-- body - start -->
      <div class="container-fluid p-0">
        <div class="row">
            <!-- Profile Card -->
            <div class="col-3">
                <div class="card m-3" style="width: 18rem;">
                    <div class="d-flex justify-content-around align-items-center p-2">
                        <div>
                            <img src="/eea/accountImage/<%=account.getAccountId()%>" class="profile-image card-img-top rounded-circle" alt="..." style="
                            	width:70px !important;
                            	height:70px !important">
                        </div>
                        <div class="d-flex justify-content-center">
                            <h5><%= account.getAccountName() %></h5>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div class="row">
                            <div class="col-8 text-center">
                                <h5>Followers</h5>
                            </div>
                            <div class="col-2">
                                <p class="btn btn-light"><%= followers %></p>
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
                            <a href="" class="btn btn-outline-primary" style="width:150px !important">Posts</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-9"> 
                <div class="col-12">
                    <div class="allPosts m-1" style="
                    border-width: 1px;
                    width:80%;
                    height:650px;
                    overflow-y: auto;">
                    <%
                    	for(Post post : posts){ 
                    %>
                    <!-- Single Posts -->
                        <div class="singlePost m-2 p-2" style="
                        border: solid;
                        border-width: 1px;
                        border-radius: 10px;">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-1">
                                            <div>
                                                <img src="/eea/accountImage/<%=account.getAccountId()%>/" class="profile-image card-img-top rounded-circle" alt="..." style="
                                                border-radius: 50%;
                                                width: 50px;">
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="row">
                                                <div class="col-12">
                                                    <h5><%= post.getAccountDetails().getAccount().getAccountName() %></h5>
                                                </div>
                                                <div class="col-12">
                                                    <p><%= post.getTimestamp().toString().substring(0,10)+" | "+post.getTimestamp().toString().substring(11,16)%></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-1"> 
                                            <form action="/eea/deletePost/<%=account.getAccountId() %>/<%=post.getPostId() %>" method="post">
                                                <button class="btn btn-outline-danger">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <p><%= post.getText() %></p>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                <%
                                	if(post.getImage()!=null){
                                %>
                                	<div class="img">
                                	
	                                	<button id="openPostImage<%=post.getPostId() %>" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myPostsModal<%=post.getPostId() %>"
										style="display: none"></button>
										<label for="openPostImage<%=post.getPostId() %>">
											<img class="postImage" src="/eea/postImage/<%=post.getPostId()%>" alt="" style="height:300px !important">
                                    	</label>
                                    </div>	
                            	<%
                                	}
                                %>
                                    
                                </div>
                                <div class="col-12 m-2">
                                    <div class="row d-flext jystify-content-around">
                                        <div class="col-1 d-flex ">
                                            <div class="row">
                                                <div class="col-12">
                                                    <a href="">
                                                        <img src="/static/like.png" alt="">
                                                    </a>
                                                </div>
                                                <div class="col-12">
                                                    <a href="">
                                                        <img src="/static/comment.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-10 ">
                                            <form action="" class="comment">
                                                <div class="row d-flex justify-content-around">
                                                    <div class="col-10"> 
                                                        <input type="text" class="commentText" style =" 
                                                        width:100%;
                                                        height: 50px;">
                                                    </div>
                                                    <div class="col-1">
                                                        <button class="postCommentBtn m-1" style="
                                                        border: none;
                                                        background-color: white;">
                                                            <img src="/static/post.png" alt="">
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div> 
                    	<!-- Single Post Ends  -->
                    	<!-- Single Post Modal - Start -->
                    	<%
                    		if(post.getImage()!=null){
                    	%>
                    	<div class="modal fade" id="myPostsModal<%=post.getPostId() %>" tabindex="-1"
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
										<img style="width: 300px !important" alt=""
											src="/eea/postImage/<%=post.getPostId()%>"> 
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
                    	<!-- Single Post Modal -  Ends -->
                    <%
                    		}}
                    %>
                    </div>
                </div>
            </div>
        </div> 
    </div>
      <!-- body - end -->

      <!-- footer - start -->
      <div class="container-fluid p-0">
        <div class="container">
          <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
              <li class="nav-item">
                <a href="/eea/index" class="nav-link px-2 text-muted">Home</a> 
            </ul>
            <p class="text-center text-muted">© 2022 E-Election Assist Company, Inc</p>
          </footer>
        </div>
      </div>
      <!-- footer - end -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
<%
	}else{
		BaseResponse baseResponse = new BaseResponse();
		baseResponse.setMessage("Session Timed Out! Please Log In Again.");
		baseResponse.setMessageType("danger");
		session.setAttribute("baseResponse", baseResponse);
		response.sendRedirect("/eea/index");
	}
%>
