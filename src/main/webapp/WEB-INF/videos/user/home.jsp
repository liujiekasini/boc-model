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
<script src="${pageContext.request.contextPath}/js/jquery-easyui1.4.1/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/webuploader/0.1.5/webuploader.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>  

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
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
   		<%@include file="head.jsp" %> 	 
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
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="check_company()" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  			
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
					<table class="dategrid"  id="inserttable">
		             </table>
				</div>
				 <%@include file="foot.jsp"%><!--静态包含-->  
		    </div>
			    <!-- 公司名称建模弹出框-->
			<div id="companydlg" class="easyui-dialog" style="width: 560px; height: 360px; padding: 5px;" closed="true"
				buttons="#dlg-buttons" modal="true">
				<input type="hidden"   id="company_id_dlg">
					<table class="table0" style="width: 520px;">
						<tr>
			  					<td style="text-align: right;"><span>公司全称：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="company_all_dlg"></td>
			  			</tr>
						<tr>
			  					<td style="text-align: right;"><span>公司简称：</span></td>
			  					<td style="width:450px;"><textarea class="textarea"  id="company_short_dlg"></textarea></td>
			  			</tr>
						<tr>
							<td style="text-align: right;"><span>有效状态：</span></td>
				  			<td style="width:450px;">有效<input type="radio" name="companyVliadFlg" id="companyVliadFlg_dlg" value="1">
										     无效<input type="radio" name="companyVliadFlg" id="companyVliadFlg_dlg2" value="2" >
						    </td>
			  			</tr>
			  			<tr>
			  				<td></td><td><input class="btn btn-success radius" type="button" onclick="update_company()" value="确认"></td>
			  			</tr>
					</table>
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
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="search_manager()" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
		             <table class="dategrid"  id="inserttable_M">
		             </table>
		  		</div>
		  		 <%@include file="foot.jsp"%><!--静态包含-->  
		    </div>
		      <!-- 管理人名模弹出框-->
			<div id="managerdlg" class="easyui-dialog" style="width: 560px; height: 360px; padding: 5px;" closed="true"
				buttons="#dlg-buttons" modal="true">
				<input type="hidden"   id="manager_id_dlg">
					<table class="table0" style="width: 520px;">
						<tr>
			  					<td style="text-align: right;"><span>人名：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="manager_name_dlg"></td>
			  			</tr>
						<tr>
							<td style="text-align: right;"><span>有效状态：</span></td>
				  			<td style="width:450px;">有效<input type="radio" name="managerVliadFlg" id="managerVliadFlg_dlg" value="1">
										     无效<input type="radio" name="managerVliadFlg" id="managerVliadFlg_dlg2" value="2" >
						    </td>
			  			</tr>
			  			<tr>
			  				<td></td><td><input class="btn btn-success radius" type="button" onclick="update_manager()" value="确认"></td>
			  			</tr>
					</table>
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
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="search_relate()" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
					 <table class="dategrid"  id="inserttable_R">
		             </table>
		  		</div>
		  		 <%@include file="foot.jsp"%><!--静态包含-->  
		    </div>
		      <!-- 关系词建模弹出框-->
			<div id="relatedlg" class="easyui-dialog" style="width: 560px; height: 360px; padding: 5px;" closed="true"
				buttons="#dlg-buttons" modal="true">
				<input type="hidden"   id="relate_id_dlg">
					<table class="table0" style="width: 520px;">
						<tr>
			  					<td style="text-align: right;"><span>元词：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="relate_word"></td>
			  			</tr>
						<tr>
			  					<td style="text-align: right;"><span>转换词：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="convert_word"></td>
			  			</tr>
						<tr>
			  					<td style="text-align: right;"><span>词性：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="word_nature"></td>
			  			</tr>
						<tr>
							<td style="text-align: right;"><span>有效状态：</span></td>
				  			<td style="width:450px;">有效<input type="radio" name="relateVliadFlg" id="relateVliadFlg_dlg" value="1">
										     无效<input type="radio" name="relateVliadFlg" id="relateVliadFlg_dlg2" value="2" >
						    </td>
			  			</tr>
			  			<tr>
			  				<td></td><td><input class="btn btn-success radius" type="button" onclick="update_relate()" value="确认"></td>
			  			</tr>
					</table>
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
		  					<td style="text-align: right;"><input class="btn btn-success radius" type="button" onclick="search_stop()" value="查询"></td>
		  				</tr>
		  				<tr></tr>
		  			</table>
		  		</div>
		  		<!-- 插入内容 -->
		  		<div>
