<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Go1Shop Home</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/_css/style.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/_js/jquery.leanModal.min.js"></script>
<!-- jQuery Ui -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/_js/jquery-ui.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/_js/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {
  			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
</script>
<style type="text/css">
#ui-datepicker-div {
	width: 30%;
}
</style>

</head>

<body>

	<ul id="leftNavigation">
		<c:if test="${!empty LoginOK}">
			<li class="active1"><a href="" style="text-decoration: none"
				target="_blank"> <i class="glyphicon glyphicon-user leftNavIcon"></i>基本資料</a>
			<ul>
					<li><a href="#" style="width: 100%" id="modify">修改基本資料</a></li>
					<li><a href="#" id="changePwd">修改密碼</a></li>
					<li><a href="#" id="history">歷史訂單</a></li>
			</ul>
			</li>	
				<li class="active1"><a href="" id="sell" style="text-decoration: none" target="_blank">
				<i class="glyphicon glyphicon-home leftNavIcon"></i>商家專區</a>
					<ul>
						<li><a href=" "id="newPro" style="width: 100%">新增商品</a></li>
<!-- 						<li><a href="" id="newPro" style="width: 100%">商品查詢</a></li> -->
						<li><a href="<%=request.getContextPath()%>/g03_product/shopInfo.jsp">商店資訊</a></li>
						<c:choose>
							<c:when  test="${empty StoreVO}">
								<li><a style='higth=10px;' href="<%=request.getContextPath()%>/g03_product/addShopInfo.jsp" >新增商店資訊</a></li>
							</c:when>
							<c:otherwise>
								<li><a style='higth=10px;' href="<%=request.getContextPath()%>/g03_product/addShopInfo.jsp" >修改商店資訊</a></li>
							</c:otherwise>
						</c:choose>
					</ul>

				</li>
			<li class="active1"><a href="#" style="text-decoration: none"
				target="_blank"> <i
					class="glyphicon glyphicon-comment leftNavIcon"></i>訊息
			</a>
				<ul>
					<li><a href='#' id="mail">收信</a></li>
					<li><a href='#' id="sendmail">寫信</a></li>
				</ul></li>
		</c:if>
		<li class="active1"><a href="#" style="text-decoration: none">
				<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>上衣專區
		</a>
			<ul>
				<li><a href="#" style="width: 100%">短袖</a></li>
				<li><a href="#">長袖</a></li>
				<li><a href="#">背心</a></li>
				<li><a id="d"
					href="<c:url value='/g03_product/ProductGenderServlet.controller?gender=M&part=襯衫'/>">襯衫</a></li>
				<li><a href="#">毛衣</a></li>
				<li><a href="#">外套</a></li>
			</ul></li>
		<li class="active1"><a href="#" style="text-decoration: none">
				<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>褲子專區
		</a>
			<ul>
				<li><a href="#">短褲</a></li>
				<li><a href="#">長褲</a></li>
				<li><a href="#">牛仔褲</a></li>
				<li><a href="#">休閒褲</a></li>
				<li><a href="#">工作褲</a></li>
				<li><a href="#">飛鼠褲</a></li>
				<li><a href="#">海灘褲</a></li>
				<li><a href="#">運動褲</a></li>
			</ul></li>
		<li class="active1"><a href="#" style="text-decoration: none">
				<i class="glyphicon glyphicon-triangle-right leftNavIcon"></i>配件專區
		</a>
			<ul>
				<li><a href="#">圍巾</a></li>
				<li><a href="#">帽子</a></li>
				<li><a href="#">眼鏡</a></li>
				<li><a href="#">項鍊</a></li>
				<li><a href="#">髮圈</a></li>
				<li><a href="#">皮帶</a></li>
			</ul></li>
	</ul>


	<!-- ---------------------彈跳視窗------------------------------- -->
	<div id="signup">
		<div id="signup-ct">
			<!-- 登入 -->
			<div id="loginForm" style="display: inline;">
				<div id="signup-header">
					<p>會員登入</p>
					<a class="modal_close" href="#"></a>
				</div>
				<form
					action="<c:url value="/Account/Login.controller?accountStatus=login" />"
					method="post">
					<div class="txt-fld">
						<label for="mail">帳號:</label> <input type="text" name="mail"
							id="mail" class="input"> <span id="errorMail">${error.mail}</span>
					</div>
					<div class="txt-fld">
						<label for="pwd">密碼:</label> <input type="text" name="pwd"
							id="pwd" class="input"> <span id="errorPwd">${error.pwd }</span>
					</div>
					<h5 id="loginError">${error.loginError }</h5>
					<!-- 					  <div class="btn-fld"> -->
					<input type="submit" value="Sign In &raquo;" class="loginbutton">
					<input type="button" value="Sign Up &raquo;" class="registerbutton"
						id="register">

					<!-- 					</div> -->
				</form>
			</div>
			<!-- 註冊 -->
			<div id="registerForm" style="display: none;">
				<div id="signup-header">
					<p>會員註冊</p>
					<a class="modal_close" href="#"></a>
				</div>
				<form action="<c:url value="/Account/Register.controller" />"
					method="post">
					<div class="txt-fld">
						<label>帳號：</label> <input type="text" name="mail" class="input" />
						<span id="errorMail"></span>
					</div>
					<div class="txt-fld">
						<label>密碼：</label> <input type="text" name="pwd"
							class="input" /> <span id="errorPwd"></span>
					</div>
					<div class="txt-fld">
						<label>姓名：</label> <input type="text" name="mem_name"
							id="mem_name" class="input" /> <span id="errorMem_name">${error.mem_name }</span>
					</div>
					<div class="txt-fld">
						<label>性別：</label> <input type="radio" name="gender" value="1"
							class="gender" id="male" /> Male <input type="radio"
							name="gender" value="2" class="gender" id="female">
						Female
					</div>
					<div class="txt-fld">
						<label>暱稱：</label> <input type="text" name="nickName"
							id="nickName" class="input" /> <span id="errorNickName">${error.nickName }</span>
					</div>
					<div class="txt-fld">
						<label>生日：</label> <input type="text" name="bdate" id="bdate"
							class="input" /> <span id="errorBdate">${error.bdate }</span>
					</div>
					<div class="btn-fld">
						<input type="submit" name="pageStatus" value="save"
							class="registerbutton">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/_js/register.js"></script>
	<script type="text/javascript">
