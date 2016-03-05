<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用javascript制作留言版</title>
<script language="javascript"> 
 function mySubmit()
 {
   var myMessage = document.getElementById("myMessage");
   var mybr = document.createElement("br");
   var myTable = document.createElement("table");
   myTable.className="myTable";
   var myTitleTr = myTable.insertRow(-1);
   myTitleTr.className="myTitleTr";
   var myTitleTd = myTitleTr.insertCell(-1);
   myTitleTd.innerHTML = document.getElementById("myTitle").value;
   var myContentTr = myTable.insertRow(-1);
   var myContentTd = myContentTr.insertCell(-1);
   myContentTd.innerHTML = document.getElementById("myContent").value;   document.getElementById("myTitle").value = "";
   document.getElementById("myContent").value = "";
   myMessage.appendChild(mybr);
   myMessage.appendChild(myTable);
 } 
</script> 
<style type="text/css"> 
<!-- 
   body{background-color=87cefal;} 
   .myTable{ border:1px solid blue; width:430px; font-size:12px; }      .myTitleTr{ background-color:yellow; font-weight:bold; color:red; } -->
</style> 
</head> 
<body> 
  <form> 
   <table>
     <tr>
      <td width="316">&#22995;&#21517; <input type="text" id="myTitle" size="20" />
      </td> 
      <td width="55">
      <input name="button" type="button" onClick="mySubmit();" value="&#30041;&#35328;" />
      </td> 
     </tr> 
     </tr> 
     <tr>
      <td colspan="2">
      <textarea id="myContent" cols="50" rows="10"></textarea>
      </td>
     </tr>
    </table>
   <div id="myMessage"></div> 
 </form>
</body>
</html>