<!-- 		  			<table class="select_industry_table"  id="inserttable_T"> -->
<!-- 		             </table> -->
<!-- 					<div class="page clearfix" id="wd_T"></div> -->

 						<table class="dategrid"  id="inserttable_T">
		          	   </table>	
		  		</div>
		  		 <%@include file="foot.jsp"%><!--静态包含-->  
		    </div>
		    <!-- 停用词建模弹出框 -->
		    <div id="stopdlg" class="easyui-dialog" style="width: 560px; height: 360px; padding: 5px;" closed="true"
				buttons="#dlg-buttons" modal="true">
				<input type="hidden"   id="stop_id_dlg">
					<table class="table0" style="width: 520px;">
						<tr>
			  					<td style="text-align: right;"><span>停用词：</span></td>
			  					<td style="width:450px;"><input type="text" class="input-text size-M"  id="stop_word"></td>
			  			</tr>
						<tr>
			  					<td style="text-align: right;"><span>停用词类型：</span></td>
				  			<td style="width:450px;">包含停用词<input type="radio" name="stopWordtype" id="stopWordtype" value="1">
										     后缀停用词<input type="radio" name="stopWordtype" id="stopWordtype2" value="2" >
										     干扰词<input type="radio" name="stopWordtype" id="stopWordtype3" value="3" >
						    </td>
			  			</tr>
						<tr>
							<td style="text-align: right;"><span>有效状态：</span></td>
				  			<td style="width:450px;">有效<input type="radio" name="stopVliadFlg" id="stopVliadFlg_dlg" value="1">
										     无效<input type="radio" name="stopVliadFlg" id="stopVliadFlg_dlg2" value="2" >
						    </td>
			  			</tr>
			  			<tr>
			  				<td></td><td><input class="btn btn-success radius" type="button" onclick="update_stop()" value="确认"></td>
			  			</tr>
					</table>
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
	  
// 	$("#inserttable").datagrid('reload',{searchCompany:$("#company_all").val()});
	var url='${pageContext.request.contextPath}/anaysis/searchCompany';
	var obj={};
	obj.searchCompany=$("#company_all").val();
		$("#inserttable").datagrid({
			url:url,
			queryParams:obj
		});
	
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
	$("#inserttable").datagrid('reload',{searchCompany:$("#company_all").val()});
}
	

//公司名称简称  全称模糊查
 $('#inserttable').datagrid({
		url:'',
		fitColumns:true,
		nowrap:false,//折行
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		method:'post',
		pageSize :10,
		pageList : [ 10, 20, 30, 40 ],
		frozenColumns : [ [ 
		{
		    width : 10,
			title : '',
			field : 'id',
			hidden:true
		},
		{
		    width : 180,
			title : '公司简称',
			field : 'shortName'
			
		},{
			width : 250,
			title : '公司全称',
			field : 'fullName'
		},{
			width : 180,
			title : ' 有效状态',
			field : 'validFlg',
			 formatter:function(value,row,index){
         	    if(value==2){
         	    	return '<font color=red>无效</font>';
         	    }
         	    if(value==1){
         	    	return '有效';
         	    }
			
		}  }
		] ],
		columns : [ [ {
			width : 250,
			title : '创建时间',
			field : 'createTime'
		}] ],
		 		onClickRow: function(rowIndex, rowData){
			},toolbar:[{
	        	 text:'修改',iconCls:'icon-edit',handler:function(){
	        		 var row =$("#inserttable").datagrid('getSelected');
	        		 if(row == null){
	        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
	        			 return;
	        		 }
	    	  		 $("#companydlg").dialog("open").dialog('setTitle', '修改面板');
	    	         $("#company_id_dlg").val(row.id);
	    	         $("#company_all_dlg").val(row.fullName);
	    	         $("#company_short_dlg").val(row.shortName);
	    	         if(row.validFlg == 1){
	    	         	$("#companyVliadFlg_dlg").prop("checked", true);
	    	         }else{
	    	        	 $("#companyVliadFlg_dlg2").prop("checked", true);
	    	         }
	    			}
	             },'-',{
	            	 text:'删除',iconCls:'icon-remove',handler:function(){
	            		 var row =$("#inserttable").datagrid('getSelected');
		        		 if(row == null){
		        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
		        			 return;
		        		 }
		        		 $.post('${pageContext.request.contextPath}/anaysis/removecompany', {
			  					id:row.id
			  				}, function(data) {
			  					if(data>0){
			  						layer.msg("删除成功", {icon: 10, time: 1000});
			  						$("#inserttable").datagrid('reload',{searchCompany:$("#company_all").val()});
			  					}else{
			  						layer.msg("操作失败", {icon: 10, time: 1000});
			  					}
			  				}, 'json');
	        			}
	                 }
	             ]
	  });
	  
