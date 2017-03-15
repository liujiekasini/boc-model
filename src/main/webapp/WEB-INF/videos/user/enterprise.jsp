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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/man.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.autocomplete.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/icon.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
<title>首页</title>  
<script type="text/javascript">

/**
 * 分析方法
 * @param type  1公司 2行业 3关系
 * @param title
 * @param content
 */
function analysis(type,title,content){
	$.ajax({  
		 data:{
			 type:type,
			 title:title,
			 content:content
		 },
	    type : "POST",
        url:"${pageContext.request.contextPath}/anaysis/startanaysis",  
        success:function(data){  
        	if(data.total!=0){
    			var content="<tr style='border-bottom:1px solid #919191;'><td>标题</td><td>内容</td><td>公司名字</td><td>业务分类</td></tr>";
    			for(var i=0;i<data.rows.length;i++){
    				var row=data.rows[i];
    				content+="<tr>";
    				content+="<td>"+row.title+"</td>";
    				content+="<td>"+row.content+"</td>";
    				content+="<td>"+row.companyName+"</td>";
    				var infos="";
    				if(row.ontologyInfos != null && row.ontologyInfos.length != 0){
    					var obj=row.ontologyInfos;
    					for(var j=0; j<obj.length;j++){
    						infos+="<p>"+obj[j].ontopath+"</p>";
    					}
    				}
    				content+="<td>"+infos+"</td>";
    				content+="</tr>";
    			}
                $(".select_industry_table").attr("style","border-bottom:1px solid #919191;");
    			//填充到页面
    			$('#inserttable_M').html(content);
    		}else{
    			layer.msg("没有结果！", {icon: 10, time: 1000});
    		}
        }
    }); 
}
/**
 * 加载词库
 */
function loadDIC(){
	$.ajax({
		 type : "POST",
	        url:"${pageContext.request.contextPath}/anaysis/loaddic",  
	        success:function(data){ 
	        	if(data==1){
	        		layer.msg("成功加载词典", {icon: 10, time: 1000});
	        	}else{
	        		layer.msg("词典加载失败", {icon: 10, time: 1000});
	        	}
	        }
	});
}
/**
 * 加载oec模型
 */
function loadOEC(){
	$.ajax({
		 type : "POST",
	        url:"${pageContext.request.contextPath}/anaysis/loadOEC",  
	        success:function(data){ 
	        	if(data==1){
	        		layer.msg("成功加载词典", {icon: 10, time: 1000});
	        	}else{
	        		layer.msg("词典加载失败", {icon: 10, time: 1000});
	        	}
	        }
	});
}
/**
 * 清空
 */
function empty(){
	$("#mytitle").val("");
	$("#mycontent").val("");
}
</script>
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
    			<a  href="${pageContext.request.contextPath}/enterprise"><li   class="sele">企业风险调试</li></a>
    			<a  href="${pageContext.request.contextPath}/relation"><li>关联图谱调试</li></a>
    		</ul>
    	</div>
    </div>  
    <!-- 内容 --> 
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
    			<div>
		  			<table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>标题：</span></td>
		  					<td style="width:550px;"><input type="text" class="input-text size-M" id="mytitle"/></td>
		  					<td style="width:350px;"></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>内容：</span></td>
		  					<td style="width:550px;"><textarea class="textarea" id="mycontent"></textarea></td>
		  					<td style="width:350px;text-align: right;"><input class="btn btn-success radius" type="button" onclick="loadDIC()"  value="加载词库"><span class="pipe"></span><input class="btn btn-success radius" type="button" onclick="empty()" value="清空"><br><input class="btn btn-success radius" style="margin-top: 20px;" type="button" onclick="loadOEC()" value="加载模型"><span class="pipe"></span><input class="btn btn-success radius"  style="margin-top: 20px;"  type="button" onclick="analysis('2',$('#mytitle').val(),$('#mycontent').val())" value="分析"></td>
		  				</tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  			<table class="select_industry_table"  id="inserttable_M">
		             </table>
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