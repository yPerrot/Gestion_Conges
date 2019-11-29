<%@ include file="load.jsp"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="LeavePersoController" class="navbar-brand">Gestionnaire de congé</a>
    <div class="collapse navbar-collapse">
        <a class="nav-link" href="LeavePersoController">Mon Espace</a>
        <c:if test="${emp.getTeam() == 'RH'}">
	        <a class="nav-link" href="LeaveEmpController">Employés</a>
	        <a class="nav-link" href="EmployeeController">Fiches</a>
	        <a class="nav-link" href="StatisticsController">Statistiques</a>
        </c:if>
    </div>

    <div class="my-2 my-lg-0">
        <span > ${emp.getFname()} ${emp.getName()} - ${emp.getRole()} (${emp.getTeam()}) </span>
        <button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='AuthController?logout'" type="submit">Log out</button >
    </div>
</nav>