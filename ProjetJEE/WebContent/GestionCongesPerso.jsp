<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Gestion des congés</title>
<script type="text/javascript">
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
	$(document).ready( function() {
		$("#delete-site").click( function() {
			var row = $(this).data('id');
			$(".deleteButton").attr("href","LeaveController?action=delete&delBeginDate=" + row);
		});
		$("#view_info").click(function() {
			var beginDate = $(this).data('begindate');
			var endDate = $(this).data('enddate');
			var duration = $(this).data('duration');
			var reason = $(this).data('reason');
			var type = $(this).data('type');
			var state = $(this).data('state');
			var validDate = $(this).data('validdate');
			var wording = $(this).data('wording');
					
			$('#viewBeginDate').text(beginDate); 
 			$('#viewEndDate').text(endDate);
			$('#viewDuration').text(duration);
			$('#viewReason').text(reason);
			$('#viewType').text(type);
			$('#viewState').text(state);
			$('#viewValidDate').text(validDate!=''?validDate:'Pas encore validé');
			$('#viewWording').text(wording!=''?wording:'Pas de commentaire'); 
			
		});
	});
</script>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#SuppressionModal">Launch demo modal</button> -->

	<div class="modal fade" id="SuppressionModal" tabindex="-1" role="dialog"
		aria-labelledby="SuppressionModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="SuppressionModalLabel">Validation suppression</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<p>Voulez-vous validation la suppression du congé : </p>
						</div>
					</div>
					<div class="row">
						<div class="col text-right">

							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Annuler</button>
							<a class="deleteButton"><button type="button"
									class="btn btn-primary">Supprimer</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="VisualisationConge" tabindex="-1"
		role="dialog" aria-labelledby="VisualisationCongeLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="VisualisationCongeLabel">Visualisation congé</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
						 <ul class="list-group list-group-flush">
						  <li class="list-group-item"><b>Date de debut : </b><span id="viewBeginDate"></span></li>
						  <li class="list-group-item"><b>Date de fin : </b><span id="viewEndDate"></span></li>
						  <li class="list-group-item"><b>Durée du congé : </b><span id="viewDuration"></span></li>
						  <li class="list-group-item"><b>Raison : </b><span id="viewReason"></span></li>
						  <li class="list-group-item"><b>Type du congé : </b><span id="viewType"></span></li>
						  <li class="list-group-item"><b>Etat : </b><span id="viewState"></span></li>
						  <li class="list-group-item"><b>Date de validation : </b><span id="viewValidDate"></span></li>
						  <li class="list-group-item"><b>Commentaire : </b><span id="viewWording"></span></li>
						</ul> 
<!-- 							<p>Date de debut : <span id="viewBeginDate"></span></p>
							<p>Date de fin : <span id="viewEndDate"></span></p>
							<p>Durée du congé : <span id="viewDuration"></span></p>
							<p>Raison : <span id="viewReason"></span></p>
							<p>Type du congé : <span id="viewType"></span></p>
							<p>Etat : <span id="viewState"></span></p>
							<p>Date de validation : <span id="viewValidDate"></span></p>
							<p>Commentaire : <span id="viewWording"></span></p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-12">
				<h3>Solde de congés restant :</h3>
			</div>
			<div class="col-4">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-md-2">Conges payés</th>
							<td class="col-md-2 text-center"> ${emp.getNbLeaves()} </td>
						</tr>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<h1>Vos congés en cours de validation</h1>
			</div>
			<div class="col-2 align-self-center">
				<button class="btn btn-secondary" onclick="location.href='LeaveController?page=DemandeConge'">Nouveau congé</button>
			</div>
		</div>
		<table class="table table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Date de début</th>
					<th scope="col">Date de fin</th>
					<th scope="col">Motif</th>
					<th scope="col">Type</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listLeaves}" var="item" varStatus="loop">
					<c:if test="${item.getValidDate() == null}">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td><c:out value="${item.getBeginDate()}" /></td>
							<td><c:out value="${item.getEndDate()}" /></td>
							<td><c:out value="${item.getReason()}" /></td>
							<td><c:out value="${item.getType()}" /></td>
							<td class="text-center">
								<a href="LeaveEditController?login=${item.getLogin()}&beginDate=${item.getBeginDate()}"><input class="btn btn-outline-dark" type="button" id="modifie-site" value="Modifier" /></a> 
								<input class="btn btn-outline-dark" data-id="${item.getBeginDate()}" data-toggle="modal" data-target="#SuppressionModal"
									type="button" id="delete-site" value="Supprimer" />
								<input class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#VisualisationConge"
									data-beginDate="${item.getBeginDate()}" data-endDate="${item.getEndDate()}" 
									data-duration="${item.getDuration()}" data-reason="${item.getReason()}" 
									data-type="${item.getType()}" data-state="${item.getState()}" 
									data-validDate="${item.getValidDate()}" data-wording="${item.getWording()}"
									type="button" id="view_info" value="..." />
									

							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<div class="row">
			<div class="col">
				<h1>Vos congés</h1>
			</div>
		</div>

		<table class="table table-bordered">

			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Date de début</th>
					<th scope="col">Date de fin</th>
					<th scope="col">Motif</th>
					<th scope="col">Type</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listLeaves}" var="item" varStatus="loop">
					<c:if test="${item.getValidDate() != null}">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td><c:out value="${item.getBeginDate()}" /></td>
							<td><c:out value="${item.getEndDate()}" /></td>
							<td><c:out value="${item.getReason()}" /></td>
							<td><c:out value="${item.getType()}" /></td>
							<td class="text-center">
							<input class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#VisualisationConge"
								data-beginDate="${item.getBeginDate()}" data-endDate="${item.getEndDate()}" 
								data-duration="${item.getDuration()}" data-reason="${item.getReason()}" 
								data-type="${item.getType()}" data-state="${item.getState()}" 
								data-validDate="${item.getValidDate()}" data-wording="${item.getWording()}"
								type="button" id="view_info" value="..." />
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>

		</table>

		<!-- Fin container -->
	</div>
	<%@ include file="parts/footer.jsp"%>
</body>
</html>
