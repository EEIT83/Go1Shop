<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
    <title>Properties</title>
  </head>  
  <body>
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
<script type="text/javascript" src="../js/SelectAdmin.js"></script>
  </body>
</html>