//公司名称建模修改
function update_company(){
		 var id = $("#company_id_dlg").val();
    	 var shortName = $("#company_short_dlg").val();
    	 var fullName =  $("#company_all_dlg").val();
    	 var validFlg = $('.table0 input[name="companyVliadFlg"]:checked ').val();
	$.post('${pageContext.request.contextPath}/anaysis/udpatecompany',{id:id,shortName:shortName,fullName:fullName,validFlg:validFlg},function(data){
			if(data>0){
				layer.msg("修改成功", {icon: 10, time: 1000});
				$("#companydlg").dialog("close");
				$("#inserttable").datagrid('reload',{searchCompany:$("#company_all").val()});
			}else{
				layer.msg("操作失败", {icon: 10, time: 1000});
			}
	},'json');
}
function search_manager(){
	var url='${pageContext.request.contextPath}/anaysis/search_M';
	var obj={};
	obj.search_one_M=$("#company_one_M").val();
		$("#inserttable_M").datagrid({
			url:url,
			queryParams:obj
		});
}
	

//管理人名查询
 $('#inserttable_M').datagrid({
		url:'',
		fitColumns:true,
		nowrap:false,//折行
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		method:'post',
		pageSize :10,
		pageList : [ 10, 20, 30, 40 ],
		frozenColumns : [ [ 
		{
		    width : 10,
			title : '',
			field : 'id',
			hidden:true
		},{
			width : 250,
			title : '人名',
			field : 'name'
		},{
			width : 180,
			title : ' 有效状态',
			field : 'validFlg',
			 formatter:function(value,row,index){
         	    if(value==2){
         	    	return '<font color=red>无效</font>';
         	    }
         	    if(value==1){
         	    	return '有效';
         	    }
			
		}  }
		] ],
		columns : [ [ {
			width : 350,
			title : '创建时间',
			field : 'createTime'
		}] ],
		 		onClickRow: function(rowIndex, rowData){
			},toolbar:[{
	        	 text:'修改',iconCls:'icon-edit',handler:function(){
	        		 var row =$("#inserttable_M").datagrid('getSelected');
	        		 if(row == null){
	        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
	        			 return;
	        		 }
	    	  		 $("#managerdlg").dialog("open").dialog('setTitle', '修改面板');
	    	         $("#manager_id_dlg").val(row.id);
	    	         $("#manager_name_dlg").val(row.name);
	    	         if(row.validFlg == 1){
	    	         	$("#managerVliadFlg_dlg").prop("checked", true);
	    	         }else{
	    	        	 $("#managerVliadFlg_dlg2").prop("checked", true);
	    	         }
	    			}
	             },'-',{
	            	 text:'删除',iconCls:'icon-remove',handler:function(){
	            		 var row =$("#inserttable_M").datagrid('getSelected');
		        		 if(row == null){
		        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
		        			 return;
		        		 }
		        		 $.post('${pageContext.request.contextPath}/anaysis/removemanager', {
			  					id:row.id
			  				}, function(data) {
			  					if(data>0){
			  						layer.msg("删除成功", {icon: 10, time: 1000});
			  						$("#inserttable_M").datagrid('reload',{search_one_M:$("#company_one_M").val()});
			  					}else{
			  						layer.msg("操作失败", {icon: 10, time: 1000});
			  					}
			  				}, 'json');
	        			}
	                 }
	             ]
	  });
