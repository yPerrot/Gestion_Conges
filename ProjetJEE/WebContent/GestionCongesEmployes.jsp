<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Gestion des congés</title>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<div class="container">
		
		<span>${errors['wording']}</span>
		
		<div class="row">
			<div class="col">
				<h1>Congés des employés à valider</h1>
			</div>
		</div>
		
		<table class="table table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col" class="text-center">#</th>
					<th scope="col" class="text-center">Congés</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${emp.getTeam() == 'RH' && listLeavesToValid.isEmpty()}">
				<tr>
					<td colspan="2" class="text-center">Aucun congés pris</td>
				</tr>
			</c:if>
			
			<c:if test="${emp.getTeam() == 'RH' && !listLeavesToValid.isEmpty()}">
				<c:forEach items="${listLeavesToValid}" var="item" varStatus="loop">
					<tr>
						<th scope="row" class="text-center">${loop.index + 1}</th>
						<td>
								<form action="LeaveController" method="GET">
									<p>Employé : ${item.getLogin()}</p>
									<p>Du  : ${item.getBeginDate()} Au : ${item.getEndDate()}</p>
									<p>Motif : ${item.getReason()}</p>
									<p>Type : ${item.getType()}</p>
									<input type="hidden" name="upLogin" value=${item.getLogin()}></input>
									<input type="hidden" name="upBday" value=${item.getBeginDate()}></input>
									
									<div class="form-group">
										<label for="upWording">Laisser un commentaire :</label>
										<textarea class="form-control" id="upWording" name="upWording" rows="3"></textarea>
										<!-- <input type="text" class="form-control" id="upWording" placeholder="Commentaire"> -->
									</div>
  
  
									<!-- <label for="upWording">Laisser un commentaire :</label>
									<textarea name="upWording" rows="" cols=""></textarea>
									 -->
									
									<button class="btn btn-outline-success my-2 my-sm-0" name="action"
										value="accept">Accepter</button>
									<button class="btn btn-outline-danger my-2 my-sm-0" name="action"
										value="decline">Refuser</button>
									<br />
								</form>
							</td>
						</tr>
					</c:forEach>
					<hr />
				</c:if>
			</tbody>
		</table>	
	
		<div class="row">
			<div class="col">
				<h1>Congés des employés</h1>
			</div>
		</div>

		<table class="table table-bordered">

			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Identifiant</th>
					<th scope="col">Date de début</th>
					<th scope="col">Date de fin</th>
					<th scope="col">Motif</th>
					<th scope="col">Type</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${emp.getTeam() == 'RH' && listLeavesValidated.isEmpty()}">
					<tr>
						<td colspan="7" class="text-center">Aucun congés pris</td>
					</tr>
				</c:if>
				<c:if test="${emp.getTeam() == 'RH' && !listLeavesValidated.isEmpty()}">
					<c:forEach items="${listLeavesValidated}" var="item" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td><c:out value="${item.getLogin()}" /></td>
							<td><c:out value="${item.getBeginDate()}" /></td>
							<td><c:out value="${item.getEndDate()}" /></td>
							<td><c:out value="${item.getReason()}" /></td>
							<td><c:out value="${item.getType()}" /></td>
							<td class="text-center">
								<input class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#VisualisationConge"
									data-login="${item.getLogin()}"
									data-beginDate="${item.getBeginDate()}" data-endDate="${item.getEndDate()}" 
									data-duration="${item.getDuration()}" data-reason="${item.getReason()}" 
									data-type="${item.getType()}" data-state="${item.getState()}" 
									data-validDate="${item.getValidDate()}" data-wording="${item.getWording()}"
									type="button" id="view_info" value="..." />
							</td>
						</tr>
					</c:forEach>
					<hr />
				</c:if>
			</tbody>

		</table>
	
	</div>
	
	

	<%@ include file="parts/footer.jsp"%>
</body>
</html>