// 修改基本資料
	var modify = document.getElementById("modify");
	modify.addEventListener("click", function() {
		
		if(document.getElementById("mainFrame")!=null){
			
			document.getElementById("mainFrame").style.display="none";	
		}
		document.getElementById("right").innerHTML="<iframe src='<c:url value='/Account/Modify.controller'/>' scrolling='no' frameborder='0' height='100%' id='modifyFrame' width='100%' onload='IFrameReSize('modifyFrame');IFrameReSizeWidth('modifyFrame');'></iframe>";
	})
// 修改密碼
	var changePwd = document.getElementById("changePwd");
	changePwd.addEventListener("click", function() {
		if(document.getElementById("mainFrame")!=null){			
		document.getElementById("mainFrame").style.display="none";
		}
		document.getElementById("right").innerHTML="<iframe src='<c:url value='/Account/ChangePwd.controller?pageStatus=prompt' />' scrolling='no' frameborder='0' height='100%' id='changePwdFrame' width='100%' onload='IFrameReSize('changePwdFrame');IFrameReSizeWidth('changePwdFrame');'></iframe>";
	})
	var mail = document.getElementById("mail");
	mail.addEventListener("click", function() {
		if(document.getElementById("mainFrame")!=null){
			document.getElementById("mainFrame").style.display="none";
		}
		document.getElementById("right").innerHTML="<iframe  src='<c:url value='/mail.do'/>' frameborder='0' height='100%' id='mailFrame' width='100%' onload='IFrameReSize('mailFrame');IFrameReSizeWidth('mailFrame');'></iframe>";
	})
	var sendmail = document.getElementById("sendmail");
	sendmail.addEventListener("click", function() {
		if(document.getElementById("mainFrame")!=null){
			document.getElementById("mainFrame").style.display="none";
		}
		document.getElementById("right").innerHTML="<iframe style='width: 100%;' src='/Go1Shop/gb05_mail/send.jsp' scrolling='no' frameborder='0' height='100%' id='sendmailFrame' width='100%' onload='IFrameReSize('sendmailFrame');IFrameReSizeWidth('sendmailFrame');'></iframe>";
	})

// 歷史訂單
	var history = document.getElementById("history");
	history.addEventListener("click", function() {
		alert(1233);
		if(document.getElementById("mainFrame")!=null){
			
		document.getElementById("mainFrame").style.display="none";
		}
		alert(123);
		document.getElementById("right").innerHTML="<iframe src='<c:url value='/OrdDetail.do?memId=${LoginOK.mem_id}'/>' scrolling='no' frameborder='0' height='100%' id='historyFrame' width='100%' onload='IFrameReSize('historyFrame');IFrameReSizeWidth('historyFrame');'></iframe>";
	})	
	
//新增商品


</script>


	<!-- 彈跳視窗 -->
	<script type="text/javascript">
		var registerForm = document.getElementById("registerForm");
		var loginForm = document.getElementById("loginForm");
		document.getElementById("register").addEventListener("click",
				function() {
					document.getElementById("mail").value = "";
					document.getElementById("pwd").value = "";
					document.getElementById("errorMail").innerHTML = "";
					document.getElementById("errorPwd").innerHTML = "";
					document.getElementById("mem_name").value = "";
					document.getElementById("nickName").value = "";
					document.getElementById("bdate").value = "";
					document.getElementById("male").checked = false;
					document.getElementById("female").checked = false;
					loginForm.style.display = "none";
					registerForm.style.display = "inline";
				})
		document.getElementById("login").addEventListener("click", function() {
			document.getElementById("mail").value = "";
			document.getElementById("pwd").value = "";
			document.getElementById("errorMail").innerHTML = "";
			document.getElementById("errorPwd").innerHTML = "";
			document.getElementById("loginError").innerHTML = "";
			loginForm.style.display = "inline";
			registerForm.style.display = "none";
		})
	</script>
	<!-- 驗證登入帳號 -->
	<script type="text/javascript">
		var checkMail = document.getElementById("mail");
		var checkPwd = document.getElementById("pwd");
		checkMail.addEventListener("blur", function() {
			var regExp = /^[^@^\s]+@[^\.@^\s]+(\.[^\.@^\s]+)+$/;
			if (checkMail.value != "") {
				if (!regExp.test(checkMail.value)) {
					document.getElementById("errorMail").innerHTML = "電子郵件不正確";
				}
			} else {
				document.getElementById("errorMail").innerHTML = "不可以空白";
			}
		});
		checkPwd.addEventListener("blur", function() {
			if ((this.value) == "") {
				document.getElementById("errorPwd").innerHTML = "不可以空白";
			} else {
				document.getElementById("errorPwd").innerHTML = " ";
			}
		});
	</script>
</body>
</html>
