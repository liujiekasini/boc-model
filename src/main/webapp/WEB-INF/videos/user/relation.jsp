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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.autocomplete.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/icon.css">   

<title>首页</title>  
</head>  
<body class="easyui-layout">   
	<!-- 头部导航 -->
    <div data-options="region:'north',title:'头部导航',split:true" style="height:100px;">
    	<%@include file="head.jsp" %> 	
    </div>   
    <!-- 左侧导航 --> 
    <div data-options="region:'west',title:'左侧导航',split:true" style="width:200px;">
    	<div class="left_container">
    		<ul class="nav_sec">
    			<a  href="${pageContext.request.contextPath}/home"><li>业务建模</li></a>
    			<a  href="${pageContext.request.contextPath}/industry"><li>行业风险调试</li></a>
    			<a  href="${pageContext.request.contextPath}/enterprise"><li>企业风险调试</li></a>
    			<a  href="${pageContext.request.contextPath}/relation"><li   class="sele">关联图谱调试</li></a>
    		</ul>
    	</div>
    </div>  
    <!-- 内容 --> 
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
    		<div>
		  			<table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>公司简称：</span></td>
		  					<td style="width:550px;"><textarea class="textarea"></textarea></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" value="清空"><br><input class="btn btn-success radius" style="margin-top: 20px;" type="button" value="提交"></td>
		  				</tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
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
    </div>   
</body>  

</html>