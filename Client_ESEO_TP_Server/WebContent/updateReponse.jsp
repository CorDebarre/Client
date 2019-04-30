<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="org.springframework.http.HttpHeaders" %>
<%@ page import="org.springframework.http.MediaType" %>
<%@ page import="org.springframework.http.HttpEntity" %>
<%@ page import="fr.eseo.Ville" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update done</title>
<link rel="stylesheet" href="theme.css">
</head>
<body>
	La ville <%= session.getAttribute("villeNom") %> a bien été modifiée.
	<br>
	<a href = "index.html">retour</a>
</body>
</html>