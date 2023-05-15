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
</style>
<body>
<div class="body">
  <h2>일반경매</h2>
  	<div class="row">
	  <c:forEach items="${list }" var="pr">
	  	<div class="col-md-4">
			<div class="container col-md-4">
				  <div class="card" style="width:200px">
				    <img class="card-img-top" src="https://cdn.pixabay.com/photo/2017/10/05/10/05/leaf-2818896_960_720.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
				      <h4 class="card-title">${pr.pr_name }</h4>
				      <p class="card-text">${pr.pr_intro }</p>
				      <a href="<c:url value='/general/detail/${pr.pr_code }'></c:url>" class="btn btn-primary">See Detail</a>
				    </div>
				  </div>
			  <br>
			</div>
		</div>
	 </c:forEach>
  	</div>
</div>
</body>
</html>
