<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>상품등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	
</style>
</head>
<body>
<div class="container">
<h3>상품등록</h3>
<hr/>
	<form action="${contextPath }/shop/prodReg.do" method="post" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품이름</label>
			<div class="col-sm-3">
				<input type="text" name="p_name" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품가격</label>
			<div class="col-sm-3">
				<input type="text" name="p_price" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품 카테고리</label>
			<div class="col-sm-3">
				<select class="form-control" name="p_category">
	  				<option>유니폼</option>
	  				<option>축구공</option>
	  				<option>축구화</option>
	  				<option>기타장비</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품정보</label>
			<div class="col-sm-5">
				<textarea name="p_content" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품사이즈</label>
			<div class="col-sm-3">
				<select class="form-control" name="p_option">
	  				<option>M</option>
	  				<option>L</option>
	  				<option>XL</option>
	  				<option>기타장비</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고</label>
			<div class="col-sm-3">
				<input type="text" name="p_stock" class="form-control"/>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2>" for="gdsImg">이미지</label>
			<div class="col-sm-5">
				<input type="file" id="gdsImg" name="p_filename" class="form-control" />
			</div>
		</div>
		
		<div class="form-group row">	
			<label class="col-sm-2">미리보기</label>
			<div class="col-sm-5">
				<div class="select_img"><img src="" /></div>
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(100);        
								}
						reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
			</div> 
		</div>
		
		<div class="form-group row">
			<div class="col-md-4">
				<input type="submit" class="btn btn-primary" value="등록"/>
			</div>
		</div>
	</form>
</div>
</body>
	
</html>