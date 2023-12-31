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
<title>Account Settings - Profile - SB Admin Pro</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="nav-fixed">

	<!-- 헤더부분 -->
	<jsp:include page="header.jsp"></jsp:include>
<%TestMember user=(TestMember)session.getAttribute("user");%>

	<!-- 네비게이션 삭제 style="margin-left: -15rem; margin-top:-3.5rem"-->
	<div id="layoutSidenav">
		<div id="layoutSidenav_content"
			style="margin-left: -15rem; margin-top: -3.5rem">
			<main>
				<!-- Main page content-->
				<div class="container-xl px-4 mt-4">
					<!-- Account page navigation-->
					<nav class="nav nav-borders">
						<a class="nav-link active" href="/bigdata/profile">프로필</a> <a
							class="nav-link" href="/bigdata/billing"> 청구 </a> <a
							class="nav-link" href="/bigdata/security"> 보안 </a>
							<%if (user.getPclass().equals("Free")) {%>
							<a class="nav-link" href="#!" tabindex="0" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Paid 버전부터 가능합니다!">알림</a>
							<%}else{ %>
							<a class="nav-link" href="/bigdata/notifications"> 알림 </a>
							<%} %>
							
					</nav>
					<hr class="mt-0 mb-4" />
					<div class="row">
						<!-- 왼쪽부분 -->
						<div class="col-xl-4">
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">Profile</div>
								<div class="card-body text-center">
									<div class="row my-3">
										<div class="col-xl-4 mt-3">Username</div>
										<div class="col-xl-8"><input class="form-control form-control-solid bg-gray-100 text-lg" value="${user.name}" disabled/></div>
									</div>
									<div class="row my-3">
										<div class="col-xl-4 mt-3">Version</div>
										<div class="col-xl-8"><input class="form-control form-control-solid bg-gray-100 text-lg" value="${user.pclass}" disabled/></div>
									</div>
									<div class="row my-3">
										<div class="col-xl-4 mt-3">E-mail</div>
										<div class="col-xl-8"><input class="form-control form-control-solid bg-gray-100 text-lg" value="${user.email}" disabled/></div>	
									</div>
								</div>
							</div>


							<!-- Profile picture card-->
							<div class="card mt-4 mb-xl-0">
								<div class="card-header">Profile Picture</div>
								<div class="card-body text-center">
									<!-- Profile picture image-->
									<div class="mb-lg-4"></div>
									<img id="profile-image" class="img-account-profile rounded-circle mb-2"
										src="assets/img/illustrations/profiles/${user.p_img}.png" alt="" />
									<div class="mb-lg-4"></div>
									<!-- Profile picture help block-->
									<button class="btn round-button" onclick="changeImg('profile-1')"
										style="height: 3.8rem; width: 3.8rem"> 
										<img src="assets/img/illustrations/profiles/profile-1.png"
											style="width: 3.8rem">
									</button>
									<button class="btn round-button" onclick="changeImg('profile-2')" 
										style="height: 3.8rem; width: 3.8rem">
										<img src="assets/img/illustrations/profiles/profile-2.png"
											style="width: 3.8rem">
									</button>
									<button class="btn round-button" onclick="changeImg('profile-3')"
										style="height: 3.8rem; width: 3.8rem">
										<img src="assets/img/illustrations/profiles/profile-3.png"
											style="width: 3.8rem">
									</button>
									<button class="btn round-button" onclick="changeImg('profile-4')"
										style="height: 3.8rem; width: 3.8rem">
										<img src="assets/img/illustrations/profiles/profile-4.png"
											style="width: 3.8rem">
									</button>
									<button class="btn round-button" onclick="changeImg('profile-5')"
										style="height: 3.8rem; width: 3.8rem">
										<img src="assets/img/illustrations/profiles/profile-5.png"
											style="width: 3.8rem">
									</button>
									<button class="btn round-button" onclick="changeImg('profile-6')"
										style="height: 3.8rem; width: 3.8rem">
										<img src="assets/img/illustrations/profiles/profile-6.png"
											style="width: 3.8rem">
									</button>
									<div class="mb-lg-4"></div>
									<!-- Profile picture upload button-->
									<button class="btn btn-primary" style="font-size: 1rem" type="button" onclick="sendImage()">Change
										profile image</button>
								</div>
							</div>
						</div>

						<!-- 오른쪽부분 -->
						<div class="col-xl-8">
							<div class="card mb-4 mb-xl-0">
								<div class="card-header">Usage Status</div>
								<div class="card-body row">
									<div class="col-xl-4 pt-lg-2 ps-lg-5">
										<div class="text-gray-500 text-lg">현재 이용 버전</div>
										<div class="text-xl fw-700" style="margin-top: -0.7rem">${user.pclass}</div>
									</div>
									<div class="col-xl-8  pt-lg-2 text-lg">
										<div >Total number of IoT (최대 ${max.maxIot}개)</div>
										<div style="display:flex;margin-top: -0.7rem"><div class="mx-xl-1 fw-600" style="font-size: 2rem;margin-top:0.15rem">${max.myIot }</div><div style="padding-top: 0.75rem">개 이용 중</div></div>
										<div class="mt-2">Total number of sensors (최대 ${max.maxSensor }개)</div>
										<div class="pb-lg-4" style="display:flex;margin-top: -0.7rem"><div class="mx-xl-1 fw-600" style="font-size: 2rem;margin-top:0.15rem">${max.mySensor }</div><div style="padding-top: 0.75rem">개 이용 중</div></div>
										<div class="text-center"><a class="btn btn-block btn-outline-blue" href="/bigdata/pricing" style="font-size: 1rem"><div class="mt-1">더 많은 장치 이용하기</div><i data-feather="arrow-right"></i></a></div>
									</div>
								</div>
							</div>

							<!-- Account details card-->
							<div class="card mb-4 mt-4">
								<div class="card-header">Change Username</div>
								<div class="card-body">
									<form action="updateName" method="post">
										<!-- Form Group (username)-->
										<div class="mb-3">
											<label class="mb-1" for="inputUsername">Username (
												사이트에서 표시되는 방식 )</label> <input class="form-control"
												id="inputUsername" type="text"
												placeholder="Enter your username" value="${user.name }" style="font-size: 1rem" name="name"/>
										</div>

										<!-- Save changes button-->
										<button class="btn btn-primary" style="font-size: 1rem" type="submit">Save
											change
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script>
	var profileImage = document.getElementById('profile-image');
    var initialImageSrc = "assets/img/illustrations/profiles/${user.p_img}.png";
    var image="${user.p_img}";
    profileImage.src = initialImageSrc;

    // 이미지 변경 함수
    function changeImg(newSrc) {
        profileImage.src = "assets/img/illustrations/profiles/"+newSrc+".png";
        image=newSrc;
    }
    
    var changeImages = document.querySelectorAll('.changeImages');
    function sendImage() {
        $.ajax({
            url : "updateImg",
            type : "get",
            data : {'img' : image },
            success : function(result){
                if(result=="success"){
                	alert('프로필이 업데이트되었습니다.');
                	changeImages.forEach(function(element) {
                		  element.src = "assets/img/illustrations/profiles/" + image + ".png";
                		});
                } else {
                	alert('프로필 업데이트가 실패했습니다.');
                }
            },
            error : function(){
                alert('error!');
            }
        });
    }
    
    window.onload = function() {
        var alertMessage = "${alertMessage}";
        if (alertMessage !== "") {
            alert(alertMessage);
        }
    }
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>