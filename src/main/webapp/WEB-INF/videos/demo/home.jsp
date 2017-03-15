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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.autocomplete.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layer.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.ie.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.min.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/H-ui.reset.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/themes/icon.css">   
<title>首页</title>  
</head>  
<body class="easyui-layout">   
	<!-- 头部导航 -->
    <div data-options="region:'north',title:'头部导航',split:true" style="height:100px;">
     </div>  
    <!-- 左侧导航 --> 
    <div data-options="region:'west',title:'左侧导航',split:true" style="width:200px;">
    	<div class="left_container">
    		<ul class="nav_sec">
    			<a  href="${pageContext.request.contextPath}/home"><li  class="sele">业务建模</li></a>
    			<a  href="${pageContext.request.contextPath}/industry"><li>行业风险调试</li></a>
    			<a  href="${pageContext.request.contextPath}/enterprise"><li>企业风险调试</li></a>
    			<a  href="${pageContext.request.contextPath}/relation"><li>关联图谱调试</li></a>
    		</ul>
    	</div>
    </div>  
    <!-- 内容 --> 
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
    	<div class="layui-tab">
		  <ul class="layui-tab-title">
		    <li class="layui-this">公司名称建模</li>
		    <li>管理人名建模</li>
		    <li>关系词建模</li>
		    <li>停用词建模</li>
		  </ul>
		  <div class="layui-tab-content">
		  	<!-- 公司名称建模 -->
		    <div class="layui-tab-item layui-show">
		    	<div>
		  			<table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>公司全称：</span></td>
		  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="company_all"></td>
		  					<td style="text-align: right;">
		  					<input class="btn btn-success radius" type="button" value="导入excel"  onclick="add_popup('文件上传','${pageContext.request.contextPath}/upload','510','400')"/>
		  					</td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>公司简称：</span></td>
		  					<td style="width:450px;"><textarea class="textarea"  id="company_short"></textarea></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" style="margin-top: 20px;" type="button" onclick="company_model_cli()" value="提交">
		  					</td>
		  				</tr>
		  				<tr>
		  					<td></td>
		  					<td style="width:450px;"></td>
<!-- 		  					<td style="text-align: right;"><span>公司名查询：</span></td> -->
<!-- 		  					<td style="width:450px;"><input type="text" id="company_one" class="input-text size-M"></td> -->
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="check_company()" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  			
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
					<table class="select_industry_table"  id="inserttable">
		             </table>
					<div class="page clearfix" id="wd"></div>
				</div>
				<!--静态包含-->  
		    </div>
		    <!-- 管理人名建模 -->
		    <div class="layui-tab-item">
		    	<div>
		  			<table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>管理人名：</span></td>
		  					<td style="width:450px;"><textarea class="textarea"  id="managercontent"></textarea></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" value="导入excel"  onclick="add_popup('文件上传','${pageContext.request.contextPath}/upload','510','400')"/><br><input class="btn btn-success radius" style="margin-top: 20px;" type="button" onclick="company_model_guanli()" value="提交"></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>管理人名查询：</span></td>
		  					<td style="width:450px;"><input type="text" class="input-text size-M" id="company_one_M"></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="check_company_M(1)" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
		  			<table class="select_industry_table"  id="inserttable_M">
		             </table>
					<div class="page clearfix" id="wd_M"></div>
		  		</div>
		  		<!--静态包含-->  
		    </div>
		    <!-- 关系词建模 -->
		    <div class="layui-tab-item">
		    	<div>
		    	  <table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>元词：</span></td>
		  					<td style="width:450px;"><textarea class="textarea" id="relateContent"></textarea></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>转换词：</span></td>
		  					<td style="width:450px;"><textarea class="textarea" id="convertContent"></textarea></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;">关系词属性：</td>
		  					<td style="width:450px;">
		  						  <input type="text" class="input-text size-M"  value="nt" id="nature">
		  					</td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" value="导入excel"  onclick="add_popup('文件上传','${pageContext.request.contextPath}/upload','510','400')"/><br><input class="btn btn-success radius" style="margin-top: 20px;" type="button" onclick="company_model_guanxi()" value="提交"></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>关系词查询：</span></td>
		  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="company_one_R"></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="check_company_R(1)" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
		  			<table class="select_industry_table"  id="inserttable_R">
		             </table>
					<div class="page clearfix" id="wd_R"></div>
		  		</div>
		  		<!--静态包含-->  
		    </div>
		    <!-- 停用词建模 -->
		    <div class="layui-tab-item">
		    	<div>
		  			<table class="table0">
		  				<tr>
		  					<td style="text-align: right;"><span>停用词：</span></td>
		  					<td style="width:450px;"><textarea class="textarea" id="stopContent"></textarea></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>停用词类型：</span></td>
		  					<td style="width:450px;">
								      包含停用词<input type="radio" name="wordType" value="1" title="包含停用词" checked="checked">
								     后缀停用词 <input type="radio" name="wordType" value="2" title="后缀停用词">
								     干扰词 <input type="radio" name="wordType" value="3" title="干扰词">
							</td>
		  				   <td style="text-align: right;"><input class="btn btn-success radius" type="button" value="导入excel"  onclick="add_popup('文件上传','${pageContext.request.contextPath}/upload','510','400')"/><br><input class="btn btn-success radius" style="margin-top: 20px;" type="button" onclick="company_model_stop()" value="提交"></td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: right;"><span>停用词查询：</span></td>
		  					<td style="width:450px;"><input type="text" class="input-text size-M" id="company_one_T"></td>
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="check_company_T(1)" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
		  			<table class="select_industry_table"  id="inserttable_T">
		             </table>
					<div class="page clearfix" id="wd_T"></div>
		  		</div>
		  		<!--静态包含-->  
		    </div>
		  </div>
		</div>

