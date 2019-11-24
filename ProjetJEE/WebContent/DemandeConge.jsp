<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String name = (String)request.getAttribute("UserName");
request.setAttribute("name", name);
%>
    
<!DOCTYPE html>
<html>
<head>
	<%@ include file="parts/includes.jsp" %>  
	<title>Nouvelle demande de conge</title>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$( function() {
		$( "#datepicker" ).datepicker();
	} );
	</script>

</head>
<body>

		<%@ include file="parts/navbar.jsp" %>  
		
		<div class="container">
		
			<!-- <p>Date: <input type="text" id="datepicker"></p> -->
			<form>

				<div class="form-group">
				 <label >Debut de conge :</label>
				 <input type="date" name="bday" max="3000-12-31" 
				        min="1000-01-01" class="form-control">
				</div>
				
				<div class="form-group">
				 <label >Fin de conge :</label>
				 <input type="date" name="bday" min="1000-01-01"
				        max="3000-12-31" class="form-control">
				</div>
				
				<!-- 	
					Compter jours ouvres : 
					https://www.developpez.net/forums/d51971/javascript/general-javascript/compter-nb-jours-ouvres-entre-2-dates/ 
					https://www.developpez.net/forums/d1607647/java/general-java/apis/java-util/savoir-jour-ferie/
				-->
				
				<!-- Informations a recuperer dans la BDD -->
				<div class="form-group">
					<label>Raison conge :</label>
					<select class="form-control" >
						<option selected disabled>Choisisez une raison</option>
						<option value="RTT">RTT</option>
						<option value="Conges_Annuels">Conges annuels</option>
						<option value="Enfant_Malade">Enfant malade</option>
						<option value="Famille">Famille</option>
					</select>
				</div>
				
				<button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='User.jsp'" type="submit">Valider</button >
				<button class="btn btn-outline-danger my-2 my-sm-0" onclick="location.href='User.jsp'" type="submit">Annuler</button >
			
			</form>
			
		</div>

<%@ include file="parts/footer.jsp" %>  