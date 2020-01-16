<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
$(function(){
	
	$.ajaxSetup({
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }  
    })
    //아이디 찾기
    $('#search_id_form').submit(function(event){
        event.preventDefault();
        var params = "email=" + $('#email').val()

        $.ajax({
            url : "${pageContext.request.contextPath}/user/searchId.do",
            type : "post",
            dataType : "HTML",
            data : params,
            success : function(response) {
                alert("아이디 : "+response)
                $('#search_id .modal-body').html("<h2>"+response+"<h2>")
                $('#myModal').modal('hide')
                $('#search_id').modal('show')
            }, error : function(jqXHR, status, e) {
                alert("에러"+response)
            }

        });	 
    });
	//비밀번호 찾기
	$('#search_pw_form').submit(function(event){
        event.preventDefault();
        var params ="userid="+$('#p_userid').val() + "&email=" + $('#p_email').val()

        $.ajax({
            url : "${pageContext.request.contextPath}/user/searchPw.do",
            type : "post",
            dataType : "HTML",
            data : params,
            success : function(response) {
                alert("아이디 : "+response)
                $('#search_id .modal-body').html("<h2>"+response+"<h2>")
                $('#myModal').modal('hide')
                $('#search_id').modal('show')
            }, error : function(jqXHR, status, e) {
                alert("에러"+response)
            }

        });	 
    });
});
</script>
</head>
<body>
<!-- Id 찾기 창 -->
	<div class="modal modal-center fade" id="myModal" role="dialog">
		<div class="modal-dialog">
    
			<div class="modal-content">
        		<div class="modal-header">
        			<h2>아이디 찾기</h2>
          			<button type="button" class="close" data-dismiss="modal">×</button>
        		</div>
        		<div class="modal-body">
        			<form id="search_id_form" action="${pageContext.request.contextPath}/user/searchId.do" method="post">
          				<div class="row mb-5">
          					<input type="email" class="form-control" id="email" name="email" style="margin: 10px;"
          					placeholder="이메일 주소를 입력해주세요." required>
							<input	type="submit" style="margin: 10px;"
							class="btn btn-primary btn-lg btn-block" value="찾기">
				  		</div>
				  	</form>
        		</div>
      		</div>
    	</div>
	</div>

	<!-- Id찾기 결과 -->
	<div class="modal modal-center fade" id="search_id" role="dialog">
		<div class="modal-dialog">
    
			<div class="modal-content">
        		<div class="modal-header">
        			<h2>아이디 찾기</h2>
          			<button type="button" class="close" data-dismiss="modal">×</button>
        		</div>
        		<div class="modal-body">
        		</div>
      		</div>
    	</div>
	</div>
	
	<!-- PW 찾기 창 -->
	<div class="modal modal-center fade" id="search_pw" role="dialog">
		<div class="modal-dialog">
    
			<div class="modal-content">
        		<div class="modal-header">
        			<h2>비밀번호 찾기</h2>
          			<button type="button" class="close" data-dismiss="modal">×</button>
        		</div>
        		<div class="modal-body">
        			<form id="search_pw_form" action="${pageContext.request.contextPath}/user/searchPw.do" method="post">
          				<div class="row mb-5">
          					<input type="text" class="form-control" id="p_userid" name="userid" style="margin: 10px;"
          					placeholder="아이디를 입력해주세요." required>
          					<input type="email" class="form-control" id="p_email" name="email" style="margin: 10px;"
          					placeholder="이메일 주소를 입력해주세요." required>
							<input	type="submit" style="margin: 10px;"
							class="btn btn-primary btn-lg btn-block" value="찾기">
				  		</div>
				  	</form>
        		</div>
      		</div>
    	</div>
	</div>

</body>
</html>