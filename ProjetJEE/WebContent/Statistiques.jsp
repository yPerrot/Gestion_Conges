<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String name = (String)request.getAttribute("UserName");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Statistiques</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    	<a class="navbar-brand">Notre projet</a>
			<div class="collapse navbar-collapse">
	    		<a  class="nav-link" href="#">Congés</a>
	    		<a  class="nav-link" href="#">Statistic</a>
			</div>
			
			<div class="my-2 my-lg-0">
				<span ><%=name%></span>
		    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log out</button >
			</div>
		</nav>
		
		<div class="container">

		
			<canvas id="myChart" width="200" height="200"></canvas>
			<script>
			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			        datasets: [{
			            label: '# of Votes',
			            data: [12, 19, 3, 5, 2, 3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
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
		
</body>
</html>