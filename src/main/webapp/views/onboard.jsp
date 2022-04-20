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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <title>EEA | <%=account.getAccountName() %></title>
</head>

<body>
    <!-- Nav - Start -->
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/eea/index">E-Election Assist</a>
                <a class="btn btn-danger" href="/eea/logout">Log Out</a>
            </div>
        </nav>
    </div>
    <!-- Nav - End -->
	<%
	if (baseResponse != null && baseResponse.getMessage() != null && !baseResponse.getMessage().isEmpty()) {
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
	<!-- Body - Start -->
    <div class="row">
        <!-- Profile Card - Start -->
        <div class="col-3">
            <div class="card m-2" style="width: 18rem;">
                <div class="d-flex justify-content-around align-items-center p-2">
                    <div>
                        <img src="/eea/accountImage/<%= account.getAccountId() %>"
                            class="profile-image card-img-top rounded-circle" alt="..." style="
                            width:70px;
                            height:70px;">
                    </div>
                    <div class="d-flex justify-content-center">
                        <h5><%=account.getAccountName() %></h5>
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
                            <p class="btn btn-light">0</p>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row d-flex">
                    <div class="col-12 m-1 d-flex justify-content-center">
                        <a href="" class="btn btn-outline-primary" style="width:150px !important">Account Setting</a>
                    </div>
                    <div class="col-12 m-1 d-flex justify-content-center">
                        <a href="" class="btn btn-outline-primary" style="width:150px !important">Profile Setting</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Card - End -->
        <!-- Content - Start -->
        <div class="col-8" style="overflow: auto; height: 700px !important;">
            <!-- Founder Start -->
            <div class="row border border-primary rounded my-2 details-row">
                <div class="col-12 text-center m-1">
                    <img src="/static/founder.png" alt="">
                    <h3>Founder Details</h3>
                </div>
                <!-- Download Founder File - Start-->
                <div class="col-6 d-flex justify-content-center">
                    <a class="" href="/eea/founders" class="p-1">
                        <img src="/static/excel.png" alt="" class="card-image">
                        <p>Download Founder's Sample File.</p>
                    </a>
                </div>
                <!-- Download Founder File - End -->

                <!-- Upload Founder Data - Start -->
                <div class="col-6 d-flex justify-content-center">
                    <form class="row" action="/eea/uploadFounderDetails" method="post" enctype="multipart/form-data">
                        <!-- upload file - start -->
                        <input class="form-control col-12" type="file" name="founder-details" id="founder-details"
                            hidden required>
                        <label class="form-label col-12" for="founder-details">
                            <img src="/static/upload.png" alt="">
                        </label>
                        <button class="btn btn-outline-success m-1" for="founder-details">
                            Upload Founder Details
                        </button>
                        <!-- upload file - end -->
                    </form>
                </div>
                <!-- Upload Founder Data - End -->
            </div>
            <!-- Founder - End -->
            <!-- Leader - Start -->
            <div class="row border border-primary rounded my-2 details-row">
                <div class="col-12 text-center m-1">
                    <img src="/static/leader.png" alt="">
                    <h3>Leader Details</h3>
                </div>
                <!-- Download Leader File - Start-->
                <div class="col-6 d-flex justify-content-center">
                    <a class="" href="/eea/leaders" class="p-1">
                        <img src="/static/excel.png" alt="" class="card-image">
                        <p>Download Leader's Sample File.</p>
                    </a>
                </div>
                <!-- Download Leader File - End -->

                <!-- Upload Leader Data - Start -->
                <div class="col-6 d-flex justify-content-center">
                    <form class="row" action="" method="post" enctype="multipart/form-data">
                        <!-- upload file - start -->
                        <input class="form-control col-12" type="file" name="Leader" id="Leader"
                            hidden>
                        <label class="form-label col-12" for="Leader">
                            <img src="/static/upload.png" alt="">
                        </label>
                        <button class="btn btn-outline-success m-1" for="Leader">
                            Upload Leader Details
                        </button>
                        <!-- upload file - end -->
                    </form>
                </div>
                <!-- Upload Leader Data - End -->
            </div>
            <!-- Leader - End -->
            <!-- Achievements - Start -->
            <div class="row border border-primary rounded my-2 details-row">
                <div class="col-12 text-center m-1">
                    <img src="/static/achievements.png" alt="">
                    <h3>Achievements Details</h3>
                </div>
                <!-- Download Achievements File - Start-->
                <div class="col-6 d-flex justify-content-center">
                    <a class="" href="/eea/achievements" class="p-1">
                        <img src="/static/excel.png" alt="" class="card-image">
                        <p>Download Achievements's Sample File.</p>
                    </a>
                </div>
                <!-- Download Achievements File - End -->

                <!-- Upload Achievements Data - Start -->
                <div class="col-6 d-flex justify-content-center">
                    <form class="row" action="" method="post" enctype="multipart/form-data">
                        <!-- upload file - start -->
                        <input class="form-control col-12" type="file" name="founder-details" id="achievements"
                            hidden>
                        <label class="form-label col-12" for="achievements">
                            <img class="btn-outline-light" src="/static/upload.png" alt="" style="height:30px !important">
                        </label>
                        <button class="btn btn-outline-success m-1" for="achievements">
                            Upload Achievements Details
                        </button>
                        <!-- upload file - end -->
                    </form>
                </div>
                <!-- Upload Achievements Data - End -->
            </div>
            <!-- Achievements - End -->
            <!-- Manifesto - Begin -->
            <div class="row border border-primary rounded my-2 details-row">
                <div class="col-12 text-center m-1">
                    <img src="/static/manifesto.png" alt="">
                    <h3>Manifesto Details</h3>
                </div>

                <!-- Upload Achievements Data - Start -->
                <div class="col-12 d-flex justify-content-center">
                    <form class="row d-flex justify-content-center" action="" method="post"
                        enctype="multipart/form-data">
                        <!-- upload file - start -->
                        <input class="form-control col-12" type="file" name="manifesto" id="manifesto"
                            hidden />
                        <label class="form-label d-flex justify-content-center" for="manifesto">
                            <img src="/static/upload.png" alt="">
                        </label>
                        <button class="btn btn-outline-success col-12 m-1">
                            Upload Manifesto Details
                        </button>
                        <!-- upload file - end -->
                    </form>
                </div>
                <!-- Manifesto - End -->
            </div>
            <!-- Content - End -->
        </div>
        </div>
        <!-- Body - End -->

        <!-- Footer - Start -->
        <div class="container-fluid p-0">
            <div class="container">
                <footer class="py-3 my-4">
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item">
                            <a href="/eea/index" class="nav-link px-2 text-muted">Home</a>
                        </li>
                    </ul>
                    <p class="text-center text-muted">© 2022 E-Election Assist, Inc</p>
                </footer>
            </div>
        </div> 
        <!-- Footer - End -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
        <style>

        </style>
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