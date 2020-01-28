<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
						document.getElementById('post_code').value = data.zonecode;
						document.getElementById("address1").value = fullAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address2").focus();
					}
				}).open();
	}
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
						<form >
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<sec:authentication property="principal.username" var="user_id" />
							<input type="hidden" id="userid" name="userid" value="${user_id}" />

							<div class="row mb-10">
								<div class="col-md-10 ">
									<div class="p-4 border mb-3">
										<span class="d-block text-primary h6 text-uppercase">우승완</span>
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
									
									<input type="button" class="btn btn-primary btn-lg btn-block"
											value="추가">
									
								</div>

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