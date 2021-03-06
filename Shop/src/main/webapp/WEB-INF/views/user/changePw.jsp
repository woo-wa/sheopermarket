<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:csrfMetaTags />
<script>
var csrfParameter = $('meta[name="_csrf_parameter"]').attr('content')
var csrfHeader = $('meta[name="_csrf_header"]').attr('content')
var csrfToken = $('meta[name="_csrf"]').attr('content')  


$(function(){
	$.ajaxSetup({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		}  
	})
	$('#change_pw_form').submit(function(event){
	    event.preventDefault();
	   
		if($('#newpasswd').val() == $('#newpasswd_ck').val()){
			ajax()		
	    }else{
	    	alert("비밀번호가 일치하지 않습니다.");
	    }
	});
	
	function ajax(){
		var params = "oldpasswd=" + $('#oldpasswd').val() + "&newpasswd=" + $('#newpasswd').val()

    	$.ajax({
	        url : "${pageContext.request.contextPath}/user/changePw.do",
	        type : "post",
	        dataType : "HTML",
	        data : params,
	        success : function(res) {
	        	if(res == 'same'){
	        		alert("비밀번호가 기존과 동일합니다.")
	        	}else if(res == 'wrong'){
	        		alert("기존 비밀번호가 틀립니다. 다시 입력해 주세요.")
	        	}else if(res == 'suc'){
	        		alert("비밀번호 변경에 성공하였습니다.")
	        		location.href='${pageContext.request.contextPath}/user/mypage.do'
	        	}
	        }, error : function(jqXHR, status, e) {
	            alert("에러 : "+e + "status:" + status)
	        }
	        
	    });	
	}
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
						<form id="change_pw_form">
							<sec:authentication property="principal.username" var="user_id" />
							<input type="hidden" id="userid" name="userid" value="${user_id}"/>
							<div class="row">
								<div class="col-md-12 mb-5" style="margin-bottom: 0 !important">
									<div class="float-md-left mb-4">
										<h2 class="text-black h5">비밀번호 변경</h2>
									</div>
								</div>
							</div>

							<div class="row mb-5">
								<input  type="password" class="form-control"
									id="oldpasswd" name="passwd" placeholder="기존 비밀번호"> 
								<input  type="password" class="form-control"
									id="newpasswd" name="passwd" placeholder="신규 비밀번호"> 
								<input  type="password" class="form-control"
									id="newpasswd_ck" name="passwd" placeholder="비밀번호 확인">
								<input	type="submit" 
									class="btn btn-primary btn-lg btn-block" value="비밀번호 변경">
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