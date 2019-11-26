<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="LeaveController?page=GestionCongesPerso" class="navbar-brand">Gestionnaire de congé</a>
    <div class="collapse navbar-collapse">
        <a  class="nav-link" href="LeaveController?page=GestionCongesPerso">Personnel</a>
        <a  class="nav-link" href="./GestionCongesEmployes.jsp">Employes</a>
        <a  class="nav-link" href="./GestionFiches.jsp">Fiches</a>
        <a  class="nav-link" href="./Statistiques.jsp">Statistiques</a>
    </div>

    <div class="my-2 my-lg-0">
        <span > ${emp.getFname()} ${emp.getName()} - ${emp.getRole()} (${emp.getTeam()}) </span>
        <button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='AuthController?logout'" type="submit">Log out</button >
    </div>
</nav>