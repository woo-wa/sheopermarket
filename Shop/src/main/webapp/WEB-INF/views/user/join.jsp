<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#passwd_ck').blur(function(){
		if($('#passwd').val() != $('#passwd_ck').val()){
			if($('#passwd_ck').val() !=''){
				alert("비밀번호가 일치하지 않습니다.");
				$('#passwd_ck').val('');
				$('#passwd_ck').focus();
			}
		}
	})
});
</script>
</head>
<body>
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">회 원 가 입</h2>
          </div>
          <div class="col-md-7">

            <form action="${pageContext.request.contextPath}/user/insertUser.do"  method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
              <input type="hidden" name="authority" value="ROLE_USER"/>
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="userid" class="text-black">아이디<span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="userid" name="userid" placeholder="" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="name" class="text-black">이름 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="passwd" class="text-black">비밀번호 <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="passwd" name="passwd" placeholder="" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="passwd_ck" class="text-black">비밀번호 확인 <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="passwd_ck" name="passwd_ck" placeholder="" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="email" class="text-black">이메일 <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="" required>
                  </div>
                </div> 
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_subject" class="text-black">휴대폰<span class="text-danger">*</span> </label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="'-'를 제외한 번호를 입력해 주세요." required>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-lg-12">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="회원 가입">
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-5 ml-auto">
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h6 text-uppercase">전자 거래 약관</span>
              <p class="mb-0">203 Fake St. Mountain View, San Francisco, California, USA</p>
            </div>
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h6 text-uppercase">정보 수집 약관</span>
              <p class="mb-0">203 Fake St. Mountain View, San Francisco, California, USA</p>
            </div>
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h6 text-uppercase">구매 이용 약관</span>
              <p class="mb-0">203 Fake St. Mountain View, San Francisco, California, USA</p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
    
  </body>
</html>