<%@ include file="parts/load.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Gestion des congés</title>
</head>
<body>

	<%@ include file="parts/navbar.jsp"%>

	<!-- Service RH -->
	<div>
		<span>${errors['wording']}</span>
		<c:if test="${emp.getTeam() == 'RH' && !listLeavesToValid.isEmpty()}">
			<p>Il y a des nouvelles demandes de congés !</p>
			<c:forEach items="${listLeavesToValid}" var="item" varStatus="loop">
				<form action="LeaveController" method="GET">
					<p>${item.getLogin()}
						<span>a fait une nouvelle demande</span>
					</p>
					<p>Motif : ${item.getReason()} - Du ${item.getBeginDate()} au
						${item.getEndDate()}</p>
					<input type="hidden" name="upLogin" value=${item.getLogin()}></input>
					<input type="hidden" name="upBday" value=${item.getBeginDate()}></input>
					<label for="upWording">Laisser un commentaire :</label>
					<textarea name="upWording" rows="" cols=""></textarea>
					<button class="btn btn-outline-success my-2 my-sm-0" name="action"
						value="accept">Accepter</button>
					<button class="btn btn-outline-danger my-2 my-sm-0" name="action"
						value="decline">Refuser</button>
					<br />
				</form>
			</c:forEach>
			<hr />
		</c:if>
	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>