<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEA | Sign Up</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
</head>
<body>
    <div class="container mt-6">
        <h1>Select Account Type</h1>
        <form action="" method="post">
            <label for="">Account Type</label>
            <hr>
            
            <input type="radio" name="accountType" id="" value="Individual">
            <label for="">Individual</label><br>

            <input type="radio" name="accountType" id="" value="Political Entity">
            <label for="">Political Entity</label>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>