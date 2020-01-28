<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/table.css">
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

						<div class="row">
							<div class="col-md-12 mb-5" style=margin-bottom:0!important;>
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">주문/배송 조회</h2>
								</div>
							</div>
						</div>

						<div class="row mb-5">

							<table class="table-fill">
								<thead>
									<tr>
										<th class="text-left">주문 번호</th>
										<th class="text-left">총결제금액</th>
										<th class="text-left">상품정보</th>
										<th class="text-left">배송현황</th>

									</tr>
								</thead>
								<tbody class="table-hover">
									<tr>
										<td class="text-left">0001</td>
										<td class="text-left">$ 50,000.00</td>
										<td class="text-left">나이키 무슨무슨 신발</td>
										<td class="text-left">결제완료</td>
									</tr>
									<tr>
										<td class="text-left">0001</td>
										<td class="text-left">$ 50,000.00</td>
										<td class="text-left">나이키 무슨무슨 신발</td>
										<td class="text-left">결제완료</td>
									</tr>
									<tr>
										<td class="text-left">0001</td>
										<td class="text-left">$ 50,000.00</td>
										<td class="text-left">나이키 무슨무슨 신발</td>
										<td class="text-left">결제완료</td>
									</tr>
									<tr>
										<td class="text-left">0001</td>
										<td class="text-left">$ 50,000.00</td>
										<td class="text-left">나이키 무슨무슨 신발</td>
										<td class="text-left">결제완료</td>
									</tr>
									<tr>
										<td class="text-left">0001</td>
										<td class="text-left">$ 50,000.00</td>
										<td class="text-left">나이키 무슨무슨 신발</td>
										<td class="text-left">결제완료</td>
									</tr>
								</tbody>
							</table>

						</div>
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
								<a href="${path}/shop/user/modify.do"
								class="d-flex color-item align-items-center"> <span
									class="bg-danger color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">개인정보 수정</span>
								</a> <a href="${path}/shop/post/post.do" class="d-flex color-item align-items-center"> <span
									class="bg-success color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">배송지 관리</span>
								</a> <a href="${path}/shop/user/changePw.do" class="d-flex color-item align-items-center"> <span
									class="bg-info color d-inline-block rounded-circle mr-2"></span>
									<span class="text-black">비밀번호 변경 </span>
								</a> <a href="${path}/shop/user/deleteUser.do" class="d-flex color-item align-items-center"> 
								<span class="bg-primary color d-inline-block rounded-circle mr-2"></span>
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