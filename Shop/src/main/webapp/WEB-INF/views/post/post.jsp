<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

.findAddr{
	cursor:pointer;
	margin:10px 0 0 10px;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	border-color:#7971ea;
	background-color:#7971ea;
	color:#fff;
	background-clip:padding-box;
	font-size:17px;
	font-weight:300;
}
.modifyAddr{
	cursor:pointer;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	border-color:#7971ea;
	background-color:#fff;
	color:#7971ea;
	background-clip:padding-box;
	font-size:15px;
	font-weight:300;
}

.addrClose{
	float: right;
    background-color: white;
    border: 0px;
    margin: 1px 5px;
    color: #7971ea;
    font-size: 20px;
    cursor: pointer;
}
.tasks-list-item {
  display: block;
  line-height: 24px;
  padding: 12px 15px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.tasks-list-item + .tasks-list-item {
  border-top: 1px solid #f0f2f3;
}

.tasks-list-cb {
  display: none;
}

.tasks-list-mark {
  position: relative;
  display: inline-block;
  vertical-align: top;
  margin-right: 12px;
  width: 20px;
  height: 20px;
  border: 2px solid #c4cbd2;
  border-radius: 12px;
}

.tasks-list-mark:before {
  content: '';
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -5px 0 0 -6px;
  height: 8px;
  width: 16px;
  border: solid #7971ea;
  border-width: 0 0 4px 4px;
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

.tasks-list-cb:checked ~ .tasks-list-mark {
  border-color: #7971ea;
}

.tasks-list-cb:checked ~ .tasks-list-mark:before {
  display: block;
}

.tasks-list-desc {
  font-weight: bold;
  color: #8a9a9b;
}

.tasks-list-cb:checked ~ .tasks-list-desc {
  color: #7971ea;
  
}
</style>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<sec:csrfMetaTags />
<script>
	function showPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로,
						// 이를 참고하여 분기한다.

						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType == 'R') {
							fullAddr = data.roadAddress;
						} else {
							fulladdr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.

						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							fullAddr += (extraAddr !== '' ? '(' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('code').value = data.zonecode;
						document.getElementById("addr1").value = fullAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("addr2").focus();
					}
				}).open();
	}

    var csrfParameter = $('meta[name="_csrf_parameter"]').attr('content')
    var csrfHeader = $('meta[name="_csrf_header"]').attr('content')
    var csrfToken = $('meta[name="_csrf"]').attr('content')  
	var addr = new Array();
    var urls;
    $(function(){
    	
    	$.ajaxSetup({
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeader, csrfToken);
            }  
        })
        
    	AddrList();
    	
    	$('#updateAddress_form').submit(function(event){
    		event.preventDefault();
    		var params = $('#updateAddress_form').serialize();
    		urls = "${pageContext.request.contextPath}/post/updateAddress.do";
    		ajaxAddress(urls, params);
    	});
    	
        $('#insertAddress_form').submit(function(event){
            event.preventDefault();
            var params = $('#insertAddress_form').serialize()
			urls = "${pageContext.request.contextPath}/post/insertAddress.do"
			ajaxAddress(urls, params);
        });
    });
    
	function AddrList(){
		$.ajax({
            url : "${pageContext.request.contextPath}/post/listAddress.do",
            type : "get",
            dataType : "json",
            success : function(res) {
                console.log(res);
                addr = res;
                var htmls="";
                for(i=0; i<res.length; i++){
                	htmls += '<input type="button" value="x" class="addrClose" onclick="deleteAddress('+res[i].addno+')"/>';
                	htmls += '<div class="p-4 border mb-3">';
                	htmls += '<span class="d-block text-primary h6 text-uppercase">' + res[i].recipient + '</span>';
                	htmls += '<p class="mb-0">' + res[i].addr1 
                	if(res[i].addr2 == null){
                		htmls += '</p>'	
                	}else{
                		htmls += res[i].addr2 + '</p>';
                	}                	
                	htmls += '<p class="mb-0">' + res[i].phone + '</p>';
                	if(res[i].memo != null){
                		htmls += '<p class="mb-0">' + res[i].memo + '</p>';
                	}
                	if(res[i].def==1){
                		htmls += '<p class="mb-0">기본 배송지</p>';
                	}
                	htmls += '<input type="button" class="modifyAddr" onclick="modifyAddr('+i+')" value="수정"/>';
                	htmls += '</div>';

                }
                htmls += '<input type="button" class="btn btn-primary btn-lg btn-block"' 
                htmls += 'data-toggle="modal" data-target="#add_address" value="+ 배송지 추가">'
                $("#addrList").html(htmls);
            }, error : function(jqXHR, status, e) {
                console.error(status + " : " + e);
            }

        });	
	}
	
	function modifyAddr(i){
		console.log(addr[i].def);
		document.getElementById('update_addno').value = addr[i].addno;
		document.getElementById('update_recipient').value = addr[i].recipient;
    	document.getElementById('update_code').value = addr[i].code;
    	document.getElementById('update_addr1').value = addr[i].addr1;
    	document.getElementById('update_phone').value = addr[i].phone;
		if(addr[i].def == '1'){
			$("input:checkbox[id='update_def']").attr("checked", true);
		}else{
			$("input:checkbox[id='update_def']").attr("checked", false);
		}
    	$('#update_address').modal('show')
	}
	
	function ajaxAddress(urls, params){
		
		$.ajax({
            url : urls,
            type : "post",
            dataType : "text",
            data : params,
            success : function(response) {
                console.log(response);
                AddrList();
				$('#add_address').modal('hide');
				$('#update_address').modal('hide');
            }, error : function(jqXHR, status, e) {
                console.error(status + " : " + e);
            }

        });	
	}
	
	function deleteAddress(i){
		if(confirm("삭제 하시겠습니까?")==true){
			urls = "${pageContext.request.contextPath}/post/deleteAddress.do";
			params = "addno="+i; 
			ajaxAddress(urls, params)
		}
		
		
	}
