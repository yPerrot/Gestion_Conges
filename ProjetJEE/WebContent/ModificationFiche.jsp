<%@ include file="parts/load.jsp"%>
<%@page import="org.gdc.models.Employee"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Modification Fiche</title>
</head>
<body>
	<%@ include file="parts/navbar.jsp"%>

	<div class="container">
		<span>${errors['remainingBalance']}</span>

		<h1>Modification fiche employé :</h1>
		<form class="form-signin" action="EmployeeEditController" method="POST">

			<div class="form-group">
				<label for="login">Nom d'utilisateur :</label>
				<input type="text" class="form-control" name="login" placeholder="Nom d'utilisateur" required value="${e.getLogin()}">
			</div>
			
			<div class="form-group">
				<label for="name">Prénom :</label>
				<input type="text" class="form-control" name="name" placeholder="Prénom" value="${e.getFname()}">
			</div>
			
			<div class="form-group">
				<label for="familyName">Nom de famille :</label>
				<input type="text" class="form-control" name="familyName" placeholder="Nom de famille" required value="${e.getName()}">
			</div>

			<div class="form-group">
				<label for="address">Adresse :</label>
				<input type="text" class="form-control" name="address" placeholder="Adresse" required value="${e.getAddress()}">
			</div>

			<div class="form-group">
				<label for="city">Ville :</label>
				<input type="text" class="form-control" name="city" placeholder="Ville" required value="${e.getCity()}">
			</div>
			
			<div class="form-group">
				<label for="zipCode">Code postal :</label>
				<input type="text" class="form-control" name="zipCode" palceholder="29800" required value="${e.getZipCode()}">
			</div>
			
			<div class="form-group">
				<label for="mail">Adresse email :</label>
				<input type="email" class="form-control" name="mail" placeholder="adresse@mail.com" required value="${e.getMail()}">
			</div>
			
			<div class="form-group">
				<label>Equipe :</label> 
				<select name="team" class="form-control" >
					<option value="Comptabilite" ${e.getTeam() == "Comptabilite" ? 'selected="selected"' : ''}>Comptabilite</option>
					<option value="Informatique" ${e.getTeam() == "Informatique" ? 'selected="selected"' : ''}>Informatique</option>
					<option value="RH"  ${e.getTeam() == "RH" ? 'selected="selected"' : ''}>RH</option>
				</select>
			</div>

			<div class="form-group">
				<label>Poste :</label> 
				<select name="role" class="form-control">
					<option value="Chef d'equipe"  ${e.getRole() == "Chef d'equipe" ? 'selected="selected"' : ''}>Chef d'equipe</option>
					<option value="Membre d'equipe"  ${e.getRole() == "Membre d'equipe" ? 'selected="selected"' : ''}>Membre d'equipe</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="nbLeaves">Nombre de congés annuel :</label>
				<input type="number" class="form-control" name="nbLeaves" min="0" max="50" value="${e.getNbLeaves()}" >
			</div>
			
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Valider</button>
		</form>
		
		<a href="EmployeeController"><button class="btn btn-outline-danger my-2 my-sm-0">Annuler</button></a>
		
	</div>

	<%@ include file="parts/footer.jsp"%>

</body>
</html>