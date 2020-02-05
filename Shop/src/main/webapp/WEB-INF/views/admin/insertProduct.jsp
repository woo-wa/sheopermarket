<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>  -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.js"></script>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<sec:csrfMetaTags />
<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>

<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>
	var csrfParameter = $('meta[name="_csrf_parameter"]').attr('content')
	var csrfHeader = $('meta[name="_csrf_header"]').attr('content')
	var csrfToken = $('meta[name="_csrf"]').attr('content')

	$(function() {

		$.ajaxSetup({
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			}
		})

		$("#description").summernote({
			height : 300,
			width : 800,
			lang : "ko-KR",

			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					console.log(files[0]);
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i]);
					}
				}
			}

		});
	});
	function sendFile(file) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '${pageContext.request.contextPath}/admin/imageUpload.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$("#description").summernote('editor.insertImage', "${pageContext.request.contextPath}/resources/images/description/"+url);
			}
		});
	}
</script>

</head>
<body>

	<h2>상품 등록</h2>
	<form name="form1" id="form1" method="post"
		action="${pageContext.request.contextPath}/admin/insertProduct.do"
		enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

		<table>
			<tr>
				<td>상품명</td>
				<td><input name="product_name" value="에어모나크"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input name="category" value="001"></td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input name="brand" value="001"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" value="89000"></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea rows="5" cols="60" name="description"
						id="description" placeholder="상품설명을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td>상품 이미지</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록">
			</tr>
		</table>
	</form>

</body>
</html>