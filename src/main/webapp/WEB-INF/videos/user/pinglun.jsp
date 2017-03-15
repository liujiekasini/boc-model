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
  <title>评论</title>  
    <script type="text/javascript">
    layui.use('layedit', function(){
    	  var layedit = layui.layedit,$ = layui.jquery;
    	  //构建一个默认的编辑器
    	  var index = layedit.build('LAY_demo1');
    	  //编辑器外部操作
    	  var active = {
    	    content: function(){
    	      alert(layedit.getContent(index)); //获取编辑器内容
    	    }
    	    ,text: function(){
    	      alert(layedit.getText(index)); //获取编辑器纯文本内容
    	    }
    	    ,selection: function(){
    	      alert(layedit.getSelection(index));
    	    }
    	  };
    	  
    	  $('.site-demo-layedit').on('click', function(){
    	    var type = $(this).data('type');
    	    active[type] ? active[type].call(this) : '';
    	  });
    	  
    	  //自定义工具栏
    	  layedit.build('LAY_demo2', {
    	    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
    	    ,height: 100
    	  })
    	});
	</script>
  </head>  
 <body class="easyui-layout">   
	<!-- 头部导航 -->
    <div data-options="region:'north',title:'头部导航',split:true" style="height:100px;">
    	<%@include file="head.jsp" %> 	
    </div>  
    <!-- 内容 --> 
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
	   		<div style="margin-bottom: 20px; width: 500px;">
			  <textarea class="layui-textarea" id="LAY_demo2" style="display: none"></textarea>
			</div>   
	   		<div class="site-demo-button" style="margin-top: 20px;">
			  <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
			  <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
			  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
			</div>
	   		<ul class="commentList">
			  <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="http://static.h-ui.net/h-ui/images/ucnter/avatar-default.jpg"></i></a>
			    <div class="comment-main">
			      <header class="comment-header">
			        <div class="comment-meta"><a class="comment-author" href="#">辉哥</a> 评论于
			          <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time>
			        </div>
			      </header>
			      <div class="comment-body">
			        <p><a href="#">@某人</a> 你是猴子派来的救兵吗？</p>
			      </div>
			    </div>
			  </li>
			</ul>
	   		
	   		
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