<script type="text/javascript">

$(function(){
	
	
	  //tab切换
	layui.use('element', function(){
		  var $ = layui.jquery
		  ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块
		  
		  //触发事件
		  var active = {
		    tabAdd: function(){
		      //新增一个Tab项
		      element.tabAdd('demo', {
		        title: '新选项'+ (Math.random()*1000|0) //用于演示
		        ,content: '内容'+ (Math.random()*1000|0)
		        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
		      })
		    }
		    ,tabDelete: function(othis){
		      //删除指定Tab项
		      element.tabDelete('demo', '44'); //删除：“商品管理”
		      
		      
		      othis.addClass('layui-btn-disabled');
		    }
		    ,tabChange: function(){
		      //切换到指定Tab项
		      element.tabChange('demo', '22'); //切换到：用户管理
		    }
		  };
		  
		  $('.site-demo-active').on('click', function(){
		    var othis = $(this), type = othis.data('type');
		    active[type] ? active[type].call(this, othis) : '';
		  });
		  
		  //Hash地址的定位
		  var layid = location.hash.replace(/^#test=/, '');
		  element.tabChange('test', layid);
		  
		  element.on('tab(test)', function(elem){
		    location.hash = 'test='+ $(this).attr('lay-id');
		  });
		  
		});
	//默认加载全部公司名称
	showProjectInfo(1);
	
});

//弹窗
function add_popup(title,url,w,h){
    layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url
	});
}
//公司名称建模提交
function company_model_cli(){
	var company_all=$("#company_all").val();
	var company_short=$("#company_short").val();
	if(company_all == "" || company_short == ""){
		layer.msg("不能为空！", {icon: 10, time: 1000});
		return false;
	}
	 $.ajax({  
		 data:{
			 company_all:company_all,
			 company_short:company_short
		 },
	    type : "POST",
         url:"${pageContext.request.contextPath}/anaysis/insertcompany",  
         success:function(e){  
        	if(e > 0){
        		layer.msg("提交成功！", {icon: 10, time: 1000});
        	}else if(e == -1){
        		layer.msg("重复数据！", {icon: 10, time: 1000});
        	}else{
        		layer.msg("操作错误！", {icon: 10, time: 1000});
        	}
         }  
     }); 
}	

