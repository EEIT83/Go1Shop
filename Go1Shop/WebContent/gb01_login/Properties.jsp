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
  <form  method="get">
    <label>Mail</label>
    <input type="text" name="mail" id="mail">
    <label>Name</label>
    <input type="text" name="mem_name" id="mem_name" >
    <label>NickName</label>
    <input type="text" name="nickName" id="nickName">
    <label>Gender</label>
    <select name="gender" id="gender">
    	<option value="">請選擇</option>
    	<option  value="1">Man</option>
    	<option  value="2">Woman</option>
    </select>
    <label>狀態</label>
    <select name="status" id="status">
    	<option value="">請選擇</option>
    	<option  value="N">正常</option>
    	<option  value="S">停權</option>
    </select>
    <input type="button" value="search" id="buttonLoad">
    <img src="../images/ajax-loader.gif" id="img1" style="display:none">
  	</form>
  	</div>
  	<div id="displayResult">
  	<table>
  	 <thead>
  	 	<tr>
  	 	<th>帳號</th>
  	 	<th>姓名</th>
  	 	<th>暱稱</th>
  	 	<th>性別</th>
  	 	<th>狀態</th>
  	 	<th></th>
  	 	</tr>
  	 </thead>
  	 <tbody id="tbody">
  	 </tbody>
  	 <tfoot>
	<tr>
	<td colspan="6" id="resultCount"></td>
	</tr>
  	 </tfoot>
  	</table>
  	</div>
<script type="text/javascript" src="../_js/Properties.js"></script>
  </body>
</html>
