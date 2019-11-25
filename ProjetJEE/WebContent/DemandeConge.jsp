<%@ include file="parts/load.jsp"%>
<%
String name = (String)request.getAttribute("UserName");
request.setAttribute("name", name);
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
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

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">

		<h1>Nouvelle demande de conge : </h1>
		<!-- <p>Date: <input type="text" id="datepicker"></p> -->
		<form class="form-signin" action="LeaveController" method="POST">

			<div class="form-group">
				<label>Debut de congé :</label> <input type="date" name="bday"
					max="3000-12-31" min="1000-01-01" class="form-control">
			</div>

			<div class="form-group">
				<label>Fin de congé :</label> <input type="date" name="eday"
					min="1000-01-01" max="3000-12-31" class="form-control">
			</div>

			<!-- 	
					Compter jours ouvres : 
					https://www.developpez.net/forums/d51971/javascript/general-javascript/compter-nb-jours-ouvres-entre-2-dates/ 
					https://www.developpez.net/forums/d1607647/java/general-java/apis/java-util/savoir-jour-ferie/
				-->

			<!-- Informations a recuperer dans la BDD -->
			<div class="form-group">
				<label>Motif</label> <select name="motif" class="form-control">
					<option selected disabled>Choisir un motif</option>
					<option value="Maladie">Maladie</option>
					<option value="Enfants malades">Enfants malades</option>
					<option value="Raisons personnelles">Raisons personnelles</option>
				</select>
			</div>

			<div class="form-group">
				<label>Type</label> <select name="type" class="form-control">
					<option selected disabled>Choisir un type</option>
					<option value="RTT">RTT</option>
					<option value="CP">Congés Payés</option>
					<option value="Formation">Formation</option>
				</select>
			</div>

			<div class="form-group">
				<label>Commentaire</label>
				<textarea name="comment"></textarea>
			</div>

			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Valider</button>
			<button class="btn btn-outline-danger my-2 my-sm-0"
				onclick="location.href='GestionCongesPerso.jsp'">Annuler</button>
		</form>

	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>