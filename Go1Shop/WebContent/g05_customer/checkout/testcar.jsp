<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">.
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/_css/card.css">

<style>
.demo-container {
    width: 350px;
    margin: 50px auto;
}

form {
    margin: 30px;
}
input {
    width: 200px;
    margin: 10px auto;
    display: block;
}
</style>
<script language="javascript">
		function reSize(){
		　　parent.document.getElementById("carFrame").height=document.body.scrollHeight;
		} 
		window.onload=reSize;
</script>
<body>
<div class="demo-container">
    <div class="card-wrapper"></div>
    <div class="form-container active">
        <form action="">
            <input placeholder="Card number" type="text" name="number">
            <input placeholder="Full name" type="text" name="name">
            <input placeholder="MM/YY" type="text" name="expiry">
            <input placeholder="CVC" type="text" name="cvc">
        </form>
    </div>
</div>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="<%=request.getContextPath()%>/_js/card.js"></script>
<script>
    $('.active form').card({
        container: $('.card-wrapper')
    })
</script>
</body>
</html>