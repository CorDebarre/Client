<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="fr.eseo.Ville" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste villes</title>
<link rel="stylesheet" href="villes.css">
<link rel="stylesheet" href="theme.css">
</head>
<body>
	<h1>Voici la liste des villes de France</h1>
	
	<a href = "index.html">retour</a><br><br>
	<a href = "formulaireCreationVille.html">Ajouter une ville</a><br><br>
	<a href = "modifierVille.jsp">Modifier une ville</a><br><br>
	<a href = "supprimerVille.jsp">Supprimer une ville</a><br><br>
	
	
	<%
	RestTemplate restTemplate= new RestTemplate();
	
	
	String reponse= String.valueOf(request.getParameter("reponseSelect"));
	System.out.println(reponse);
	String filtre= request.getParameter("filtre");
	String url ="http://127.0.0.1:8181/ville";
	
	Ville[] villes = restTemplate.getForObject(url,Ville[].class);
	for (int i=0; i<villes.length;i++){
		String name=villes[i].getCode_commune_INSEE();
	%><br>
	<form method="post" action="FiltreServlet">
	<hr noshade >
    	<%= villes[i].toString() %>  <%}%>
    <hr noshade >		
	</form>	
</body>
</html>