<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="fr.eseo.Ville" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supprimer une ville</title>
</head>
<body>
	<h1>Supprimer une ville</h1>
	<%
	RestTemplate restTemplate= new RestTemplate();
	
	%>
	
	<br>
	<form method="post" action="SupprimerVilleServlet">
	Supprimer une ville :
	<select id="ville" name="ville">
	    <option value="" selected></option>
	 	<% Ville[] villes = restTemplate.getForObject("http://127.0.0.1:8181/ville",Ville[].class);
		for (int i=0; i<villes.length;i++){
			%><option value="<%= villes[i].getCode_commune_INSEE()%>"><%= villes[i].getNom_commune()%> </option><% }%>
	    
	</select>
	
	
	<input type="submit" value = "Valider la suppression"/>
	
	
	<br><br>
	<a href = "index.html">retour</a>
	</form>
</body>
</html>