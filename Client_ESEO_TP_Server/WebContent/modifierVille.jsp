<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.client.RestTemplate" %>
<%@ page import="fr.eseo.Ville" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier une ville</title>
<link rel="stylesheet" href="theme.css">
</head>
<body>
	<h1>Modifier une ville</h1>
	<%
	RestTemplate restTemplate= new RestTemplate();
	
	%>
	
	<br>
	<form method="post" action="ModifierVilleServlet">
	Modifier une ville :
	<select id="update" name="update">
	    <option value="" selected></option>
	 	<% Ville[] villes = restTemplate.getForObject("http://127.0.0.1:8181/ville",Ville[].class);
		for (int i=0; i<villes.length;i++){
			%><option value="<%= villes[i].getCode_commune_INSEE()%>"><%= villes[i].getNom_commune()%> </option><% }%>
	    
	</select>
	
	<br><br>
	
	<h2>Veuillez remplir les champs</h2>
	
	Code commune INSEE : <input type="text" name="codeCommune" required/>
	<br />
	<br />
	Nom commune : <input type="text" name="nomCommune" required/>
	<br />
	<br />
	Code postal : <input type="text" name="codePostal" required/>
	<br />
	<br />
	Libellé acheminement : <input type="text" name="libelle" required/>
	<br />
	<br />
	Ligne 5 : <input type="text" name="ligne5"/>
	<br />
	<br />
	Latitude <input type="text" name="latitude" required/>
	<br />
	<br />
	Longitude <input type="text" name="longitude" required/>
	<br />
	<br />
	<input type="submit" value = "Valider la modification"/>
	
	
	<br>
	<a href = "index.html">retour</a>
	</form>
	
</body>
</html>