<!DOCTYPE html>
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
<title>Account Settings - Profile - SB Admin Pro</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
		<script>
		window.onload = function() {
			var alertMessage = "${alertMessage}";
			if (alertMessage !== "") {
				alert(alertMessage);
			}
		};
	</script>
</head>
<body class="nav-fixed">
		<jsp:include page="header.jsp"></jsp:include>
	<div class="question justify-content-center align-items-center">
		<div class="question_item">
			<a class="question_a" href="/bigdata/faq"> <img
				src="./img/faq.png" class="faq_img"><br>
			</a>
			<h1 class="question_text">자주묻는질문</h1>
		</div>
		<div class="line" style="margin-top:1.2rem"></div>
		<div class="question_item">
			<% if(session.getAttribute("user")!=null){ %>
			<a class="question_a" href="/bigdata/qna"> <img
				src="./img/qna.png" class="qna_img">
			</a>
			<%}else{ %>
			<a class="question_a" href="/bigdata/login"> <img
				src="./img/qna.png" class="qna_img">
			</a>
			<%} %>
			<h1 class="question_text">문의하기</h1>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>