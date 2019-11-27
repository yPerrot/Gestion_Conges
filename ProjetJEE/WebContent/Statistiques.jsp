<%@ include file="parts/load.jsp"%>
<%
String name = (String)request.getAttribute("UserName");
request.setAttribute("name", name);
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="parts/includes.jsp"%>
<title>Statistiques</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<%@ include file="parts/navbar.jsp"%>

	<div class="container">

		<div class="row m-3">
			<div class="col-auto">
				<h2>Statistique :</h2>
			</div>
			<div class="col">
				<select class="custom-select">
					<option selected value="1">Type congés par nombre</option>
					<option value="2">Nombre de congés par mois</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-2">
				<button type="button" class="btn btn-secondary">Afficher</button>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<canvas id="myChart"></canvas>
			</div>
		</div>
		
		



		<script>
			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['Validé', 'Supprimé', 'En attente'],
			        datasets: [{
			            label: ['Validé','Validé','Validé'],
			            data: [12, 19, 3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
			</script>

	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>