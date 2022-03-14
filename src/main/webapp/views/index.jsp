<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>App</title>
</head>
<body>
<%
	List<String> lang = (List<String>)(request.getAttribute("lang"));
	for(String s : lang){
		%>
			<h1><%= s %></h1>
		<%
	}
%>
</body>
</html>