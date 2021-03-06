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
<title>쇼핑몰</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
	.pagination{
			justify-content: center;
		}
	h3{
		text-align:center;
	}
	#search2{
			margin:auto;
			text-align:center;
		}
</style>
</head>

<body>
    
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
</svg>


<div class="container py-3">

  <main>
  <h3>축구몰</h3>
  
  <hr/>

	<br>
	
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
     <c:forEach var="shopList" items="${shopList }">
      <div class="col"> 
        <div class="card mb-4 rounded-3 shadow-sm">
        
          <div class="card-body">
            <h3 class="card-title pricing-card-title">${shopList.p_name }<small class="text-muted fw-light"></small></h3>
            
            <img src="${contextPath }/${shopList.pr_filename }" style="max-width: 150px; height: auto;">
            
            <ul class="list-unstyled mt-3 mb-4">
              <li>${shopList.p_name }</li>
              <li>${shopList.p_option }</li>
              <li>${shopList.p_price }</li>
            </ul>
    
            <a role="button" class="w-100 btn btn-lg btn-primary" 
            	onclick="location.href='${contextPath}/shop/prodInfo.do?p_no=${shopList.p_no }'">구매하기</a>
          </div>
         
        </div>
    </div>
     </c:forEach>
    </div>
   
    <br>
    <div class="row" >
		<div class="col-md-6" id="search2">
  			  <div class="input-group">
  			  
  			    <input type="text" class="form-control" placeholder="내용을 입력하세요">
    			  <span class="input-group-btn">
       				 <button class="btn btn-default" type="button">검색</button>
    			  </span>
 			   </div><!-- /input-group -->
 		</div>
		</div>
    
    <br>
    <nav aria-label="Page navigation">
 			<ul class="pagination">
 			<c:if test="${page.prev }">
    			<li class="page-item">
      				<a class="page-link" href="${contextPath }/shop/shopList.do?num=${page.startPageNum - 1 }" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      				</a>
    			</li>
    		</c:if>
    		<c:forEach begin="${page.startPageNum }" end="${page.endPageNum }" var="num">
    		<c:if test="${select != num }">
    			<li class="page-item"><a class="page-link" href="${contextPath }/shop/shopList.do?num=${num }">${num }</a></li>
    		</c:if>
    		<c:if test="${select == num }">
    			<li class="page-item active"><b class="page-link" >${num }</b></li>
    		</c:if>
			</c:forEach>
			<c:if test="${page.next }">
    			<li class="page-item">
      				<a class="page-link" href="${contextPath }/shop/shopList.do?num=${page.endPageNum + 1}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span>
      				</a>
    			</li>
    		</c:if>
  			</ul>
		</nav>
</main>
</div>
</body>
</html>