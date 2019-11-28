<%@ include file="parts/load.jsp"%>
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
				<h2>Statistiques :</h2>
			</div>
			<div class="col">
				<select onchange="showChart()" class="custom-select" id="chartList">
					<option selected value="1">Nombre de congés par type</option>
					<option value="2">Nombre de congés validé par mois, sur la dernière année</option>
					<option value="3">Nombre d'employés par domaine</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<canvas id="myChart" responsive=true"></canvas>
			</div>
		</div>

		<script>
			let data1 = ${data1};
			let data2 = ${data2};
			let data3 = ${data3}
		
			let canvas = document.getElementById('myChart')
			var ctx = canvas.getContext('2d');
			var myChart;
			showChart();

			function showChart() {
				let l = document.getElementById("chartList");
				let idGraphe = l.options[l.selectedIndex].value;
				if (myChart) myChart.destroy();
				switch (idGraphe) {
				case "1" :
					
					myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: ['Validé','Refusé','En attente'],
					        datasets: [{
					            label: 'Nombre de congés par type',
					            data: data1,					            
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
					        },
					        legend: {
					            display: false
					        },
					        tooltips: {
					            callbacks: {
					               label: function(tooltipItem) {
					            	   return tooltipItem.yLabel;
					               }
					            }
					        }
					    }
					});
					
					break;
					case "2" :
						
						myChart = new Chart(ctx, {
						    type: 'line',
						    data: {
						        labels: getListMonth(),
						        datasets: [{
						            label: 'Nombre de congés pris par mois',
						            data: data2,
						            fill: false,
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.2)'
						            ],
						            borderColor: [
						                'rgba(255, 99, 132, 1)'
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
						        },    
						        legend: {
						            display: false
						        },
						        tooltips: {
						            callbacks: {
						               label: function(tooltipItem) {
						                      return tooltipItem.yLabel;
						               }
						            }
						        }
						    }
						});
						
						break;
					case "3" :
						
						myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ['Comptabilité', 'Informatique', 'En RH'],
						        datasets: [{
						            label : "Nombre d'employés par domaine",
						            data: data3,
						            backgroundColor: [
						                'rgba(75, 192, 192, 0.2)',
						                'rgba(153, 102, 255, 0.2)',
						                'rgba(255, 159, 64, 0.2)'
						            ],
						            borderColor: [
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
						        },
							    legend: {
							        display: false
							    },
							    tooltips: {
							        callbacks: {
							           label: function(tooltipItem) {
							                  return tooltipItem.yLabel;
							           }
							        }
							    }
						    }
						});
						
						break;
				}
			}
			
			function getListMonth() {
				let listMonth = [];
				let d = new Date(); 
				let month = d.getMonth() + 1;
				let year = d.getYear() - 100;
				
				for(let i = 0 ; i < 12 ; i++){
					if (month === 1){
						month = 12;
						year--;
					} else {
						month--;
					}
					listMonth.unshift(month+'/'+year)			
				}
				return listMonth;
			}
			</script>

	</div>

	<%@ include file="parts/footer.jsp"%>
</body>
</html>