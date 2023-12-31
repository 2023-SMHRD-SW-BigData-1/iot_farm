<!DOCTYPE html>
<%@page import="com.smhrd.bigdata.model.TestMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Account Settings - Notifications - SB Admin Pro</title>
<link href="../css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="../assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="nav-fixed">
	<jsp:include page="header.jsp"></jsp:include>

	<div id="layoutSidenav">
		
		<!-- 내비게이션 -->
		<div id="layoutSidenav_nav">
			<nav class="sidenav shadow-right sidenav-light">
				<a href="/bigdata/" class="mx-4 mt-n4 mb-sm-5"> <img
					class="img-fluid" src="../assets/img/ioflogo.png" alt="" />
				</a>
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">

						<!-- Sidenav Heading (Custom)-->
						<div class="sidenav-menu-heading">아오팜 시작하기</div>
						<a style="font-size: 0.8rem" class="nav-link"
							href="/bigdata/guide/guide_first" class="text-body">
							<div class="nav-link-icon">
								<i data-feather="book"></i>
							</div> 서비스 소개
						</a>

						<!-- Sidenav Heading (Custom)-->
						<div class="sidenav-menu-heading">마이데이터</div>
						<!-- Sidenav Accordion (Pages)-->
						<a style="font-size: 0.8rem" class="nav-link collapsed"
							href="javascript:void(0);" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="true"
							aria-controls="collapsePages">
							<div class="nav-link-icon">
								<i data-feather="globe"></i>
							</div> 클라우드 서비스 이용하기
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse show" id="collapsePages"
							data-bs-parent="#accordionSidenav">
							<nav class="sidenav-menu-nested nav accordion"
								id="accordionSidenavPagesMenu">
								<a class="nav-link" href="/bigdata/guide/guide_iotSetting">IoT 세팅하기</a> <a
									class="nav-link" href="/bigdata/guide/guide_iotRegistor">IoT 등록하기</a> <a
									class="nav-link text-primary fw-700" href="/bigdata/guide/guide_sensorRegistor">센서 등록하기</a>
								<!-- Nested Sidenav Accordion (Pages -> Account)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAccount" aria-expanded="false"
									aria-controls="pagesCollapseAccount"> 센서 데이터 송신하기
									<div class="sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAccount"
									data-bs-parent="#accordionSidenavPagesMenu">
									<nav class="sidenav-menu-nested nav">
										<a class="nav-link" href="/bigdata/guide/guide_sensor1">온도</a> <a
											class="nav-link" href="/bigdata/guide/guide_sensor2">습도</a> <a
											class="nav-link" href="/bigdata/guide/guide_sensor3">조도</a> <a
											class="nav-link" href="/bigdata/guide/guide_sensor4">토양수분</a> <a
											class="nav-link" href="/bigdata/guide/guide_sensor5">강우</a>
									</nav>
								</div>

							</nav>
						</div>
						<!-- Sidenav Accordion (Applications)-->
						<a style="font-size: 0.8rem" class="nav-link"
							href="/bigdata/guide/guide_dashboard">
							<div class="nav-link-icon">
								<i data-feather="layout"></i>
							</div> 대시보드 구성하기
						</a>
					</div>
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
								<div class="col-auto mt-4">
									<h1 class="page-header-title fw-800">
										<div class="page-header-icon ">
											<i data-feather="book"></i>
										</div>
										센서 등록하기
									</h1>
									<div class="page-header-subtitle">클라우드 서비스 준비3</div>
								</div>
							</div>
						</div>
					</div>
				</header>
				<!-- Main page content-->
				<div class="container-xl px-4">
					<div class="card mt-n10">
						<div class="card-header">IoT 클라우드 서비스 이용하기</div>
						<br> <img width="40%" alt="" src="../assets/img/guide/14.png">
						<div class="card-body">
							IoT 등록을 완료하면 센서 등록이라는 버튼이 생성이 됩니다. <br> <br> <img
								class="list-inline-item" width="40%" alt=""
								src="../assets/img/guide/15.png"> <br>
							<br>센서 등록 버튼을 클릭하시면 위와 같은 화면이 됩니다. <br> <br>
							<img class="list-inline-item" width="40%" alt=""
								src="../assets/img/guide/16.png"> <br>
							<br>
							<div class="alert alert-primary mt-4" role="alert">
								아오팜에서 지원하는 센서의 종류는 <br>
								<div class="fw-600 list-inline-item">온도센서(아날로그), 습도센서,
									광(조도)센서, 토양수분센서, 강우센서</div>입니다. <br>센서 등록하기 클릭 후 등록하고자 하는 센서 클릭 후 확인을 누르시면 됩니다.<br>

							</div>


						</div>






			</main>
		</div>
	</div>
















	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/components/prism-core.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/plugins/autoloader/prism-autoloader.min.js"
		crossorigin="anonymous"></script>
</body>
</html>