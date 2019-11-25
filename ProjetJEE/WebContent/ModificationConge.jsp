<%@ include file="parts/load.jsp"%>
<%@page import="org.gdc.models.Leave,java.util.Date,java.util.ArrayList,java.text.SimpleDateFormat"%>
<%
Leave conge = new Leave("yperrot",new Date(),new Date(),10,"raison","Maladie","validé",new Date(),"wording");
request.setAttribute("typeConge", conge.getType());

ArrayList listeTypeConge = new ArrayList<String>();
listeTypeConge.add("Maladie");
listeTypeConge.add("Famille");
listeTypeConge.add("Enfants malades");
listeTypeConge.add("FormaRaisons personnellestion");

request.setAttribute("listeTypeConge", listeTypeConge);

SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

request.setAttribute("beginDate", formater.format(conge.getBeginDate()));
request.setAttribute("endDate", formater.format(conge.getEndDate()));
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="parts/includes.jsp"%>
<title>Modification conge</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">

		<!-- <p>Date: <input type="text" id="datepicker"></p>
			<script>
				$( function() {
					$( "#datepicker" ).datepicker();
				} );
			</script>
		-->
		
		<h1>Modification de conge : </h1>
		<form>

			<div class="form-group">
				<label>Debut de conge :</label> <input type="date" name="bday"
					max="3000-12-31" min="1000-01-01" class="form-control" value="${beginDate}">
			</div>

			<div class="form-group">
				<label>Fin de conge :</label> <input type="date" name="bday"
					min="1000-01-01" max="3000-12-31" class="form-control" value="${endDate}">
			</div>

			<!-- 	
					Compter jours ouvres : 
					https://www.developpez.net/forums/d51971/javascript/general-javascript/compter-nb-jours-ouvres-entre-2-dates/ 
					https://www.developpez.net/forums/d1607647/java/general-java/apis/java-util/savoir-jour-ferie/
				-->

			<!-- Informations a recuperer dans la BDD -->
			<div class="form-group">
				<label>Raison conge :</label> 
				<select class="form-control">
				    <c:forEach var="item" items="${listeTypeConge}">
				        <option value="${item}" ${item == typeConge ? 'selected="selected"' : ''}>${item}</option>
				    </c:forEach>
				</select>
<%-- 				<select class="form-control">
					<option value="RTT" <c:if test="${item.key == 1}"> selected </c:if>>RTT</option>
					<option value="Conges_Annuels">Conges annuels</option>
					<option value="Enfant_Malade">Enfant malade</option>
					<option value="Famille">Famille</option>
				</select> --%>
			</div>

			<button class="btn btn-outline-success my-2 my-sm-0"
				onclick="location.href='User.jsp'" type="submit">Valider</button>
			<button class="btn btn-outline-danger my-2 my-sm-0"
				onclick="location.href='User.jsp'" type="submit">Annuler</button>

		</form>

	</div>

	<%@ include file="parts/footer.jsp"%>

</body>
</html>