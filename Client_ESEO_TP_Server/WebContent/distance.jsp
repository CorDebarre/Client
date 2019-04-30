<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="fr.eseo.Ville" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calcul de distances entre 2 villes</title>
<link rel="stylesheet" href="theme.css">
</head>
<body>
	<h1>Choisissez deux villes</h1>
	<%
	RestTemplate restTemplate= new RestTemplate();
	
	%>
	
	<br>
	<form method="post" action="CalculDistanceServlet">
	Calculer la distance entre deux villes :
	<br>
	
	Ville 1 :
	<select id="ville1" name="ville1">
	    <option value="" selected></option>
	 	<% Ville[] villes = restTemplate.getForObject("http://127.0.0.1:8181/ville",Ville[].class);
		for (int i=0; i<villes.length;i++){
			%><option value="<%= villes[i].getCode_commune_INSEE()%>"><%= villes[i].getNom_commune()%> </option><% }%>
	    
	</select>
	<br><br>
	Ville 2 :
	<select id="ville2" name="ville2">
	    <option value="" selected></option>
	 	<% Ville[] communes = restTemplate.getForObject("http://127.0.0.1:8181/ville",Ville[].class);
		for (int i=0; i<communes.length;i++){
			%><option value="<%= communes[i].getCode_commune_INSEE()%>"><%= communes[i].getNom_commune()%> </option><% }%>
	    
	</select>
	
	
	<input type="submit" value = "Calculer la distance"/>
	
	
	<br><br>
	<a href = "index.html">retour</a>
	</form>
</body>
</html>