<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="<%=request.getContextPath()%>/_js/jquery-1.12.0.min.js"></script>
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>



<link rel="stylesheet" href="../_css/bootstrap.min.css">
<link rel="stylesheet" href="../_css/justified-nav.css">
<style>
label{
margin-left:30px;
}
</style>
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
					<li class="active"><a href="/Go1Shop/gb02_member/ChangeAdPwd.jsp">修改密碼</a></li>
					<c:if test="${bmail=='admin@gmail.com' }">
						<li><a href="/Go1Shop/gb02_member/Register.jsp">新增管理者</a></li>
						<li><a href="/Go1Shop/gb02_member/SelectAdmin.jsp">查詢管理者</a></li>
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
					管理員更改密碼
					 <small></small>
				</h3>
			</div>
			
			<!-- 每頁不同的內容從這裡開始 -->

<%-- <form action="<c:url value="/Admin/ChangePwd.controller"/>?pageStatus=Ad_available" method="post" id="form"> --%>
<form action="<c:url value="/Admin/ChangePwd.controller"/>?pageStatus=Ad_available" method="post" id="form">
		<label>OldPwd</label> 
		<input type="password" name="oldPwd" id="oldPwd" />
		<span id="errorOldPwd"></span> 
		<span><label>NewPwd</label> 
		<input type="password" name="newPwd" id="newPwd" />
		<span id="errorNewPwd"></span></span>
		<span><label>CheckNewPwd</label> 
		<input type="password" name="checkNewPwd" id="checkNewPwd" />
		<span id="errorCheckNewPwd"></span></span>
		<span style="margin-left:30px;"><input type="submit" id="submit" value="確認修改"></span>
<!-- 		<input type="button" value="Submit" id="submit"> -->
		<span>${message }</span>
	</form>
<!-- <script src="<%=request.getContextPath() %>/_js/ChangPwd.js"></script> -->
			
			

			<!-- 每頁不同的內容到這裡結束 -->
		</div>

		

		<!-- Site footer -->
		<footer class="footer" >
			<p>Go1Shopping &copy; EEIT83 2016</p>
		</footer>

	</div>
	<!-- /container -->




<!-- 		<script> -->
		
		
<!-- 		//將資料存到陣列中 -->

<!-- 		//teacher's code -->

<!-- 		var show; -->
<!-- 		var txt; -->

<!-- 		var xhr; -->
<!-- 		var datas = null; -->
<!-- 		var keyword = null; -->

<!-- 		window.addEventListener("load", init, false); -->
		
<!-- 		function init() { -->

<!-- 			txt = document.getElementById("txtSearch"); -->
<!-- 			txt.addEventListener("keyup", getData, true); -->
<!-- 			//txt.addEventListener("keyup", getData2, true); -->
<!-- 			show = document.getElementById("div1"); -->

<!-- 		} -->

<!-- 		function getData() { -->

<!-- 			//my code -->

<!-- 			keyword = document.getElementById("txtSearch").value.trim(); -->

<!-- 			if (keyword != null && keyword.length != 0) { -->
<!-- 				xhr = new XMLHttpRequest(); -->

<!-- 				xhr.addEventListener("readystatechange", function() { -->

<!-- 					if (xhr.readyState == 4) { -->
<!-- 						if (xhr.status == 200) { -->

<!-- 							datas = JSON.parse(xhr.responseText); -->
<!-- 							console.log(datas) -->
							
<!-- 							//teacher's code -->
<!-- 							if (datas != null) { -->

<!-- 								//show.style.display = "block"; -->
<!-- 								if (show.childNodes.length > 0) { -->
<!-- 									show.removeChild(show.childNodes[0]); -->
<!-- 								} -->
<!-- 								var eleDiv = document.createElement("div"); -->
<!-- 								eleDiv.className = "list-group"; -->
<!-- 								for (var j = 0, max = datas.length; j < max; j++) { -->
<!-- 									var txtBtn = document.createTextNode(datas[j]); -->
<!-- 									var eleBtn = document.createElement("button"); -->
<!-- 									eleBtn.className = "list-group-item"; -->
<!-- 									eleBtn.setAttribute("type", "button"); -->
<!-- 									eleBtn.appendChild(txtBtn); -->

<!-- 									eleBtn -->
<!-- 											.addEventListener( -->
<!-- 													"click", -->
<!-- 													function() { -->
<!-- 														document.myData.keyword.value = this.firstChild.nodeValue; -->
<!-- 														show.style.display = "none"; -->
<!-- 													}, false) -->
<!-- 									eleDiv.appendChild(eleBtn); -->
<!-- 								} -->
<!-- 								show.appendChild(eleDiv); -->

<!-- 							} -->

							
							
<!-- 						} -->
<!-- 					} -->
<!-- 				}) -->
<!-- 				xhr.open("get", "JsonSimpleDemo?keyword=" + keyword, true); -->
<!-- 				xhr.send() -->
<!-- 			} else { -->
<!-- 				var div1 = document.getElementById("div1"); -->
<!-- 				div1.innerHTML = ""; -->
<!-- 			} -->

			

<!-- 		} -->
		
	
		
<!-- 	</script> -->


<!-- 	<script> -->
<!-- $(document).on('ready', function() { -->
<!--     $("#input-4").fileinput({showCaption: false}); -->
<!-- }); -->
<!-- </script> -->


</body>

</html>