//管理人名提交
function company_model_guanli(){
	var managerContent=$("#managercontent").val();
	if(managerContent == "" ){
		layer.msg("不能为空！", {icon: 10, time: 1000});
		return false;
	}
	 $.ajax({  
		 data:{
			 managerContent:managerContent
		 },
	    type : "POST",
         url:"${pageContext.request.contextPath}/anaysis/insertword",  
         success:function(e){  
        	if(e > 0){
        		layer.msg("提交成功！", {icon: 10, time: 1000});
        	}else if(e == -1){
        		layer.msg("重复数据！", {icon: 10, time: 1000});
        	}else{
        		layer.msg("操作错误！", {icon: 10, time: 1000});
        	}
         }  
     }); 
}	

//关系词提交
function company_model_guanxi(){
	var relateContent=$("#relateContent").val();
	var convertContent=$("#convertContent").val();
	var nature=$("#nature").val();
	if(relateContent == ""  || convertContent == "" || nature==""){
		layer.msg("不能为空！", {icon: 10, time: 1000});
		return false;
	}
	 $.ajax({  
		 data:{
			 relateContent:relateContent,
			 convertContent:convertContent,
			 relateType:nature
		 },
	    type : "POST",
         url:"${pageContext.request.contextPath}/anaysis/insertRelate",  
         success:function(e){  
        	if(e > 0){
        		layer.msg("提交成功！", {icon: 10, time: 1000});
        	}else if(e == -1){
        		layer.msg("重复数据！", {icon: 10, time: 1000});
        	}else{
        		layer.msg("操作错误！", {icon: 10, time: 1000});
        	}
         }  
     }); 
}	

//停用词提交
function company_model_stop(){
	var stopContent=$("#stopContent").val();
	var stopType=$('.table0 input[name="wordType"]:checked ').val();
	if(stopContent == "" ||stopType=="" ){
		layer.msg("不能为空！", {icon: 10, time: 1000});
		return false;
	}
	 $.ajax({  
		 data:{
			 stopContent:stopContent,
			 stopType:stopType
		 },
	    type : "POST",
         url:"${pageContext.request.contextPath}/anaysis/insertStop",  
         success:function(e){  
        	if(e > 0){
        		layer.msg("提交成功！", {icon: 10, time: 1000});
        	}else if(e == -1){
        		layer.msg("重复数据！", {icon: 10, time: 1000});
        	}else{
        		layer.msg("操作错误！", {icon: 10, time: 1000});
        	}
         }  
     }); 
}
//查询公司名按钮
function check_company(){
	showProjectInfo(1);
}

