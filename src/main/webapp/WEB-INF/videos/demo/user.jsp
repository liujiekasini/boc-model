<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   --%>
<%-- <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   --%>
<%-- <%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!-- <!doctype html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <meta name="renderer" content="webkit|ie-comp|ie-stand"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
<!-- <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->
<!-- <meta http-equiv="Cache-Control" content="no-siteapp"> -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>   --%>
<%-- <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.autocomplete.js"></script>   --%> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>   --%>
<%-- <%--     <script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery.autocomplete.css"></script>   --%> --%>

<!--     <title>用户列表</title>   -->
<!--   </head>   -->
<!--   <body>   -->
<%--     <h1>${message }</h1>   --%>
<%--     <h1>用户列表-----<a href="${pageContext.request.contextPath}/logout">退出登录</a>    </h1>   --%>
<!--     <h2>权限列表</h2>   -->
<%--    	1:<shiro:authenticated>用户已经登录显示此内容</shiro:authenticated> <br/>  --%>
<%--     2:<shiro:hasRole name="manager">manager角色登录显示此内容</shiro:hasRole>  <br/>  --%>
<%--     3:<shiro:hasRole name="admin">admin角色登录显示此内容</shiro:hasRole>  <br/>  --%>
<%--     4:<shiro:hasRole name="normal">normal角色登录显示此内容</shiro:hasRole>  <br/>  --%>
      
<%--     5:<shiro:hasAnyRoles name="manager,admin">**manager or admin 角色用户登录显示此内容**</shiro:hasAnyRoles><br/>  --%>
<%--     6:<shiro:principal/>-显示当前登录用户名  <br/>  --%>
<%--     7:<shiro:hasPermission name="add">add权限用户显示此内容</shiro:hasPermission>  <br/>  --%>
<%--     8:<shiro:hasPermission name="user:query">query权限用户显示此内容<shiro:principal/></shiro:hasPermission> <br/>   --%>
<%--     9:<shiro:lacksPermission name="user:del"> 不具有user:del权限的用户显示此内容 </shiro:lacksPermission>  <br/>  --%>
<!--    10: <ul>   -->
<%--         <c:forEach items="${userList }" var="user">   --%>
<%--             <li>用户名：${user.username }----密码：${user.password }----<a href="/user/edit/${user.id}">修改用户</a>----<a href="javascript:;" class="del" ref="${user.id }">删除用户</a></li>   --%>
<%--         </c:forEach>   --%>
<!--     </ul>   -->
    
<!--     <script>   -->
//     $(document).ready((function () { 
//     		var data = ["河北省", "河南省", "山东", "北京", "天津"]; 
//     		var option={
//     				width: 220, //下拉框的宽度，default：input元素的宽度
//     		        minChars: 0,        //至少输入的字符数，default：1；
//     		        max: 10,            //下拉项目的个数，default：10
//     		        scrollHeight: 300,    // 下拉框的高度， Default: 180 
//     		        scroll: true,        //当结果集大于默认高度时，是否使用滚动条，Default: true
//     		        multiple: false,    //是否允许输入多个值. Default: false
//     	            matchContains: true,//是否只要包含文本框里的就可以
//     	            autoFill:false,//自动填充
//     		    };
//     		$("#txtProvince").autocomplete(data,option); 
//     	} 
//     	)); 
//         //进行支付
//         function submitbtn(){
//         	var mon=$("#paymaony").val();
//         	 $.ajax({  
//         		 data:{
//         			 mon:mon
//         		 },
//         	    type : "POST",
//                  url:"${pageContext.request.contextPath}/admin/alipay",  
//                  success:function(e){  
//                 	 alert(e);
//                  }  
//              }); 
//         }
<!--     </script>   -->
    
<!--    11 <input type="text"  value="10" id="paymaony"/>ge<br> -->
<!-- 	<button  type="button"  onclick="submitbtn()">测试redis</button>     -->
	    
<!-- 		<div>  -->
<!-- 		省份：<input id="txtProvince" type="text" />  -->
<!-- 		</div>  -->
<!--   </body>   -->
<!-- </html>   -->