</script>
</head>
<body>
<div class="modal modal-center fade" id="add_address" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
       		<div class="modal-header">
       			<h2>배송지 추가</h2>
         			<button type="button" class="close" data-dismiss="modal">×</button>
       		</div>
       		<div class="modal-body">
       			<form id="insertAddress_form">
       				<sec:authentication property="principal.username" var="userid" />
					<input type="hidden" id="userid" name="userid" value="${userid }" >
					<input type="hidden" id="addno"	name="addno"/> 
       				<div class="row mb-5">
					<input type="text" class="form-control" id="recipient" name="recipient" style="margin: 10px;"
					placeholder="받는 사람" required>
					<input type="text" class="form-control" id="code" name="code" 
					style="margin: 10px 0 0 10px; width:110px;" placeholder="우편번호" required>
					<input type="button" class="findAddr"value="우편번호 찾기" onclick="showPostcode()">
					<input type="text" class="form-control" id="addr1" name="addr1" style="margin: 10px; margin-bottom:5px;"
					placeholder="주소" required>
					<input type="text" class="form-control" id="addr2" name="addr2" style="margin: 10px; margin-top:5px;"
					placeholder="상세 주소">
					<input type="text" class="form-control" id="phone" name="phone" style="margin: 10px;"
					placeholder="휴대폰 번호" maxlength="11" required>
					<input type="text" class="form-control" id="memo" name="memo" style="margin: 10px;"
					placeholder="배송 요청 사항" >
					<label class="tasks-list-item">
						<input type="checkbox" id="def" name="def" value="1" class="tasks-list-cb">
						<span class="tasks-list-mark"></span>
						<span class="tasks-list-desc">기본 배송지로 설정</span>
						</label>
						<input	type="submit" style="margin: 10px;"
						class="btn btn-primary btn-lg btn-block" value="추가">
			  		</div>
			  	</form>
			</div>
		</div>
	</div>
</div>

<div class="modal modal-center fade" id="update_address" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
       		<div class="modal-header">
       			<h2>배송지 정보 변경</h2>
         			<button type="button" class="close" data-dismiss="modal">×</button>
       		</div>
       		<div class="modal-body">
       			<form id="updateAddress_form">
       				<sec:authentication property="principal.username" var="userid" />
					<input type="hidden" id="update_userid" name="userid" value="${userid }" >
					<input type="hidden" id="update_addno"	name="addno"/> 
       				<div class="row mb-5">
					<input type="text" class="form-control" id="update_recipient" name="recipient" style="margin: 10px;"
					placeholder="받는 사람" required>
					<input type="text" class="form-control" id="update_code" name="code" 
					style="margin: 10px 0 0 10px; width:110px;" placeholder="우편번호" required>
					<input type="button" class="findAddr"value="우편번호 찾기" onclick="showPostcode()">
					<input type="text" class="form-control" id="update_addr1" name="addr1" style="margin: 10px; margin-bottom:5px;"
					placeholder="주소" required>
					<input type="text" class="form-control" id="update_addr2" name="addr2" style="margin: 10px; margin-top:5px;"
					placeholder="상세 주소">
					<input type="text" class="form-control" id="update_phone" name="phone" style="margin: 10px;"
					placeholder="휴대폰 번호" maxlength="11" required>
					<input type="text" class="form-control" id="update_memo" name="memo" style="margin: 10px;"
					placeholder="배송 요청 사항" >
					<label class="tasks-list-item">
						<input type="checkbox" id="update_def" name="def" value="1" class="tasks-list-cb">
						<span class="tasks-list-mark"></span>
						<span class="tasks-list-desc">기본 배송지로 설정</span>
						</label>
						<input	type="submit" style="margin: 10px;"
						class="btn btn-primary btn-lg btn-block" value="저장">
			  		</div>
			  	</form>
			</div>
		</div>
	</div>
</div>
	
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
					
						<div class="row mb-10">
							<div id="addrList" class="col-md-10 ">
									
							</div>
						</div>
					</div>
					<!-- ---------------------------------------------------------------- -->
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