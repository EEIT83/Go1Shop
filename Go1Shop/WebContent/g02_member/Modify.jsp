<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Modify</title>
  </head>
  
  <body>
  <form action="<c:url value="/Account/Modify.controller" />" method="post">
   <label>Mail</label>
   <input type="text" name="mail" value="${account.mail}" />
   <br>
   <label>Name</label>
   <input type="text" name="mem_name" id="mem_name" value="${account.mem_name }" />
   <span id="errorMem_name">${error.mem_name }</span>
   <br>
   <label>gender</label>
   <input type="radio" name="gender" value="1" ${account.gender != 2 ? "checked" : ""}> Male
   <input type="radio" name="gender" value="2" ${account.gender == 2 ? "checked" : ""}> Female
   <br>
   <label>Identification</label>
   <input type="text" name="identification" id="identification" value="${account.identification}">
   <span id="errorIdentification">${error.identification }</span>
   <br>
   <label>Birthday</label>
   <input type="text" name="bdate" id="bdate" value="${account.bdate}">
   <span id="errorBdate">${error.bdate }</span>
   <br>
   <input type="submit" name="pageStatus" value="save">

   </form>
 <!--<script src="../js/Modify.js"></script>  -->

  </body>
</html>
