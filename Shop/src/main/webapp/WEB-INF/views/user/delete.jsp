<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<meta charset="UTF-8">
<script>
$(function(){
	$('#delete_user_form').submit(function(event){
	    event.preventDefault();
	    if(confirm("탈퇴 하시겠습니까?")){
	    	document.getElementById("delete_user_form").submit();
	    }
	});
});
</script>
</head>
<body>
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Shop</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-9 order-2">
						<form id="delete_user_form" method="post" 
								action="${pageContext.request.contextPath}/user/deleteUser.do">
							<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}"/>
							<sec:authentication property="principal.username" var="user_id" />
							<input type="hidden" id="userid" name="userid" value="${user_id}"/>
							<div class="row">
								<div class="col-md-12 mb-5" style="margin-bottom: 0 !important">
									<div class="float-md-left mb-4">
										<h2 class="text-black h5">회원 탈퇴</h2>
									</div>
								</div>
							</div>

							<div class="row mb-5">
								<input style="width: 35%;" type="password" class="form-control"
									id="passwd" name="passwd" placeholder="비밀번호 확인"> 
								<input	type="submit" style="width: 10%; margin-left: 10px;"
									class="btn btn-primary btn-lg btn-block" value="확인">
							</div>
						</form>
					</div>

					<div class="col-md-3 order-1 mb-5 mb-md-0">

						<div class="border p-4 rounded mb-4">
							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">쇼핑 내역</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">주문/배송조회</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">반품/교환/AS</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">찜목록 </span>
								</a>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">쇼핑수첩</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">상품 후기</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">상담 내역</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">찜목록 </span>
								</a>
							</div>

							<div class="mb-4">
								<h3 class="mb-3 h6 text-uppercase text-black d-block">회원정보</h3>
								<a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">개인정보 수정</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">배송지 관리</span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">비밀번호 변경 </span>
								</a> <a href="#" class="d-flex color-item align-items-center"> <span
									class="bg-primary color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">회원탈퇴</span>
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>