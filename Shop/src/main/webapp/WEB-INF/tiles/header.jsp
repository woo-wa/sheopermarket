<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/include/style.css"/> -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<meta charset="UTF-8">
<script>
function Logout(){
	document.getElementById("logout").submit();
}
</script>
<title>SHOEPER</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/user/logout"
		method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<header class="site-navbar" role="banner">
		<div class="site-navbar-top">
			<div class="container">
				<div class="row align-items-center">

					<div
						class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
						<form action="" class="site-block-top-search">
							<span class="icon icon-search2"></span> <input type="text"
								class="form-control border-0" placeholder="Search">
						</form>
					</div>

					<div
						class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
						<div class="site-logo">
							<a href="${pageContext.request.contextPath}"
								class="js-logo-clone">SHOEPER</a>
						</div>
					</div>

					<div class="col-6 col-md-4 order-3 order-md-3 text-right">
						<div class="site-top-icons">
							<ul>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="${pageContext.request.contextPath}/admin/main.do">관리자 페이지</a>
								</sec:authorize>
								<li><sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.username"
											var="user_id" />
										<div id="user_id">${user_id}</div>
									</sec:authorize></li>
								<sec:authorize access="isAuthenticated()">
										<li><a href="${pageContext.request.contextPath}/user/mypage.do">마이페이지</a></li>
									</sec:authorize>
								<li><sec:authorize access="isAnonymous()">
										<a href="${pageContext.request.contextPath}/user/login.do"><span
											class="icon icon-person"></span></a>
									</sec:authorize> 
									<sec:authorize access="isAuthenticated()">
										<form id="logout" action="${pageContext.request.contextPath}/user/logout"method="post">
											<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
											<a href=# class="button" onclick="Logout();">로그아웃</a>
										</form>
									</sec:authorize>
									</li>
								<li><a href="#"><span class="icon icon-heart-o"></span></a></li>
								<li><a href="cart.html" class="site-cart"> <span
										class="icon icon-shopping_cart"></span> <span class="count">2</span>
								</a></li>
								<li class="d-inline-block d-md-none ml-md-0"><a href="#"
									class="site-menu-toggle js-menu-toggle"><span
										class="icon-menu"></span></a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		<nav class="site-navigation text-right text-md-center"
			role="navigation">
			<div class="container">
				<ul class="site-menu js-clone-nav d-none d-md-block">
					<li class="has-children active"><a href="index.html">Home</a>
						<ul class="dropdown">
							<li><a href="#">Menu One</a></li>
							<li><a href="#">Menu Two</a></li>
							<li><a href="#">Menu Three</a></li>
							<li class="has-children"><a href="#">Sub Menu</a>
								<ul class="dropdown">
									<li><a href="#">Menu One</a></li>
									<li><a href="#">Menu Two</a></li>
									<li><a href="#">Menu Three</a></li>
								</ul></li>
						</ul></li>
					<li class="has-children"><a href="about.html">About</a>
						<ul class="dropdown">
							<li><a href="#">Menu One</a></li>
							<li><a href="#">Menu Two</a></li>
							<li><a href="#">Menu Three</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath}/product/list.do">Shop</a></li>
					<li><a href="#">Catalogue</a></li>
					<li><a href="#">New Arrivals</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>