//公司名称简称  全称模糊查
function showProjectInfo(page){
	var company_one=$("#company_all").val();
	var page=page;
	var pageSize=10;
	$.ajax({
	    type: 'POST',
	    url : "${pageContext.request.contextPath}/anaysis/searchCompany",
	    data:{page:page,pageSize:pageSize,searchCompany:company_one},
	    success: function(data){
	    	formatProjectInfoForTable(data);
	    },
	    error: function(){
	    	alert("查询失败");
	    }
	});
	function formatProjectInfoForTable(data){
		if(data.total!=0){
			var content="<tr style='border-bottom:1px solid #919191;'><td>公司简称</td><td>公司全称</td><td>有效状态</td><td>创建时间</td></tr>";
			for(var i=0;i<data.data.length;i++){
				var row=data.data[i];
				content+="<tr>";
				content+="<td>"+row['shortName']+"</td>";
				content+="<td>"+row['fullName']+"</td>";
				if(row['validFlg'] == 1){
					content+="<td>有效</td>";
				}else{
					content+="<td>无效</td>";
				}
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
//管理人名查询
function check_company_M(page){
	var company_one=$("#company_one_M").val();
	var page=page;
	var pageSize=10;
	$.ajax({
	    type: 'POST',
	    url : "${pageContext.request.contextPath}/anaysis/search_M",
	    data:{page:page,pageSize:pageSize,search_one_M:company_one},
	    success: function(data){
	    	formatProjectInfoForTable_M(data);
	    },
	    error: function(){
	    	alert("查询失败");
	    }
	});
	function formatProjectInfoForTable_M(data){
		if(data.total!=0){
			var content="<tr style='border-bottom:1px solid #919191;'><td>人名</td><td>有效状态</td><td>创建时间</td></tr>";
			for(var i=0;i<data.data.length;i++){
				var row=data.data[i];
				content+="<tr>";
				content+="<td>"+row['name']+"</td>";
				if(row['validFlg'] == 1){
					content+="<td>有效</td>";
				}else{
					content+="<td>无效</td>";
				}
				content+="<td>"+row['createTime']+"</td>";
				content+="</tr>";
			}
            $(".select_industry_table").attr("style","border-bottom:1px solid #919191;");
			//填充到页面
			$('#inserttable_M').html(content);
			//更改分页
			showPageStyle2("#wd_M",page,data.total,10,10,check_company_M);
		}else{
			layer.msg("没有结果！", {icon: 10, time: 1000});
		}
	}
}

//关系词建模
function check_company_R(page){
	var company_one=$("#company_one_R").val();
	var page=page;
	var pageSize=10;
	$.ajax({
	    type: 'POST',
	    url : "${pageContext.request.contextPath}/anaysis/search_R",
	    data:{page:page,pageSize:pageSize,search_one_R:company_one},
	    success: function(data){
	    	formatProjectInfoForTable_R(data);
	    },
	    error: function(){
	    	alert("查询失败");
	    }
	});
	function formatProjectInfoForTable_R(data){
		if(data.total!=0){
			var content="<tr style='border-bottom:1px solid #919191;'><td>元词</td><td>转换词</td><td>词性</td><td>有效状态</td><td>创建时间</td></tr>";
			for(var i=0;i<data.data.length;i++){
				var row=data.data[i];
				content+="<tr>";
				content+="<td>"+row['realWord']+"</td>";
				content+="<td>"+row['convertWord']+"</td>";
				content+="<td>"+row['wordNature']+"</td>";
				if(row['validFlg'] == 1){
					content+="<td>有效</td>";
				}else{
					content+="<td>无效</td>";
				}
				content+="<td>"+row['createTime']+"</td>";
				content+="</tr>";
			}
            $(".select_industry_table").attr("style","border-bottom:1px solid #919191;");
			//填充到页面
			$('#inserttable_R').html(content);
			//更改分页
			showPageStyle2("#wd_R",page,data.total,10,10,check_company_R);
		}else{
			layer.msg("没有结果！", {icon: 10, time: 1000});
		}
	}
}

//停用词建模搜索
function check_company_T(page){
	var company_one=$("#company_one_T").val();
	var page=page;
	var pageSize=10;
	$.ajax({
	    type: 'POST',
	    url : "${pageContext.request.contextPath}/anaysis/search_T",
	    data:{page:page,pageSize:pageSize,search_one_T:company_one},
	    success: function(data){
	    	formatProjectInfoForTable_T(data);
	    },
	    error: function(){
	    	alert("查询失败");
	    }
	});
	function formatProjectInfoForTable_T(data){
		if(data.total!=0){
			var content="<tr style='border-bottom:1px solid #919191;'><td>停用词</td><td>词性</td><td>有效状态</td><td>创建时间</td></tr>";
			for(var i=0;i<data.data.length;i++){
				var row=data.data[i];
				content+="<tr>";
				content+="<td>"+row['word']+"</td>";
// 				content+="<td>"+row['wordType']+"</td>";
				switch(row['wordType']){
				case 1:content+="<td>包含停用词</td>";break;
				case 2:content+="<td>后缀停用词</td>";break;
				case 3:content+="<td>干扰词</td>";break;
				}
				switch(row['validFlg']){
				case 1:content+="<td>有效</td>";break;
				case 2:content+="<td>无效</td>";break;
				}
				content+="<td>"+row['createTime']+"</td>";
				content+="</tr>";
			}
            $(".select_industry_table").attr("style","border-bottom:1px solid #919191;");
			//填充到页面
			$('#inserttable_T').html(content);
			//更改分页
			showPageStyle2("#wd_T",page,data.total,10,10,check_company_T);
		}else{
			layer.msg("没有结果！", {icon: 10, time: 1000});
		}
	}
}


</script>
</html>