//公司名称建模修改
function update_manager(){
		 var id = $("#manager_id_dlg").val();
    	 var name = $("#manager_name_dlg").val();
    	 var validFlg = $('.table0 input[name="managerVliadFlg"]:checked ').val();
	$.post('${pageContext.request.contextPath}/anaysis/udpatemanager',{id:id,name:name,validFlg:validFlg},function(data){
			if(data>0){
				layer.msg("修改成功", {icon: 10, time: 1000});
				$("#managerdlg").dialog("close");
				$("#inserttable_M").datagrid('reload',{search_one_M:$("#company_one_M").val()});
			}else{
				layer.msg("操作失败", {icon: 10, time: 1000});
			}
	},'json');
}
//关系词查询
function search_relate(){
	var url='${pageContext.request.contextPath}/anaysis/search_R';
	var obj={};
	obj.search_one_R=$("#company_one_R").val();
		$("#inserttable_R").datagrid({
			url:url,
			queryParams:obj
		});
}
	

//管理人名查询
 $('#inserttable_R').datagrid({
		url:'',
		fitColumns:true,
		nowrap:false,//折行
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		method:'post',
		pageSize :10,
		pageList : [ 10, 20, 30, 40 ],
		frozenColumns : [ [ 
		{
		    width : 10,
			title : '',
			field : 'id',
			hidden:true
		},{
			width : 200,
			title : '元词',
			field : 'realWord'
		},{
			width : 200,
			title : '转换词',
			field : 'convertWord'
		},{
			width : 150,
			title : '词性',
			field : 'wordNature'
		},{
			width : 180,
			title : ' 有效状态',
			field : 'validFlg',
			 formatter:function(value,row,index){
         	    if(value==2){
         	    	return '<font color=red>无效</font>';
         	    }
         	    if(value==1){
         	    	return '有效';
         	    }
			
		}  }
		] ],
		columns : [ [ {
			width : 350,
			title : '创建时间',
			field : 'createTime'
		}] ],
		 		onClickRow: function(rowIndex, rowData){
			},toolbar:[{
	        	 text:'修改',iconCls:'icon-edit',handler:function(){
	        		 var row =$("#inserttable_R").datagrid('getSelected');
	        		 if(row == null){
	        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
	        			 return;
	        		 }
	    	  		 $("#relatedlg").dialog("open").dialog('setTitle', '修改面板');
	    	         $("#relate_id_dlg").val(row.id);
	    	         $("#relate_word").val(row.realWord);
	    	         $("#convert_word").val(row.convertWord);
	    	         $("#word_nature").val(row.wordNature);
	    	         if(row.validFlg == 1){
	    	         	$("#relateVliadFlg_dlg").prop("checked", true);
	    	         }else{
	    	        	 $("#relateVliadFlg_dlg2").prop("checked", true);
	    	         }
	    			}
	             },'-',{
	            	 text:'删除',iconCls:'icon-remove',handler:function(){
	            		 var row =$("#inserttable_R").datagrid('getSelected');
		        		 if(row == null){
		        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
		        			 return;
		        		 }
		        		 $.post('${pageContext.request.contextPath}/anaysis/removerelate', {
			  					id:row.id
			  				}, function(data) {
			  					if(data>0){
			  						layer.msg("删除成功", {icon: 10, time: 1000});
			  						$("#inserttable_R").datagrid('reload',{search_one_R:$("#company_one_R").val()});
			  					}else{
			  						layer.msg("操作失败", {icon: 10, time: 1000});
			  					}
			  				}, 'json');
	        			}
	                 }
	             ]
	  });
//公司名称建模修改
function update_relate(){
		 var id = $("#relate_id_dlg").val();
		 var realWord = $("#relate_word").val();
         var convertWord = $("#convert_word").val();
         var wordNature = $("#word_nature").val();
    	 var validFlg = $('.table0 input[name="relateVliadFlg"]:checked ').val();
	$.post('${pageContext.request.contextPath}/anaysis/udpaterelate',{id:id,realWord:realWord,convertWord:convertWord,wordNature:wordNature,validFlg:validFlg},function(data){
			if(data>0){
				layer.msg("修改成功", {icon: 10, time: 1000});
				$("#relatedlg").dialog("close");
				$("#inserttable_R").datagrid('reload',{search_one_R:$("#company_one_R").val()});
			}else{
				layer.msg("操作失败", {icon: 10, time: 1000});
			}
	},'json');
}

