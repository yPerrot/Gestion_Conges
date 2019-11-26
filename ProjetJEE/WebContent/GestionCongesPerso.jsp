<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Gestion des congés de ${emp.getFname()}</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
	$(document).ready(function() {
		$("#delete-site").click(function() {
			var row = $(this).data('id');
			$(".deleteButton").attr("href", "LeaveController?rowToDelete="+row);
		});
	});
</script>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<!-- Debut Tests PopUp  -->

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
						
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
							<a class="deleteButton"><button type="button" class="btn btn-primary">Supprimer</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="VisualisationConge" tabindex="-1" role="dialog"
		aria-labelledby="VisualisationCongeLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="VisualisationCongeLabel">Visualisation conge</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<p>Date de debut : ${listLeavesApproved.get(test).getBeginDate()}</p>
							<p>Date de fin : ${listLeavesApproved.get(test).getEndDate()}</p>
							<p>Duree du conge : ${listLeavesApproved.get(test).getEndDate()}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Tests PopUp  -->

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
				<h1>Vos conges en cours de validation</h1>
			</div>
			<div class="col-2 align-self-center">
				<button class="btn btn-secondary"
					onclick="location.href='LeaveController?page=DemandeConge'">Nouveau congé</button>
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
								<input class="btn btn-outline-dark" type="button" id="modifie-site" value="Modifier" /> 
								<input class="btn btn-outline-dark" data-id="${item.getBeginDate()}" data-toggle="modal" data-target="#SuppressionModal"
									type="button" id="delete-site" value="Supprimer" />
								<input class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#VisualisationConge"
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
								<input class="btn btn-outline-dark btn-sm" type="button" id="view_info" 
								 onclick="${System.out.println(item.getType());selectedLeave=item}" data-toggle="modal" data-target="#VisualisationConge" value="..." />
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>

		</table>

		<!-- Fin container -->
		</div>	
		<%@ include file="parts/footer.jsp"%>

	<script>

	</script>
</body>
</html>
