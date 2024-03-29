<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Nouvelle demande de cong�</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#datepicker" ).datepicker();
	} );
	</script>

</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">
	
		<span>${errors['remainingBalance']}</span>
		<h1>Nouvelle demande de cong� :</h1>
		
		<div class="row">
		
			<div class="col-3">
			</div>
			
			<div class="col-6">

				<form class="form-signin" action="LeaveCreateController" method="POST">
		
					<div class="form-group">
						<label>Date de debut de cong� :</label> <input type="date" name="bday"
							max="3000-12-31" min="1000-01-01" class="form-control">
					</div>
		
					<div class="form-group">
						<label>Date de fin de cong� :</label> <input type="date" name="eday"
							min="1000-01-01" max="3000-12-31" class="form-control">
					</div>
		
					<div class="form-group">
						<label>Motif :</label> <select name="motif" class="form-control">
							<option selected disabled>Choisir un motif</option>
							<option value="Maladie">Maladie</option>
							<option value="Enfants malades">Enfants malades</option>
							<option value="Raisons personnelles">Raisons personnelles</option>
						</select>
					</div>
		
					<div class="form-group">
						<label>Type :</label> <select name="type" class="form-control">
							<option selected disabled>Choisir un type</option>
							<option value="RTT">RTT</option>
							<option value="CP">Cong�s Pay�s</option>
							<option value="Formation">Formation</option>
						</select>
					</div>
						

					<button class="btn btn-outline-success my-2 my-sm-0" name="action" value="create" type="submit">Valider</button>
						
				</form>
						
				<a href="LeavePersoController"><button class="btn btn-outline-danger my-2 my-sm-0">Annuler</button></a>
						
			</div>
		</div>
	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>