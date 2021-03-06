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
<title>상품페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/jumbotron/">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>

#asd3{
	text-align:center;
	}
	
	p.cartStock button { font-size:26px; border:none; background:none; }
</style>


</head>
<body>
	<div class="container py-4">
		<h3 id="asd">상품페이지</h3>
		<hr/>
		<input type="hidden" class="u_id" value="${member.u_id }"/>
		<input type="hidden" class="p_no" value="${prodInfo.p_no }"/>
		<input type="hidden" class="p_price" value="${prodInfo.p_price }"/>
		<div class="row align-items-md-stretch">
			<div class="col-md-6">
				<div class="h-100 p-5 bg-light border rounded-3">
					<img src="${contextPath }/${prodInfo.pr_filename}" 
						style="max-width: 100%; height: auto;">
				</div>
			</div>
			<div class="col-md-6">
				<div class="h-100 p-5 bg-light border rounded-3">
					<p id="p_name">${prodInfo.p_name }</p>
					<div>
						<p>가격 : &#8361; <fmt:formatNumber value="${prodInfo.p_price }" pattern="###,###,###"/>원</p> <!-- 원화 표시 -->		
					</div>
					<div id="set_option">
						<p>사이즈 : ${prodInfo.p_option }</p>	
						<p>재고 : ${prodInfo.p_stock }</p>
						<p class="cartStock">
							 <span>구입 수량</span>
							 <button type="button" class="plus">+</button>
							 <input type="number" class="numBox" min="1" max="${prodInfo.p_stock}" value="1" readonly="readonly"/>
							 <button type="button" class="minus">-</button>
								 
								 <script>
								  $(".plus").click(function(){
								   var num = $(".numBox").val();
								   var plusNum = Number(num) + 1;
								   
								   if(plusNum >= ${prodInfo.p_stock}) {
								    $(".numBox").val(num);
								   } else {
								    $(".numBox").val(plusNum);          
								   }
								  });
								  
								  $(".minus").click(function(){
								   var num = $(".numBox").val();
								   var minusNum = Number(num) - 1;
								   
								   if(minusNum <= 0) {
								    $(".numBox").val(num);
								   } else {
								    $(".numBox").val(minusNum);          
								   }
								  });
								 </script>
								 
								</p>
						</div>
						<div>
							<p>총 구매금액 : ${prodInfo.p_price }
						</div>
						<div>
						<p class="insertCart">
							<button type="button" id="insertCart_btn" class="btn btn-primary">장바구니</button>
							
							<script>
							  $("#insertCart_btn").click(function(){
							   var p_no = $(".p_no").val();
							   var c_count = $(".numBox").val();
							   var u_id = $(".u_id").val();
							      
							   var data = {
							     p_no : p_no,
							     c_count : c_count,
							     u_id : u_id
							     };
							   
							   $.ajax({
							    url : "http://localhost:8080/soc00/shop/insertCart.do",
							    type : "post",
							    data : data,
							    success : function(result){
							    	alert("카트 담기 성공");
								     $(".numBox").val("1");
							    	var moveCartList = confirm("장바구니로 이동하시겠습니까?");
							    	if (moveCartList == true){
							    		location.href="${contextPath}/shop/cartList.do?u_id=${member.u_id}"
							    	}
							    	else{
							    		return false;
							    	}
							    },
							    error : function(){
							     alert("카트 담기 실패");
							    }
							   });
							  });
							 </script>
							
						</p>	
							<button class="btn btn-primary"
								 onclick="location.href='${contextPath }/shop/prodBuy.do?p_no=${prodInfo.p_no}'">바로구매</button>
						</div>
					</div>
				</div>
				<div class="p-3 mb-4 bg-white rounded-3">
					<div class="container-fluid py-1">
						<h3 class="display-5 fw-bold">상품소개</h3><p></p>
						<h6>${prodInfo.p_content }</h6>
					</div>
				</div>

	
			</div>
		
	</div>
</body>
</html>
