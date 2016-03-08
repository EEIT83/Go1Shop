<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Modify</title>
<script language="javascript">
		function reSize(){
		　　//parent.document.all.frameid.height=document.body.scrollHeight; 
		　　parent.document.getElementById("modifyFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <style>
  label{
  font-size:25px;
  }
  form div{
  margin:2% 0 0 0;
  }
  form div label{
  margin:0 0 2% 0;
  }
  
  </style>
  </head>
  
  <body>
 <div style="margin: 0 auto;">
  <form action="<c:url value="/Account/Modify.controller" />" method="post" class="w3-container"  >
  <div>
   <label for="mail">Mail</label>
   <input type="text" name="mail" id="mail" class="w3-input" value="${account.mail}" disabled  />
   </div>
   <br>
    <div>
   <label for="mem_name">Name</label>&nbsp;
   <input type="text" name="mem_name" id="mem_name" value="${account.mem_name }" class="w3-input " />
   <span id="errorMem_name">${error.mem_name }</span>
   </div>
   <br>
    <div>
   <label for="nickName">NickName</label>&nbsp;
   <input type="text" name="nickName" class="w3-input" id="nickName" value="${account.nickName}">
   <span id="errorNickname">${error.nickName }</span>
   </div>
   <br>
    <div>
   <label for="bdate">Birthday</label>&nbsp;
   <input type="text" name="bdate" class="w3-input" id="bdate" value="${account.bdate}">
   <span id="errorBdate">${error.bdate }</span>
   </div>
   <br>
    <div>
   <label>Gender</label>
   <span style="font-size:30px;margin-left:100px;"><input type="radio" name="gender"   value="1" ${account.gender != 2 ? "checked" : ""}>Male</span>
   <span style="font-size:30px;margin-left:80px;"><input type="radio" name="gender"  value="2" ${account.gender == 2 ? "checked" : ""}>Female</span>
   <span style="float:right;"><input type="submit" name="pageStatus" value="save" class="btn btn-primary btn-lg" style="font-size:25px;"></span>
   </div>
   
   </form>
  </div>
 <!--<script src="../js/Modify.js"></script>  -->

  </body>
</html>
