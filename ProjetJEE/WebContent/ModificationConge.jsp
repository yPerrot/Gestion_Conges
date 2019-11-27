<%@ include file="parts/load.jsp"%>
<%@page import="org.gdc.models.Leave,java.util.Date,java.util.ArrayList,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="parts/includes.jsp"%>
<title>Modification congé</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">
		<span>${errors['remainingBalance']}</span>

		<h1>Modification de congé : </h1>
		
		<form action="LeaveEditController" method="POST">
			<div class="form-group">
				<label>Date de debut de congé :</label> <input type="date" name="bday"
					max="3000-12-31" min="1000-01-01" class="form-control" value="${conge.getBeginDate()}">
			</div>

			<div class="form-group">
				<label>Date de fin de congé :</label> <input type="date" name="eday"
					min="1000-01-01" max="3000-12-31" class="form-control" value="${conge.getEndDate()}">
			</div>

			<!-- 	
					Compter jours ouvres : 
					https://www.developpez.net/forums/d51971/javascript/general-javascript/compter-nb-jours-ouvres-entre-2-dates/ 
					https://www.developpez.net/forums/d1607647/java/general-java/apis/java-util/savoir-jour-ferie/
				-->
			
			<div class="form-group">
				<label>Motif :</label> 
				<select name="motif" class="form-control">
					<option value="Maladie" ${conge.getReason() == "Maladie" ? 'selected="selected"' : ''}>Maladie</option>
					<option value="Enfants malades" ${conge.getReason() == "Enfants malades" ? 'selected="selected"' : ''}>Enfants malades</option>
					<option value="Raisons personnelles" ${conge.getReason() == "Raisons personnelles" ? 'selected="selected"' : ''}>Raisons personnelles</option>
				</select>
			</div>

			<div class="form-group">
				<label>Type :</label> 
				<select name="type" class="form-control">
					<option value="RTT" ${conge.getType() == "RTT" ? 'selected="selected"' : ''}>RTT</option>
					<option value="CP" ${conge.getType() == "CP" ? 'selected="selected"' : ''}>Congés Payés</option>
					<option value="Formation" ${conge.getType() == "Formation" ? 'selected="selected"' : ''}>Formation</option>
				</select>
			</div>
			
			<input type="hidden" name="oldBday" value=${conge.getBeginDate()}></input>
			<input type="hidden" name="oldDuration" value=${conge.getBeginDate()}></input>

			<button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="update">Valider</button>
		</form>
		
		<a href="LeavePersoController"><button class="btn btn-outline-danger my-2 my-sm-0">Annuler</button></a>

	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>