<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<head>
<meta charset="UTF-8">
<%@ include file = "modal.jsp" %>
</head>
<sec:csrfMetaTags />
<script> 
    var csrfParameter = $('meta[name="_csrf_parameter"]').attr('content')
    var csrfHeader = $('meta[name="_csrf_header"]').attr('content')
    var csrfToken = $('meta[name="_csrf"]').attr('content')  

    $(function(){
        $('#login-form').submit(function(event){
            event.preventDefault();
            var params = "userid=" + $('#userid').val() + "&passwd=" + $('#passwd').val()

            $.ajaxSetup({
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                }  
            })

            $.ajax({
                url : "${pageContext.request.contextPath}/user/login_check.do",
                type : "post",
                dataType : "json",
                data : params,
                success : function(response) {
                    console.log(response);
                    location.href='${pageContext.request.contextPath}/'; 
                }, error : function(jqXHR, status, e) {
                    console.error(status + " : " + e);
                    alert("로그인 정보가 일치하지 않습니다.");
                    $('#passwd').val("");
                }

            });	 
        });
    });

</script>
<body>
	<div class="site-wrap">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Login</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Login</h2>
					</div>
					
					<div class="col-md-7">
						<form id="login-form"
							action="${pageContext.request.contextPath}/user/login_check.do"
							method="post">
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-12">
										<!-- <label for="c_email" class="text-black">아이디</label> -->
										<input type="text" class="form-control" id="userid"
											name="userid" placeholder="아이디" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<!-- <label for="c_email" class="text-black">비밀번호</label> -->
										<input type="password" class="form-control" id="passwd"
											name="passwd" placeholder="비밀번호" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block"
											value="Login">
									</div>
								</div>
								<div class="form-group row" style="margin-bottom: 0px;">
									<div class="col-md-12">

										<div style="text-align: right;">
											<a href="${path}/shop/user/joinUser.do" style="padding: 10px;">회원가입</a> 
												<a data-toggle="modal" href="#myModal"	style="padding: 10px;">아이디 찾기</a>
												 <a data-toggle="modal" href="#search_pw" style="padding: 10px;">비밀번호 찾기</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="col-md-5 ml-auto">
						<div class="p-4 border mb-3">
							<span class="d-block text-primary h6 text-uppercase"></span>
							<p class="mb-0">203 Fake St. Mountain View, San Francisco,
								California, USA</p>
						</div>
						<div class="p-4 border mb-3">
							<span class="d-block text-primary h6 text-uppercase">구글
								로그인</span>
							<p class="mb-0">203 Fake St. Mountain View, San Francisco,
								California, USA</p>
						</div>
						<div class="p-4 border mb-3">
							<span class="d-block text-primary h6 text-uppercase">페이스북
								로그인</span>
							<p class="mb-0">203 Fake St. Mountain View, San Francisco,
								California, USA</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>