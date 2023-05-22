<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반경매</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<style>
*{
  font-family: Arial, Helvetica, sans-serif;
  margin: 0; padding: 0; text-decoration: none;
  font-size: inherit; border-collapse: collapse; line-height: inherit;
  word-break: inherit; list-style: none;
}
.content-view{
  width: 1249px; padding: 0 0 60px; margin: 0 auto;
}
.body h2{
  padding: 18px 0 15px;
}
.card-title{
  font-size: 16px; font-weight: 600;
}
.card-text{
  font-size: 15px;
}
</style>
<body>
<div class="body">
  <h2>일반경매</h2>
  	<div class="col">
	  <c:forEach items="${productList }" var="product">
	  	<div class="col-md-4">
		  <div class="card" style="width:1000px">
		  <!-- 
		    <img class="card-img-top" src="<c:url value='/file${file[0].fi_save_name}' />" alt="Card image" style="width:100%">
		   -->
		    <div class="card-body">
		      <h4 class="card-title">${product.pr_name }</h4>
		      <p class="card-text">${product.pr_intro }</p>
		      <a href="<c:url value='/general/detail/${product.pr_code }'></c:url>" class="btn btn-primary">상품 보기</a>
		    </div>
		  </div>
		  <br>
		</div>
	 </c:forEach>
  	</div>
  	<div class="pagination-container">
	  	<ul class="pagination justify-content-center">
	  	<c:if test="${pm.prev}">
	  		<li class="page-item">
	  			<a class="page-link" href="<c:url value='/general/list?page=${pm.startPage-1}&search=${pm.cri.search}'></c:url>">이전</a>
	  		</li>
	  	</c:if>
	  	<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="i">
	  		<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	  			<a class="page-link" href="<c:url value='/general/list?page=${i}&search=${pm.cri.search}'></c:url>">${i}</a>
	  		</li>
	  	</c:forEach>
	  	<c:if test="${pm.next}">
	  		<li class="page-item">
	  			<a class="page-link" href="<c:url value='/general/list?page=${pm.endPage+1}&search=${pm.cri.search}'></c:url>">다음</a>
	  		</li>
	  	</c:if>
	  	</ul>
  	</div>
</div>
</body>
</html>
