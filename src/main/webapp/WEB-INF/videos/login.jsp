<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader/0.1.5/webuploader.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>  
<script src="${pageContext.request.contextPath}/js/rsa.js"type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/js/base64.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/js/KinerCode.js" type="text/javascript"></script> 


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.autocomplete.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/icon.css">   


 	 
  	  <title>登录页面</title>  
    <script type="text/javascript">
		$().ready( function() {
				//生成验证码
				 var $code = document.getElementById("mycode");
			    var $inpputCode = document.getElementById("inputCode");
			    var c = new KinerCode({
			        len: 4,//需要产生的验证码长度
// 			        chars: ["1+2","3+15","6*8","8/4","22-15","8*9","4+11","7-1"],//问题模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典  
			        chars: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'],  
			        question: false,//若给定词典为算数题，则此项必须选择true,程序将自动计算出结果进行校验【若选择此项，则可不配置len属性】,若选择经典模式，必须选择false
			        copy: false,//是否允许复制产生的验证码
			        bgColor: "FFFFFF",//背景颜色[与背景图任选其一设置]
			        //bgImg:"bg.jpg",//若选择背景图片，则背景颜色失效
			        randomBg: true,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
			        inputArea: $inpputCode,//输入验证码的input对象绑定【 HTMLInputElement 】
			        codeArea: $code,//验证码放置的区域【HTMLDivElement 】
			        click2refresh: true,//是否点击验证码刷新验证码
			        false2refresh: true,//在填错验证码后是否刷新验证码
			        validateEven: "blur",//触发验证的方法名，如click，blur等
			    });
			    //获取生成的验证码
			    function getValidateCode() {
			        var codeStr = "";
			        $.each($("#mycode").find("span"), function (i, v) {
			            codeStr += $(v).text();
			        });
			        return codeStr.toLowerCase();
			    }
		var $loginForm = $("#loginForm");
		var $username = $("#username");
		var $password = $("#password");
		var $isRememberUsername = $("#isRememberUsername");
		
		// 记住用户名
		if($.cookie("adminUsername") != null) {
			$isRememberUsername.prop("checked", true);
			$username.val($.cookie("adminUsername"));
			$password.focus();
		} else {
			$isRememberUsername.prop("checked", false);
			$username.focus();
		}
		
		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if($username.val() == ""){
				layer.msg("用户名不能为空!", {icon: 10, time: 1000});
				return false;
			}
			if ($username.val() == "") {
				layer.msg("用户名只能由4-6个字母数字下划线组成!", {icon: 10, time: 1000});
				return false;
			}
			if($password.val() == ""){
				ayer.msg("密码不能为空！", {icon: 10, time: 1000});
				return false;
			}
			if ($password.val() == "") {
				layer.msg("密码不可以少于6位数!", {icon: 10, time: 1000});
				return false;
			}
			if($("#inputCode").val() == ""){
				layer.msg("验证码不能为空！",{icon:10,time:1000});
				return false;
			}
			 if (getValidateCode() != $("#inputCode").val().toLowerCase()) {
		            layer.msg("验证码错误!", {icon: 10, time: 1000});
		            return false;
		        }
			
			if ($isRememberUsername.prop("checked")) {
				$.cookie('adminUsername', $username.val(), { expires: 7 }); 
			} else {
				$.cookie('adminUsername', null); 
			}
			
		});
	});
		function zhuCe(){
			location.href="${pageContext.request.contextPath}/zhuce";
		}
</script>
  </head>  
    
  <body>  
<%--     <h1>登录页面----${message }</h1>   --%>
	<div style="text-align: center;">
 	  <form  id="loginForm" action="${pageContext.request.contextPath}/login"  commandName="user"  method="post">  
    	<div  style="width:300px;height:300px;margin-left: 400px;">
	   		<table style="margin-top: 150px;">
	   				<tr>
	   					<td style="text-align: right;">用户名：</td>  
						<td style="text-align: left;"><input type="text" name="username" id="username" placeholder="用户名" style="width:200px;"></input></td></tr>
					<tr>
						<td style="text-align: right;">密码：</td>  
						<td style="text-align: left;"><input type="password" name="password" id="password" placeholder="密码" style="width:200px;"></input></td>  </tr>
					<tr>
						<td style="text-align: right;">验证码:</td>
						<td style="text-align: left;"><input type="text"  id="inputCode" placeholder="验证码" style="width:100px;float:left"></input><span id="mycode" style="width:90px;height:30px;float:left;margin-left: 1px;"></span></td></tr>
					<tr>
						<td style="text-align: right;">记住我</td>  
						<td  style="text-align: left;"><input type="checkbox" name="rememberMe"  id="isRememberUsername"/></td>  </tr>
					<tr>
						<td><input type="submit" value="登录"></td>
						<td><input type="button" onclick="zhuCe()" value="注册"></td>
					</tr>
	   		</table>
   		</div>
   			<!-- 底部 -->
    	<footer class="footer mt-20">
			<div class="container-fluid">
				<nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
				<p>Copyright &copy;2016 H-ui.net All Rights Reserved. <br>
					<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
				</p>
			</div>
		</footer>
   	 </form> 
   	 </div>
  </body>  
</html>  