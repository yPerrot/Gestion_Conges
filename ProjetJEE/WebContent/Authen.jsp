<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Boolean errorMeet = request.getAttribute("BadAuthen")==null?null:(Boolean)request.getAttribute("BadAuthen");
String pageTitle= "PUISQUE C'EST NOTRE PROJET !";
%>
<%@ include file="parts/header.jsp" %>  
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <a class="navbar-brand">Notre projet</a>
	</nav>
	
	<div class="container">
	    <div class="row">
	        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	            <div class="card card-signin my-5">
	                <div class="card-body">
	                    <h5 class="card-title text-center">Authentification</h5>
	                    <form class="form-signin" method="POST">
	                        <div class="form-label-group">
	                            <label for="inputEmail">Email address</label>
	                            <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required autofocus>
	                        </div>
	                        <div class="form-label-group">
	                            <label for="inputPassword">Password</label>
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