//停用词查询
function search_stop(){
		var obj={};
		obj.search_one_T=$("#company_one_T").val();
	$("#inserttable_T").datagrid({
		url:'${pageContext.request.contextPath}/anaysis/search_T',
		queryParams:obj
	});
// 	$("#inserttable_T").datagrid('reload',{search_one_T:$("#company_one_T").val()});
}
	

//管理人名查询
 $('#inserttable_T').datagrid({
		url:'',
		fitColumns:true,
		nowrap:false,//折行
		striped : true,
		rownumbers : true,
		pagination : true,
		singleSelect : true,
		method:'post',
		pageSize :10,
		pageList : [ 10, 20, 30, 40 ],
		frozenColumns : [ [ 
		{
		    width : 10,
			title : '',
			field : 'id',
			hidden:true
		},{
			width : 200,
			title : '停用词',
			field : 'word'
		},{
			width : 200,
			title : '停用词类型',
			field : 'wordType',
			 formatter:function(value,row,index){
	         	    if(value==1){
	         	    	return '包含停用词';
	         	    }
	         	    if(value==2){
	         	    	return '后缀停用词';
	         	    }
	         	   if(value==3){
	         	    	return '干扰词';
	         	    }
			}  
		},{
			width : 180,
			title : ' 有效状态',
			field : 'validFlg',
			 formatter:function(value,row,index){
         	    if(value==2){
         	    	return '<font color=red>无效</font>';
         	    }
         	    if(value==1){
         	    	return '有效';
         	    }
			
		}  }
		] ],
		columns : [ [ {
			width : 550,
			title : '创建时间',
			field : 'createTime'
		}] ],
		 		onClickRow: function(rowIndex, rowData){
			},toolbar:[{
	        	 text:'修改',iconCls:'icon-edit',handler:function(){
	        		 var row =$("#inserttable_T").datagrid('getSelected');
	        		 if(row == null){
	        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
	        			 return;
	        		 }
	    	  		 $("#stopdlg").dialog("open").dialog('setTitle', '修改面板');
	    	         $("#stop_id_dlg").val(row.id);
	    	         $("#stop_word").val(row.word);
	    	        if(row.wordType == 1){
	    	        	$("#stopWordtype").prop("checked", true);
	    	        }else if(row.wordType == 2){
	    	        	$("#stopWordtype2").prop("checked", true);
	    	        }else{
	    	        	$("#stopWordtype3").prop("checked", true);
	    	        }
	    	         if(row.validFlg == 1){
	    	         	$("#stopVliadFlg_dlg").prop("checked", true);
	    	         }else{
	    	        	 $("#stopVliadFlg_dlg2").prop("checked", true);
	    	         }
	    			}
	             },'-',{
	            	 text:'删除',iconCls:'icon-remove',handler:function(){
	            		 var row =$("#inserttable_T").datagrid('getSelected');
		        		 if(row == null){
		        			 layer.msg("选择一行数据进行操作", {icon: 10, time: 1000});
		        			 return;
		        		 }
		        		 $.post('${pageContext.request.contextPath}/anaysis/removestop', {
			  					id:row.id
			  				}, function(data) {
			  					if(data>0){
			  						layer.msg("删除成功", {icon: 10, time: 1000});
			  						$("#inserttable_T").datagrid('reload',{search_one_T:$("#company_one_T").val()});
			  					}else{
			  						layer.msg("操作失败", {icon: 10, time: 1000});
			  					}
			  				}, 'json');
	        			}
	                 }
	             ]
	  });
//公司名称建模修改
function update_stop(){
		 var id = $("#stop_id_dlg").val();
		 var word = $("#stop_word").val();
    	 var wordType = $('.table0 input[name="stopWordtype"]:checked ').val();
    	 var validFlg = $('.table0 input[name="stopVliadFlg"]:checked ').val();
	$.post('${pageContext.request.contextPath}/anaysis/udpatestop',{id:id,word:word,wordType:wordType,validFlg:validFlg},function(data){
			if(data>0){
				layer.msg("修改成功", {icon: 10, time: 1000});
				$("#stopdlg").dialog("close");
				$("#inserttable_T").datagrid('reload',{search_one_T:$("#company_one_T").val()});
			}else{
				layer.msg("操作失败", {icon: 10, time: 1000});
			}
	},'json');
}

</script>
</html>