<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name = (String)request.getAttribute("UserName");
%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Gestion des congés de <%=name%></title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    	<a class="navbar-brand">Notre projet</a>
			<div class="collapse navbar-collapse">
	    		<a  class="nav-link" href="#">Congés</a>
	    		<a  class="nav-link" href="#">Statistic</a>
			</div>
			
			<div class="my-2 my-lg-0">
				<span ><%=name%></span>
		    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log out</button >
			</div>
		</nav>
		
		<div class="container">
		
		<div class="row">
			<div class="col-xl-10">
				<h1>Vos congés : </h1>
			</div>
			<div class="col-xl-2 align-self-center">
				<button class="btn btn-secondary">Nouveau congé</button>
			</div>
		</div>
		
		<table class="table table-bordered">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">First</th>
		      <th scope="col">Last</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td class="text-center">
		      	<input type="button" id="modifie-site" value="Modifier" />
               	<input type="button" id="delete-site"  value="Supprimer" />
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td class="text-center">
		      	<input type="button" id="modifie-site" value="Modifier" />
               	<input type="button" id="delete-site"  value="Supprimer" />
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td class="text-center">
		      	<input type="button" id="modifie-site" value="Modifier" />
               	<input type="button" id="delete-site"  value="Supprimer" />
		      </td>
		    </tr>
		  </tbody>
		</table>
		</div>	

	</body>
</html>