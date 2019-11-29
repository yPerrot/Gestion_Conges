<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Nouvelle fiche</title>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">
	
		<span>${errors['remainingBalance']}</span>
		<h1>Nouvelle fiche employé :</h1>
		
		<div class="row">
		
			<div class="col-3">
			</div>
			
			<div class="col-6">
				<form class="form-signin" action="EmployeeCreateController" method="POST">
		
					<div class="form-group">
						<label for="login">Nom d'utilisateur :</label>
						<input type="text" class="form-control" name="login" placeholder="Nom d'utilisateur" required>
					</div>
					
					<div class="form-group">
						<label for="name">Prénom :</label>
						<input type="text" class="form-control" name="name" placeholder="Prénom">
					</div>
					
					<div class="form-group">
						<label for="familyName">Nom de famille :</label>
						<input type="text" class="form-control" name="familyName" placeholder="Nom de famille" required>
					</div>
		
					<div class="form-group">
						<label for="address">Adresse :</label>
						<input type="text" class="form-control" name="address" placeholder="Adresse" required>
					</div>
		
					<div class="form-group">
						<label for="city">Ville :</label>
						<input type="text" class="form-control" name="city" placeholder="Ville" required>
					</div>
					
					<div class="form-group">
						<label for="zipCode">Code postal :</label>
						<input type="text" class="form-control" name="zipCode" placeholder="29800" required>
					</div>
					
					<div class="form-group">
						<label for="mail">Adresse email :</label>
						<input type="email" class="form-control" name="mail" placeholder="adresse@mail.com" required>
					</div>
					
					<div class="form-group">
						<label>Equipe :</label> 
						<select name="team" class="form-control" >
							<option selected disabled>Choisir une équipe</option>
							<option value="Comptabilite">Comptabilite</option>
							<option value="Informatique">Informatique</option>
							<option value="RH">RH</option>
						</select>
					</div>
		
					<div class="form-group">
						<label>Poste :</label> 
						<select name="role" class="form-control">
							<option selected disabled>Choisir un poste</option>
							<option value="Chef d'equipe">Chef d'equipe</option>
							<option value="Membre d'equipe">Membre d'equipe</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="nbLeaves">Nombre de congés annuel :</label>
						<input type="number" class="form-control" name="nbLeaves" min="0" max="50" value="25">
					</div>
					
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Valider</button>
				</form>
		
				<a href="EmployeeController"><button class="btn btn-outline-danger my-2 my-sm-0">Annuler</button></a>
				
			</div>
		</div>	
	</div>

	<%@ include file="parts/footer.jsp"%>

</body>
</html>