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
</script>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<!-- Debut Tests PopUp  -->

	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Launch demo modal</button>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Fin Tests PopUp  -->

	<div class="container">

		<div class="row">
			<div class="col-12">
				<h3>Solde de conges restant :</h3>
			</div>
			<div class="col-4">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="col-md-2">RTT</th>
							<td class="col-md-2 text-center">0</td>
						</tr>
						<tr>
							<th class="col-md-2">Conges payes</th>
							<td class="col-md-2 text-center">2</td>
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
					onclick="location.href='DemandeConge.jsp'">Nouveau congé</button>
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
							<th scope="row">${loop.index}</th>
							<td><c:out value="${item.getBeginDate()}" /></td>
							<td><c:out value="${item.getEndDate()}" /></td>
							<td><c:out value="${item.getReason()}" /></td>
							<td><c:out value="${item.getType()}" /></td>
							<td class="text-center"><input type="button"
								id="modifie-site" value="Modifier" /> <input type="button"
								id="delete-site" value="Supprimer" /></td>
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
							<th scope="row">${loop.index}</th>
							<td><c:out value="${item.getBeginDate()}" /></td>
							<td><c:out value="${item.getEndDate()}" /></td>
							<td><c:out value="${item.getReason()}" /></td>
							<td><c:out value="${item.getType()}" /></td>
							<td class="text-center"><input type="button"
								id="modifie-site" value="Modifier" /> <input type="button"
								id="delete-site" value="Supprimer" /></td>
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
