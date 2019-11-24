<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name = (String)request.getAttribute("UserName");
request.setAttribute("nbCongesRestant", 5);


%>
<!DOCTYPE html>

<html>
<head>
	<%@ include file="parts/includes.jsp" %> 
	<title>Gestion des congés de <%=name%></title>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').trigger('focus')
		})
	</script>
</head>
<body>
	
		<%@ include file="parts/navbar.jsp" %>  
	
<!-- Debut Tests PopUp  -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmation suppression</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col tex-left">
     			<p>Voulez-vous supprimer le congés 1 :</p>
      		</div>
      	</div>
      	<div class="row text-right"> 
      		<div class="col tex-left">     			
      			<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        		<button type="button" class="btn btn-primary" onclick="myFunction">Supprimer</button>
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
				<h3>Solde de conges restant : </h3>
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
				<h1>Vos conges en cours de validation: </h1>
			</div>
			<div class="col-2 align-self-center">
				<button class="btn btn-secondary" onclick="location.href='DemandeConge.jsp'">Nouveau congé</button>
			</div>
		</div>
		
		<table class="table table-bordered">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Date Debut</th>
		      <th scope="col">Date Fin</th>
		      <th scope="col">Motif</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>Perso</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td>Famille</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>Maladie</td>
		    </tr>
		  </tbody>
		</table>
		
				<div class="row">
			<div class="col">
				<h1>Vos congés : </h1>
			</div>
		</div>
		
		<table class="table table-bordered">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Date Debut</th>
		      <th scope="col">Date Fin</th>
		      <th scope="col">Motif</th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>Perso</td>
		      <td class="text-center">
		      	<button class="btn btn-secondary btn-sm" type="button" id="modifie-site">Modifier</button>
               	<button class="btn btn-secondary btn-sm" type="button" id="delete-site" data-toggle="modal" data-target="#exampleModal">Supprimer</button>
		      </td>
		      <td class="text-center"><button type="button" class="btn btn-outline-dark">...</button></td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td>Famille</td>
		      <td class="text-center">
		      	<button class="btn btn-secondary btn-sm" type="button" id="modifie-site">Modifier</button>
               	<button class="btn btn-secondary btn-sm" type="button" id="delete-site">Supprimer</button>
		      </td>
		      <td class="text-center"><button type="button" class="btn btn-outline-dark">...</button></td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>Maladie</td>
		      <td class="text-center">
		      	<button class="btn btn-secondary btn-sm" type="button" id="modifie-site">Modifier</button>
               	<button class="btn btn-secondary btn-sm" type="button" id="delete-site">Supprimer</button>
		      </td>
		      <td class="text-center"><button type="button" class="btn btn-outline-dark">...</button></td>
		    </tr>
		  </tbody>
		</table>
		
		<!-- Fin container -->
		</div>	
		
		<script>
			function suppressionConge() {
				
			}
			
			function openPopUpSuppression() {
				
			}
		</script>
		
	</body>
</html>