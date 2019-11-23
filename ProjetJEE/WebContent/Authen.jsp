<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Boolean errorMeet = request.getAttribute("BadAuthen")==null?null:(Boolean)request.getAttribute("BadAuthen");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PUISQUE C'EST NOTRE PROJET !</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <a class="navbar-brand">Notre projet</a>
	</nav>
	
	<div class="container">
	    <div class="row">
	        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	            <div class="card card-signin my-5">
	                <div class="card-body">
	                    <h5 class="card-title text-center">Authentification</h5>
	                    <form class="form-signin" action="AuthController" method="POST">
	                        <div class="form-label-group">
	                            <label for="inputEmail">Nom d'utilisateur</label>
	                            <input type="text" id="inputEmail" name="inputUser" class="form-control" placeholder="Username" required autofocus>
	                        </div>
	                        <div class="form-label-group">
	                            <label for="inputPassword">Mot de passe</label>
	                            <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
	                        </div>
							<% if (errorMeet != null) {%>
								<label style="color:red">Invalid username or password</label>
							<%} else { %>
							</br>
							<%} %>
	                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Envoyer</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
</body>
</html>