<%@ include file="parts/load.jsp"%>
<%
Boolean errorMeet = request.getAttribute("BadAuthen")==null?null:(Boolean)request.getAttribute("BadAuthen");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Authentification</title>
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
								<label for="inputEmail">Nom d'utilisateur</label> <input
									type="text" id="inputUser" name="inputUser"
									class="form-control" placeholder="Nom d'utilisateur" required
									autofocus>
							</div>
							<div class="form-label-group">
								<label for="inputPassword">Mot de passe</label> <input
									type="password" id="inputPassword" name="inputPassword"
									class="form-control" placeholder="Mot de passe" required>
							</div>
							<% if (errorMeet != null) {%>
							<label style="color: red">Invalid username or password</label>
							<%} else { %>
							</br>
							<%} %>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Envoyer</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>