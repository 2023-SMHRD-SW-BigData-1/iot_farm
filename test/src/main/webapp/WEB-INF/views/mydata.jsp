<!DOCTYPE html>
<%@page import="com.smhrd.bigdata.model.Iotsensor_Info"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.smhrd.bigdata.model.Sensor_Re"%>
<%@page import="com.smhrd.bigdata.model.IoT_Sensor"%>
<%@page import="com.smhrd.bigdata.model.TestMember"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.bigdata.model.Useriot_Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Boxed Layout - SB Admin Pro</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
<script>function sensorContent(sensorNum){
	$.ajax({
		type:"get",
		url:"mydata/sensor/"+sensorNum,
		success:function(response){
			var first = response.first; 
        	var second = response.second;
        	var table = response.table;
        	
			if (second == 1){second = "온도 센서";}
			else if (second == 2){second = "온습도 센서";}
			else if (second == 3){ second = "조도 센서";}
			else if (second == 4){ second = "토양 수분 센서";}
			else if (second == 5){ second = "강우 센서";}
       	   
       	
        	
			var titleLayout=document.getElementById("mydata_title");
			titleLayout.innerHTML = "";
        	var title = document.createElement("div");
        	title.innerHTML = `
        		<h1 class="page-header-title fw-800">
				`+first+`
			</h1>
			<div class="page-header-subtitle">`+second+`</div>
        	`;
        	titleLayout.appendChild(title);
			
        	var contentLayout = document.getElementById("mydata_content");
			contentLayout.innerHTML="";
			var contentDiv = document.createElement("div");
			var content=`<div class="card mb-4">
				<div class="card-header">Sensor History</div>
				<div class="card-body p-0">
					<!-- Billing history table-->
					<div class="table-responsive table-billing-history">
						<table class="table mb-0">
							<thead>
						<thead>
							<tr>
							<th></th>
							 <th>Sensor Value</th>
                             <th>&nbsp&nbsp&nbsp&nbsp&nbspDate</th>
                             <th>&nbsp&nbspTime</th>
                             <th></th>
							</tr>
						</thead>
						<tbody>`;
			
						for (var i = 0; i < table.length; i++) {
		                	   content+=`<tr>
		                	   <td></td>
		                           <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp`+table[i].sensor_value+`</td>
		                           <td>`+table[i].re_date+`</td>
		                           <td>`+table[i].re_time+`</td>
		                           <td></td>
		                       </tr>`;
						}
				content+=`</tbody>
					</table>
				</div>
			</div>`;
                    contentDiv.innerHTML =content;
                    contentLayout.appendChild(contentDiv);
        	
						}
						
	})
};</script>
</head>
<body class="nav-fixed">
	<jsp:include page="modal.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	IoT_Sensor max = (IoT_Sensor) session.getAttribute("max");
	%>
	<div id="layoutSidenav">

		<!-- 내비게이션 -->
		<div id="layoutSidenav_nav">
			<nav class="sidenav shadow-right sidenav-light ">
				<a href="/bigdata/" class="mx-4 mt-n4 mb-sm-5"> <img
					class="img-fluid" src="assets/img/ioflogo.png" alt="" />
				</a>
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">

						<!-- iot-->
						<div class="sidenav-menu-heading nav-menu">
							<div>iot register</div>
							<%
							if (max.getMaxIot() > max.getMyIot()) {
							%>
							<button
								class="nav-plus badge bg-primary-soft text-primary ms-auto"
								href="#" data-bs-toggle="modal" data-bs-target="#iotModal1">+</button>
							<%
							} else {
							%>
							<a style="text-decoration: none"
								class="nav-plus badge bg-primary-soft text-primary" href="#!"
								tabindex="0" data-bs-container="body" data-bs-toggle="popover"
								data-bs-placement="right"
								data-bs-content="더 많은 IoT를 사용 가능을 위해 버전 업그레이드가 필요합니다!"
								title="IoT의 최대개수에 도달했습니다.">+</a>
							<%
							}
							%>
						</div>

						<c:forEach items="${iotList}" var="item">
							<a class="nav-link collapsed" href="javascript:void(0);"
								data-bs-toggle="collapse"
								data-bs-target="#collapseUtilities${item.iot_num}"
								aria-expanded="false" aria-controls="collapseUtilities">
								<div class="nav-link-icon">
									<i data-feather="settings"></i>
								</div> ${item.iot_name}
								<div class="sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div>
								<div class="collapse" id="collapseUtilities${item.iot_num }"
									data-bs-parent="#accordionSidenav">
									<nav class="sidenav-menu-nested nav">
										<c:forEach items="${sensorList}" var="item2">
											<c:forEach items="${item2}" var="item3">
												<div class="lotRegister">
													<c:if
														test="${item.getIot_num().equals(item3.getIot_num())}">
														<a class="nav-link lot-register-width" href="#"
															onclick="sensorContent(${item3.sensor_num})">${item3.sensor_name}</a>
														<div>
															<a href="#" style="color: #a7aeb8"
																onclick="sensor_delete(${item3.sensor_num})"><i
																data-feather="trash-2" class="margin-right12"></i></a>
														</div>
													</c:if>
												</div>
											</c:forEach>
										</c:forEach>
										<%
										if (max.getMaxSensor() > max.getMySensor()) {
										%>
										<div class="lotRegister">
											<button class="nav-link sensor-btn" data-bs-toggle="modal"
												href="#" data-bs-target="#exampleModalCenter${item.iot_num}">센서등록</button>
											<button class="nav-link sensor-btn" href="#"
												onclick="delete_iot(${item.iot_num})">기기삭제</button>
										</div>
										<%
										}
										%>
									</nav>
								</div>
							</div>
						</c:forEach>


						<!-- dashboard-->
						<div class="sidenav-menu-heading nav-menu">
							<div>dash boards</div>
							<button
								class="nav-plus badge bg-primary-soft text-primary ms-auto"
								href="#" data-bs-toggle="modal"
								data-bs-target="#dashboardModal1">+</button>
						</div>
						<div class="collapse" id="collapsePages"
							data-bs-parent="#accordionSidenav">
							<nav class="sidenav-menu-nested nav accordion"
								id="accordionSidenavPagesMenu"></nav>
						</div>

						<!-- Sidenav Accordion (Dashboard)-->

						<c:forEach items="${dashboardList }" var="dashboard">
							<div class="lotRegister">
								<a class="nav-link collapsed mt-10px lot-register-width"
									href="#" onclick="dataselect(${dashboard.dashboard_num})">
									<div class="nav-link-icon">
										<i data-feather="layout"></i>
									</div>${dashboard.dashboard_name}
								</a>
								<div>

									<a href="#" style="color: #a7aeb8"
										onclick="dashboard_delete(${dashboard.dashboard_num})"><i
										class="mt-2 margin-right12" data-feather="trash-2"></i></a>
								</div>
							</div>
						</c:forEach>
					</div>
			</nav>
		</div>

		<!-- 본문 -->
		<div id="layoutSidenav_content" style="margin-top: -3.5rem">
			<main>
				<header
					class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
					<div class="container-xl px-4">
						<div class="page-header-content pt-4">
							<div class="row align-items-center justify-content-between">
								<div class="col-auto mt-4" id="mydata_title">
									<h1 class="page-header-title fw-800">
										마이데이터
									</h1>
									<br>
									<div class="page-header-subtitle">데이터를 입력하고 모니터링하세요!</div>
								</div>
							</div>
						</div>
					</div>
				</header>




				<!-- Dashboard content-->

				<div class="container-xl px-4">
					<div class="mt-n10">
						<div id="mydata_content">
							<div class="container-xl px-4">
								<div class="card mt-n10">
									<div class="card-header">환영합니다!</div>
									<div class="card-body">
										아오팜은 IoT 클라우드 솔루션과 모니터링 웹서비스를 지원하고 있습니다.<br> 클라우드 서비스와 같이
										자신에게 맞는 모니터링 대시보드를 구성해봅시다!

									</div>
								</div>


								<div class="card mt-4">
									<div class="card-header">IoT 클라우드 서비스 이용하기</div>
									<div class="card-body">
										아오팜은 자신 센서데이터를 저장할 수 있는 IoT 클라우드 서비스를 제공하고 있습니다. <br> 다음의
										단계를 따라가면서 클라우드 서비스를 이용해봅시다.<br>
										<br> <br> <br> <a class="nav-link"
											href="/bigdata/guide/guide_iotSetting">IoT 세팅부터 시작하기<i
											data-feather="arrow-right" style="margin-top:0.15rem"></i></a>


									</div>
								</div>
								<div class="card mt-4 mb-15">
									<div class="card-header">대시보드 차트 선택하기</div>
									<div class="card-body">
									<div class="card-header mt-4">Line Chart</div>
                                <div class="chart-area"><canvas id="examplelinechart" width="100%" height="30"></canvas></div>
                                <div class="card-header mt-10">Bar Chart</div>
                                <div class="chart-area"><canvas id="exampleBarchart" width="100%" height="30"></canvas></div>
                           
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script>	
	// Area Chart Example
