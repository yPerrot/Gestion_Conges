<%@ include file="parts/load.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Gestion des fiches employés</title>
<script>
	$(document).ready( function() {
		$("#delete-site").click( function() {
			var row = $(this).data('id');
			$(".deleteButton").attr("href","EmployeeController?action=delete&delLogin=" + row);
		});
		$("#view-fiche").click(function() {
			var login = $(this).data('login');
			var fname = $(this).data('fname');
			var name = $(this).data('name');
			var address = $(this).data('address');
			var city = $(this).data('city');
			var zipcode = $(this).data('zipcode');
			var team = $(this).data('team');
			var role = $(this).data('role');
			var mail = $(this).data('mail');
			var nbleaves = $(this).data('nbleaves');
					
			console.log($(this).data('login'))
			
			$('#login').text(login); 
			$('#fname').text(fname);
			$('#name').text(name);
			$('#address').text(address);
			$('#zipcode').text(zipcode);
			$('#city').text(city);
			$('#team').text(team);
			$('#role').text(role);
			$('#mail').text(mail);
			$('#nbleaves').text(nbleaves);
			
		});
	});
</script>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>
	
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
							<p>Voulez-vous validation la suppression de la fiche : </p>
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
	
	<div class="modal fade" id="viewFiche" tabindex="-1" role="dialog"
		aria-labelledby="viewFicheLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="viewFicheLabel">Visualisation Fiche :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<ul class="list-group list-group-flush">
							 <li class="list-group-item"><b>Login : </b><span id="login"></span></li>
							 <li class="list-group-item"><b>Nom : </b><span id="fname"></span></li>
							 <li class="list-group-item"><b>Prénom : </b><span id="name"></span></li>
							 <li class="list-group-item"><b>Adresse : </b><span id="address"></span>, <span id="zipcode"></span>, <span id="city"></span> </li>
							 <li class="list-group-item"><b>Equipe : </b><span id="team"></span></li>
							 <li class="list-group-item"><b>Role : </b><span id="role"></span></li>
							 <li class="list-group-item"><b>Mail : </b><span id="mail"></span></li>
							 <li class="list-group-item"><b>Nombre de congés disponible : </b><span id="nbleaves"></span></li>
							</ul> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
	
		<div class="row">
			<div class="col">
				<h1>Liste des employés :</h1>
			</div>
			<div class="col-2 align-self-center">
				<button class="btn btn-secondary" onclick="location.href='EmployeeCreateController'">Nouvel employé</button>
			</div>
		</div>
		<table class="table table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Prénom</th>
					<th scope="col">Nom</th>
					<th scope="col">Equipe</th>
					<th scope="col">Role</th>
					<th scope="col">Mail</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${a}" var="item" varStatus="loop">
					<tr>
						<th scope="row">${loop.index + 1}</th>
						<td><c:out value="${item.getFname()}" /></td>
						<td><c:out value="${item.getName()}" /></td>
						<td><c:out value="${item.getTeam()}" /></td>
						<td><c:out value="${item.getRole()}" /></td>
						<td><c:out value="${item.getMail()}" /></td>
						<td class="text-center">
							<a href="EmployeeEditController?login=${item.getLogin()}"><input class="btn btn-outline-dark" type="button" id="modifie-site" value="Modifier" /></a> 
							<input class="btn btn-outline-dark" data-id="${item.getLogin()}" data-toggle="modal" data-target="#SuppressionModal"
									type="button" id="delete-site" value="Supprimer" />
							<input class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#viewFiche"
								data-login="${item.getLogin()}" data-fname="${item.getFname()}" 
								data-name="${item.getName()}" data-address="${item.getAddress()}" 
								data-city="${item.getCity()}" data-zipcode="${item.getZipCode()}" 
								data-team="${item.getTeam()}" data-role="${item.getRole()}"
								data-mail="${item.getMail()}" data-nbleaves="${item.getNbLeaves()}"
								type="button" id="view-fiche" value="..." />
								
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%@ include file="parts/footer.jsp"%>
	
</body>
</html>