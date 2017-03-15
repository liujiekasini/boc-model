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
   <title>监控</title>  
    <script type="text/javascript">
    $(function(){
    	//默认加载全部公司名称
    	showProjectInfo(1);
    });
  //公司名称简称  全称模糊查
    function showProjectInfo(page){
    	var page=page;
    	var pageSize=10;
    	$.ajax({
    	    type: 'POST',
    	    url : "${pageContext.request.contextPath}/searchmonitor",
    	    data:{page:page,pageSize:pageSize},
    	    success: function(data){
    	    	formatProjectInfoForTable(data);
    	    },
    	    error: function(){
    	    	alert("查询失败");
    	    }
    	});
    	function formatProjectInfoForTable(data){
    		if(data.total!=0){
    			var content="<tr style='border-bottom:1px solid #919191;'><td>登录账号</td><td>登录ip</td><td>登录时间</td></tr>";
    			for(var i=0;i<data.data.length;i++){
    				var row=data.data[i];
    				content+="<tr>";
    				content+="<td>"+row['loginName']+"</td>";
    				content+="<td>"+row['ip']+"</td>";
    				content+="<td>"+row['createTime']+"</td>";
    				content+="</tr>";
    			}
                $(".select_industry_table").attr("style","border-bottom:1px solid #919191;");
    			//填充到页面
    			$('#inserttable').html(content);
    			//更改分页
    			showPageStyle2("#wd",page,data.total,10,10,showProjectInfo);
    		}else{
    			layer.msg("没有结果！", {icon: 10, time: 1000});
    		}
    	}
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
	   			<div  style="width: 80%;margin: 50px 50px 50px 50px;">
					<table class="select_industry_table"  id="inserttable">
		             </table>
					<div class="page clearfix" id="wd"></div>
				</div>
	</div>
  </body>  
</html>  