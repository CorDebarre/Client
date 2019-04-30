<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="org.springframework.http.HttpHeaders" %>
<%@ page import="org.springframework.http.MediaType" %>
<%@ page import="org.springframework.http.HttpEntity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ville ajoutée</title>
</head>
<body>
	La ville <%= session.getAttribute("nomCommune") %> a bien été créée.
	<br>
	<a href = "index.html">retour</a>
	
	
	
</body>
</html>