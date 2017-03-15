<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
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
<title>注册</title>  
    <script type="text/javascript">
		function zhuce(){
			var username=$("#username").val();
			var password=$("#password").val();
			var tele=$("#tele").val();
			var address=$("#address").val();
			if(username == "" ||password=="" || tele=="" || address==""){
				layer.msg("不能为空！", {icon: 10, time: 1000});
				return false;
			}
			 $.ajax({  
				 data:{
					 username:username,
					 password:password,
					 tele:tele,
					 address:address
				 },
			    type : "POST",
		         url:"${pageContext.request.contextPath}/anaysis/zhuce",  
		         success:function(e){  
		        	if(e > 0){
		        		layer.msg("注册成功", {icon: 10, time: 1000});
		        		location.href="${pageContext.request.contextPath}/login";
		        	}else if(e == -1){
		        		layer.msg("已经存在！", {icon: 10, time: 1000});
		        	}else{
		        		layer.msg("操作错误！", {icon: 10, time: 1000});
		        	}
		         }  
		     }); 
		}
	</script>
  </head>  
 <body class="easyui-layout">   
	<!-- 头部导航 -->
    <div data-options="region:'north',title:'头部导航',split:true" style="height:100px;">
    	<%@include file="head.jsp" %> 	
    </div>  
    <!-- 内容 --> 
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;"> 
	   		<table style="margin-top: 150px;">
	   				<tr>
	   					<td style="text-align: right;">用户名：</td>  
						<td style="text-align: left;"><input type="text" name="username" id="username" placeholder="用户名" style="width:200px;"></input></td></tr>
					<tr>
						<td style="text-align: right;">密码：</td>  
						<td style="text-align: left;"><input type="text" name="password" id="password" placeholder="密码" style="width:200px;"></input></td>  </tr>
					<tr>
						<td style="text-align: right;">手机号码：</td>
						<td style="text-align: left;"><input type="text" name=tele id="tele" placeholder="电话" style="width:200px;"></input></td>  </tr>
					<tr>
						<td style="text-align: right;">地址：</td>  
						<td  style="text-align: left;"><input type="text" name="address" id="address" placeholder="地址" style="width:200px;"></input></td>  </tr>
					<tr>
						<td></td>
						<td  style="text-align: left;"><input type="button" onclick="zhuce()" value="注册"></td>
					</tr>
	   		</table>
   			<!-- 底部 -->
    	<footer class="footer mt-20">
			<div class="container-fluid">
				<nav> <a href="#" target="_blank">关于我们</a> <span class="pipe">|</span> <a href="#" target="_blank">联系我们</a> <span class="pipe">|</span> <a href="#" target="_blank">法律声明</a> </nav>
				<p>Copyright &copy;2016 H-ui.net All Rights Reserved. <br>
					<a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">京ICP备1000000号</a><br>
				</p>
			</div>
		</footer>
   	 </div>
  </body>  
</html>  