function dataselect(dashboardNum) {
    $.ajax({
        type: "GET",
        url: "mydata/" + dashboardNum,
        dataType: "json",
        success: function(response) {
        	var sensorDataLList = response.reselect; 
        	var chartTypeList = response.chartTypeList;
        	var dashboardInfo = response.dashboardInfo;
			
        	console.log("sensorDataLList : ",sensorDataLList);
        	console.log("chartTypeList : ",chartTypeList);
        	console.log("chartTypeList : ",chartTypeList[0].chart_name);
        	
        	
        	
        	
        	
        	var chartdatatitle=document.getElementById("mydata_title");
        	chartdatatitle.innerHTML = "";
        	var title = document.createElement("div");
        	title.innerHTML = `
        	<h1 class="page-header-title" id="titleDashboardName">
        		`+dashboardInfo[0].dashboard_name+`</h1>
        	`;
        	chartdatatitle.appendChild(title);
        	
        	
        	
        	
        	
        	var chartdatacontent = document.getElementById("mydata_content");
    	    chartdatacontent.innerHTML = "";
        	for (var i = 0; i < sensorDataLList.length; i++) {
        		let timeList = [];
        		let minList = [];
        		let dataList = [];
        		
        		
        	    var chartTypehtml = chartTypeList[i].chart_type; // 현재 차트 타입을 가져옴
        		var chartNameList = chartTypeList[i].chart_name;
        		
        	    for(var j = 0; j < sensorDataLList[i].length; j++){
        	    timeList.push(sensorDataLList[i][j].re_date)
        	    dataList.push(sensorDataLList[i][j].sensor_value)
        	    minList.push(sensorDataLList[i][j].re_time)
        	    }
        	    
        	    console.log("timeList :",timeList)
        	    console.log("dataList :",dataList)
        	    console.log("minList :",minList)
        	    console.log("chartName :",chartNameList)
        	    console.log("chartType: ",chartTypehtml)

				
        	    if (timeList.length == 0){
        	    	var content = document.createElement("div");
        	    	content.innerHTML = `
        	            <div class="mt-4 mb-4">
        	                <div class="card mb-4">
        	                    <div class="card-header">`+chartNameList+`</div>
        	                    <div class="card-body">
        	                        <div class="pt-10 emptychartcontent">
        	                            <div width="100%" style="height:20" class="mb-3">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp입력하신 데이터가 없습니다.<br> 가이드라인을 참고하여 데이터를 입력해주세요.</div>
        	                            </div>
        	                            <div class="emptychartcontent linkguideline">
        	                            <a href="guide/guide_first" class="">데이터를 입력하는법을 모르신다면 ?</a>
        	                            <div>
        	                    </div>
        	                </div>
        	            </div>
        	            
        	        `;
        	        chartdatacontent.appendChild(content);
        	        continue;
        	    }
        	
        	    
        	    
        	    if (chartTypehtml === 'line') {
        	    	var content = document.createElement("div");
        	    	content.innerHTML = `
        	            <div class="mt-4 mb-4">
        	                <div class="card mb-4">
        	                    <div class="card-header">`+chartNameList+`</div>
        	                    <div class="card-body">
        	                        <div class="chart-area">
        	                            <canvas id="myLineChart" width="100%" height="30"></canvas>
        	                        </div>
        	                    </div>
        	                </div>
        	            </div>
        	            
        	        `;
        	        
        	        
        	        chartdatacontent.appendChild(content);
        	        
        	        
                	const maxValue = Math.max(...dataList);
					
                	var ctx = document.getElementById("myLineChart");
                	var myLineChart = new Chart(ctx, {
                	    type: "line",
                	    data: {
                	        labels: 
                	        	minList,
                	        datasets: [{
                        	            label: "값",
                        	            lineTension: 0.3,
                        	            backgroundColor: "rgba(0, 97, 242, 0.05)",
                        	            borderColor: "rgba(0, 97, 242, 1)",
                        	            pointRadius: 3,
                        	            pointBackgroundColor: "rgba(0, 97, 242, 1)",
                        	            pointBorderColor: "rgba(0, 97, 242, 1)",
                        	            pointHoverRadius: 3,
                        	            pointHoverBackgroundColor: "rgba(0, 97, 242, 1)",
                        	            pointHoverBorderColor: "rgba(0, 97, 242, 1)",
                        	            pointHitRadius: 10,
                        	            pointBorderWidth: 2,
                        	            data: dataList
                        	        }] 
                	    },
                	    options: {
                	        maintainAspectRatio: false,
                	        layout: {
                	            padding: {
                	                left: 10,
                	                right: 25,
                	                top: 25,
                	                bottom: 0
                	            }
                	        },
        	        	        scales: {
        	        	            xAxes: [{
        	        	                time: {
        	        	                    unit: "date"
        	        	                },
        	        	                gridLines: {
        	        	                    display: false,
        	        	                    drawBorder: false
        	        	                },
        	        	                ticks: {
        	        	                    maxTicksLimit: 8
        	        	                }
        	        	            }],
                	            yAxes: [{
                	                ticks: {
                	                	min: 0,
                	                    max: maxValue,
                	                    maxTicksLimit: 5,
                	                    stepSize: maxValue/40,
                	                    padding: 10,
                	                    // Include a dollar sign in the ticks
                	                    callback: function(value, index, values) {
                	                        return number_format(value);
                	                    }
                	                },
                	                gridLines: {
                	                    color: "rgb(234, 236, 244)",
                	                    zeroLineColor: "rgb(234, 236, 244)",
                	                    drawBorder: false,
                	                    borderDash: [2],
                	                    zeroLineBorderDash: [2]
                	                }
                	            }]
                	        },
                	        legend: {
                	            display: false
                	        },
                	        tooltips: {
                	            backgroundColor: "rgb(255,255,255)",
                	            bodyFontColor: "#858796",
                	            titleMarginBottom: 10,
                	            titleFontColor: "#6e707e",
                	            titleFontSize: 14,
                	            borderColor: "#dddfeb",
                	            borderWidth: 1,
                	            xPadding: 15,
                	            yPadding: 15,
                	            displayColors: false,
                	            intersect: false,
                	            mode: "index",
                	            caretPadding: 10,
                	            callbacks: {
                	                label: function(tooltipItem, chart) {
                	                	 var datasetLabel =
                	                         chart.datasets[tooltipItem.datasetIndex].label || "";
                	                     var labelText = datasetLabel + " : " + number_format(tooltipItem.yLabel);
                	                     labelText += ", 날짜 : " + timeList[tooltipItem.index]; // minList 값 추가
                	                     return labelText;
                	                }
                	            }
                	        }
                	    }
                	}); 
        	        
        	        
        	        
        	        
        	    } else if (chartTypehtml === 'bar') {
        	    	var content = document.createElement("div");
    	    		content.innerHTML = `
        	                <div class="card h-100 mt-4">
        	                        <div class="card-header">`+chartNameList+`</div>
        	                        <div class="card-body d-flex flex-column justify-content-center">
        	                            <div class="chart-bar">
        	                                <canvas id="myBarChart" width="100%" height="30"></canvas>
										</div>
        	                            </div>
        	                        </div>
        	            
        	        `;
        	        chartdatacontent.appendChild(content);
        	        
        			const maxValue = Math.max(...dataList);
        			
                	// Bar Chart Example
                	var ctx = document.getElementById("myBarChart");
                	var myBarChart = new Chart(ctx, {
                	    type: "bar",
                	    data: {
                	        labels: minList,
                	        datasets: [{
                	            label: "값",
                	            backgroundColor: "rgba(0, 97, 242, 1)",
                	            hoverBackgroundColor: "rgba(0, 97, 242, 0.9)",
                	            borderColor: "#4e73df",
                	            data: dataList,
                	            maxBarThickness: 25
                	        }]
                	    },
                	    options: {
                	        maintainAspectRatio: false,
                	        layout: {
                	            padding: {
                	                left: 10,
                	                right: 25,
                	                top: 25,
                	                bottom: 0
                	            }
                	        },
                	        scales: {
                	            xAxes: [{
                	                time: {
                	                    unit: "month"
                	                },
                	                gridLines: {
                	                    display: false,
                	                    drawBorder: false
                	                },
                	                ticks: {
                	                    maxTicksLimit: 8
                	                }
                	            }],
                	            yAxes: [{
                	                ticks: {
                	                    min: 0,
                	                    max: maxValue,
                	                    maxTicksLimit: 10,
                	                    stepSize: maxValue/40,
                	                    padding: 10,
                	                    // Include a dollar sign in the ticks
                	                    callback: function(value, index, values) {
                	                        return number_format(value);
                	                    }
                	                },
                	                gridLines: {
                	                    color: "rgb(234, 236, 244)",
                	                    zeroLineColor: "rgb(234, 236, 244)",
                	                    drawBorder: false,
                	                    borderDash: [2],
                	                    zeroLineBorderDash: [2]
                	                }
                	            }]
                	        },
                	        legend: {
                	            display: false
                	        },
                	        tooltips: {
                	            titleMarginBottom: 10,
                	            titleFontColor: "#6e707e",
                	            titleFontSize: 14,
                	            backgroundColor: "rgb(255,255,255)",
                	            bodyFontColor: "#858796",
                	            borderColor: "#dddfeb",
                	            borderWidth: 1,
                	            xPadding: 15,
                	            yPadding: 15,
                	            displayColors: false,
                	            caretPadding: 10,
                	            callbacks: {
                	                label: function(tooltipItem, chart) {
                	                	var datasetLabel =
               	                         chart.datasets[tooltipItem.datasetIndex].label || "";
               	                     var labelText = datasetLabel + " : " + number_format(tooltipItem.yLabel);
               	                     labelText += ", 날짜 : " + timeList[tooltipItem.index]; // minList 값 추가
               	                     return labelText;
                	                }
                	            }
                	        }
                	    }
                	});  
        			
        			
        	    }

        	    chartdatacontent.appendChild(content);
        	}
        
      
        },
        error: function(xhr, status, error) {
            console.log("error"); // 오타 수정
        }
    });
    
	};
	</script>
	<script>
		function dashboard_delete(dashboard_num){
			$.ajax({
				url : "mydata/dashboard_delete/"+dashboard_num,
				type : "get",
				success : function(){
					console.log("성공")
					location.reload();
				},
				error : function(){
					console.log("실패");
				}
			})
		}
	</script>
	<script>
	function sensor_delete(sensor_num){
		$.ajax({
			url : "mydata/sensor_delete/"+sensor_num,
			type : "get",
			success : function(){
				console.log("성공")
				location.reload();
			},
			error : function(){
				console.log("실패");
			}
		})
	}
	
	</script>
	<script>
	function delete_iot(iot_num){
		$.ajax({
			url : "mydata/iot_delete/"+iot_num,
			type : "get",
			success : function(){
				console.log("성공")
				location.reload();
			},
			error : function(){
				console.log("실패");
			}
		})
	}

	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-pie-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js"
		crossorigin="anonymous"></script>
	<script src="js/litepicker.js"></script>
	<script src="js/datatables/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>