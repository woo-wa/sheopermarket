<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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
						<form
							style="width:80%;"
							action="${pageContext.request.contextPath}/user/insertUser.do"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"> <input type="hidden"
								name="authority" value="ROLE_USER" />
							<div class="p-3 p-lg-5 border">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="userid" class="text-black">아이디<span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="userid" name="userid" placeholder=""
											required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="name" class="text-black">이름 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="name" name="name" placeholder=""
											required>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-md-12">
										<label for="email" class="text-black">이메일 <span
											class="text-danger">*</span></label> <input type="email"
											class="form-control" id="email" name="email" placeholder=""
											required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_subject" class="text-black">휴대폰<span
											class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="phone"
											name="phone" placeholder="'-'를 제외한 번호를 입력해 주세요." required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-primary btn-lg btn-block"
											value="저장">
									</div>
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