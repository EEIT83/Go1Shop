<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
</style>
<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>



<link rel="stylesheet" href="../_css/bootstrap.min.css">
<link rel="stylesheet" href="../_css/justified-nav.css">

</head>
<body>
	<div class="container">
		<div class="masthead">
			<div>
			<span class="text-muted"; style="font-size:30px">Go1Shop後台管理系統</sapn>
			<span style="margin-left:68%;font-size:15px;"><c:if test="${bLoginOK != null}">
				${mail}<a href="/Go1Shop/backLogout.do">登出</a>
			</c:if>
			</span>
		</div>	
			
			<nav>
				<ul class="nav nav-justified">
					<li><a href="../backLogin.jsp">管理員</a></li>
					<li><a href="/Go1Shop/gb04_marketing/backMarketing.jsp">廣告管理</a></li>
 					<li><a href="/Go1Shop/g07_msgboard/comments.do?manage=1">留言板管理</a></li>
					<li><a href="/Go1Shop/gb02_member/backMember.jsp">會員權限管理</a></li>
					<li><a href="#">修改密碼</a></li>
					<c:if test="${bmail=='admin@gmail.com' }">
						<li><a href="/Go1Shop/gb02_member/Register.jsp">新增管理者</a></li>
						<li><a href="#">查詢管理者</a></li>
					</c:if>			
					
<!-- 					<li><a href="AutoComplete.html">系統公告</a></li> -->
<!-- 					<li><a href="#">優惠設定</a></li> -->
				</ul>
			</nav>
		</div>

		<!-- Jumbotron -->
		<div class="jumbotron">
			<div class="page-header">
				<h3>
					新增管理者
					 <small></small>
				</h3>
			</div>
			
			<!-- 每頁不同的內容從這裡開始 -->
  <div>  
  <form action="<c:url value="/Admin/SelectAdmin.controller"/>" method="get">
    <label>Mail</label>
    <input type="text" name="ad_mail" id="ad_mail">
    <input type="button" value="search" id="buttonLoad">
    <img src="../images/ajax-loader.gif" id="img1" style="display:none">
  	</form>
  	</div>
  	<div id="displayResult">
  	<table>
  	 <thead>
  	 	<tr>
  	 	<th>帳號</th>
  	 	<th></th>
  	 	</tr>
  	 </thead>
  	 <tbody id="tbody">
  	 </tbody>
  	 <tfoot>
	<tr>
	<td colspan="2" id="resultCount"></td>
	</tr>
  	 </tfoot>
  	</table>
  	</div>
 			<!-- 每頁不同的內容到這裡結束 -->
		</div>

		

		<!-- Site footer -->
		<footer class="footer" >
			<p>Go1Shopping &copy; EEIT83 2016</p>
		</footer>

	</div>
	
<script type="text/javascript" src="../_js/SelectAdmin.js"></script>
  </body>
</html>
