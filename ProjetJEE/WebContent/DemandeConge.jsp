<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String name = (String)request.getAttribute("UserName");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nouvelle demande de congé</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#datepicker" ).datepicker();
} );
</script>

</head>
<body>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    	<a class="navbar-brand">Notre projet</a>
			<div class="collapse navbar-collapse">
	    		<a  class="nav-link" href="#">Congés</a>
	    		<a  class="nav-link" href="#">Statistic</a>
			</div>
			
			<div class="my-2 my-lg-0">
				<span ><%=name%></span>
		    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log out</button >
			</div>
		</nav>
		
		<div class="container">
		
			<!-- <p>Date: <input type="text" id="datepicker"></p> -->
			
			<div class="form-group">
			 <label >Debut de congé :</label>
			 <input type="date" name="bday" max="3000-12-31" 
			        min="1000-01-01" class="form-control">
			</div>
			
			<div class="form-group">
			 <label >Fin de congé :</label>
			 <input type="date" name="bday" min="1000-01-01"
			        max="3000-12-31" class="form-control">
			</div>
			
			<!-- 	
				Compter jours ouvrés : 
				https://www.developpez.net/forums/d51971/javascript/general-javascript/compter-nb-jours-ouvres-entre-2-dates/ 
				https://www.developpez.net/forums/d1607647/java/general-java/apis/java-util/savoir-jour-ferie/
			-->
			
			<!-- Informations à récupérer dans la BDD -->
			<div class="form-group">
				<label>Raison congé :</label>
				<select class="form-control" >
					<option value="">Choisisez une raison</option>
					<option value="RTT">RTT</option>
					<option value="Conges_Annuels">Congés annuels</option>
					<option value="Enfant_Malade">Enfant malade</option>
					<option value="Famille">Famille</option>
				</select>
			</div>
			
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Valider</button >
			<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Annuler</button >
			
		</div>

</body>
</html>