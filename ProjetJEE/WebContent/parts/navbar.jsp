<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand">Notre projet</a>
    <div class="collapse navbar-collapse">
        <a  class="nav-link" href="./GestionCongesPerso">Personnel</a>
        <a  class="nav-link" href="./GestionCongesEmployes">Employes</a>
        <a  class="nav-link" href="./GestionFiches">Fiches</a>
        <a  class="nav-link" href="./Statistiques">Statistiques</a>
    </div>

    <div class="my-2 my-lg-0">
        <span > ${emp.getFname()} ${emp.getName()} </span>
        <button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='Authentification.jsp'" type="submit">Log out</button >
    </div>
</nav>