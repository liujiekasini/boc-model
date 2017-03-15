<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<title>登录页面</title>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="load_div">
    	<div class="load_div_l L"></div>       
        <div class="load_div_r L">
        	 <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
        	<input type="text" value="" class="load_txt" name="username"/>
            <input type="password" value="" class="load_txt" name="password"/>
<!--             <img style="height:40px;margin-left: 7px;" id="verifyCodeImg" src="Kaptcha.jpg"> -->
<!--             <input type="text" id="verifyCode" name="verifyCode" class="load_txt load_txt1" value="验证码" /> -->
            <input type="submit" class="load_btn" value="登录" style="margin-top: 10px;" />
              <p class="load_p">${errorMsg}</p>
            </form>
        </div>
    </div>
</body>
</html>
