<%@page import="com.eea.models.Account"%>
<%@page import="com.eea.dto.response.BaseResponse"%>
<%@page import="com.eea.models.AccountDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
	session.setMaxInactiveInterval(300);
	AccountDetails accountDetails =(AccountDetails) session.getAttribute("accountDetails");
	if(accountDetails!=null){
		Account account = accountDetails.getAccount();
		session.setAttribute("accountId", account.getAccountId());
		Integer followers = 0;
		if(accountDetails.getFollowers()!=null) followers = accountDetails.getFollowers();
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
    <link rel="stylesheet" href="css/home.css">

    <title>EEA | <%= account.getAccountName() %></title>
  </head>
  <body>
  		
    <div class="container-fluid p-0">
      <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <div class="container-fluid">
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
    <%
		BaseResponse baseResponse2 = (BaseResponse) session.getAttribute("baseResponse");  
		if (baseResponse2!=null && baseResponse2.getMessage() != null && !baseResponse2.getMessage().isEmpty()) {
		%>
		<div
			class="alert alert-<%=baseResponse2.getMessageType()%> alert-dismissible fade show"
			role="alert"><%=baseResponse2.getMessage()%>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
		session.setAttribute("baseResponse", null);
		}
		%>
    <!-- Body -->
    <div class="container-fluid p-0">
        <div class="row">
            <!-- Profile Card -->
            <div class="col-3">
                <div class="card m-3" style="width: 18rem;">
                    <div class="d-flex justify-content-around align-items-center p-2">
                        <div>
                            <img src="/eea/accountImage/<%=account.getAccountId()%>" class="profile-image card-img-top rounded-circle" alt="..." style="
                            width:70px;
                            height:70px">
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
                                <p class="btn btn-light"><%=followers %></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 text-center">
                                <h5>Profile Views</h5>
                            </div>
                            <div class="col-2">
                                <p class="btn btn-light">0</p>
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
							<%
							session.setAttribute("accountId", account.getAccountId());
							%>
							<a href="/eea/posts" class="btn btn-outline-primary"
								style="width: 150px !important">My Posts</a>
						</div>
                    </div>
                </div>
            </div>
            <div class="col-6 m-3">
                <div class="card p-1 m-2">
                    <div class="formHeading cardcol-12 m-1 d-flex justify-content-center">
                        <h1>Update Account Details</h1>
                    </div>
                    <div class="formDiv col-12">
                        <form action="/eea/updateAccountPassword"  method="post" class="updateForm form"> 
                    
                          <div class="form-group p-1">
                            <label for="email">Email</label>
                            <input
                              name="accountEmail"
                              type="email"
                              class="form-control"
                              value="<%= account.getAccountEmail() %>"
                              disabled
                            />
                          </div>
                          <div class="form-group p-1">
                            <label for="name">Old Password</label>
                            <input
                              name="oldAccountPassword"
                              type="password"
                              class="form-control" 
                            />
                          </div>
                          <div class="form-group p-1">
                            <label for="name">New Password</label>
                            <input
                              name="newAccountPassword"
                              type="password"
                              class="form-control" 
                            />
                          </div>
                          <div class="form-group p-1">
                              <label for="name">Re - Enter New Password</label>
                              <input
                                name="confirmNewAccountPassword"
                                type="password"
                                class="form-control" 
                              />
                            </div>
                          <div class="d-flex justify-content-center">
                          <button class="btn btn-outline-success">Update</button>
                          </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div> 
    </div>
    <div class="container-fluid p-0 fixed-bottom"> 
        <div class="container">
            <footer class="py-3 my-4">
              <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                <li class="nav-item"><a href="/eea/index" class="nav-link px-2 text-muted">Home</a></li> 
              </ul>
              <p class="text-center text-muted">© 2022 E-Election Assist, Inc</p>
            </footer>
          </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->

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
