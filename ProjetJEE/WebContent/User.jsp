<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des congés de ${emp.getFname()}</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand">Notre projet</a>
		<div class="collapse navbar-collapse">
			<a class="nav-link" href="#">Congés</a> <a class="nav-link" href="#">Statistic</a>
		</div>

		<div class="my-2 my-lg-0">
			<span> ${emp.getFname()} ${emp.getName()} </span>
			<button class="btn btn-outline-success my-2 my-sm-0"
				onclick="location.href='Authen.jsp'" type="submit">Log out</button>
		</div>
	</nav>

	<div class="container">

		<div class="row">
			<div class="col-xl-10">
				<h1>Vos congés :</h1>
			</div>
			<div class="col-xl-2 align-self-center">
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
					<th scope="col">Durée</th>
					<th scope="col">Motif</th>
					<th scope="col">Type</th>
					<th scope="col">Etat</th>
					<th scope="col">Date de validation</th>
					<th scope="col">Commentaire</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listLeaves}" var="item">
					<tr>
						<th scope="row">1</th>
						<td><c:out value="${item.getBeginDate()}" /></td>
						<td><c:out value="${item.getEndDate()}" /></td>
						<td><c:out value="${item.getDuration()}" /></td>
						<td><c:out value="${item.getReason()}" /></td>
						<td><c:out value="${item.getType()}" /></td>
						<td><c:out value="${item.getState()}" /></td>
						<td><c:out value="${item.getValidDate()}" /></td>
						<td><c:out value="${item.getWording()}" /></td>
						<td class="text-center"><input type="button" id="modifie-site"
						value="Modifier" /> <input type="button" id="delete-site"
						value="Supprimer" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>