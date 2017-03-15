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
	 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/webuploader/0.1.5/webuploader.css">   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/webuploader/0.1.5/style_cj.css">   
    
    <script type="text/javascript">
    $(function(){
    	//首先创建Web Uploader实例
    	var uploader = WebUploader.create({ 
    		 auto: true, // 选完文件后，是否自动上传 
    		 swf: 'js/Uploader.swf', // swf文件路径 
    		 server: '${pageContext.request.contextPath}/anaysis/uploadToRelation', // 文件接收服务端 
    		 pick: '#imgPicker', // 选择文件的按钮。可选 
    		 // 只允许选择图片文件。 
    		 accept: { 
    		 title: 'Images', 
    		 extensions: 'gif,jpg,jpeg,bmp,png,xlsx,doc', 
    		 mimeTypes: 'image/*'
    		 } 
    		});
    	
   
    	
    	//接着监听fileQueued事件，即当有文件添加进来的时候，通过uploader.makeThumb来创建图片预览图
    uploader.on( 'fileQueued', function( file ) { 
    	 var $list = $("#fileList"), 
    	 $li = $( 
    	 '<div id="' + file.id + '" class="file-item thumbnail">' + 
    	 '<img>' + 
    	 '<div class="info">' + file.name + '</div>' + 
    	 '</div>'
    	 ), 
    	 $img = $li.find('img'); 
    	 // $list为容器jQuery实例 
    	 $list.append( $li ); 
    	 // 创建缩略图 
    	 uploader.makeThumb( file, function( error, src ) { 
    	 if ( error ) { 
    	 $img.replaceWith('<span>不能预览</span>'); 
    	 return; 
    	 } 
    	  
    	 $img.attr( 'src', src ); 
    	 }, 100, 100 ); //100x100为缩略图尺寸 
    	});
    	
 // 文件上传过程中创建进度条实时显示。 
    uploader.on( 'uploadProgress', function( file, percentage ) { 
     var $li = $( '#'+file.id ), 
     $percent = $li.find('.progress span'); 
      
     // 避免重复创建 
     if ( !$percent.length ) { 
     $percent = $('<p class="progress"><span></span></p>') 
     .appendTo( $li ) 
     .find('span'); 
     } 
      
     $percent.css( 'width', percentage * 100 + '%' ); 
    }); 
      
    // 文件上传成功，给item添加成功class, 用样式标记上传成功。 
    uploader.on( 'uploadSuccess', function( file, res ) { 
     console.log(res.filePath);//这里可以得到上传后的文件路径 
     $( '#'+file.id ).addClass('upload-state-done'); 
    }); 
      
    // 文件上传失败，显示上传出错。 
    uploader.on( 'uploadError', function( file ) { 
     var $li = $( '#'+file.id ), 
     $error = $li.find('div.error'); 
      
     // 避免重复创建 
     if ( !$error.length ) { 
     $error = $('<div class="error"></div>').appendTo( $li ); 
     } 
      
     $error.text('上传失败'); 
    }); 
      
    // 完成上传完了，成功或者失败，先删除进度条。 
    uploader.on( 'uploadComplete', function( file ) { 
     $( '#'+file.id ).find('.progress').remove(); 
    });
    
    });
    
  //导入多元组表达式
    function importExcelMultiTuple(){
    	var file=$('#multiTuplefile').val();
    	var selectType=$("#selectType option:selected").val();
    	$("#selectTypeId").val(selectType);
    	if(file==null||file.length==0){
    		layer.msg("选择xls或xlsx文件！", {icon: 10, time: 1000});
    		return;
    	}
    	$("#uploadMultiTupleForm").ajaxForm({
    		dataType:'text',
    	   	type : "POST", 
//     	   	contentType: "application/x-www-form-urlencoded; charset=utf-8", 
    		success: function(data){
    			if(data>0){
    				layer.msg("上传成功", {icon: 10, time: 1000});
    			}else if(data==-1){
    				layer.msg("上传文件流为空", {icon: 10, time: 1000});
    			}else if(data==0){
    				layer.msg("重复操作", {icon: 10, time: 1000});
    			}else if(data==-3){
    				layer.msg(".xls或者xlsx文件才可以上传", {icon: 10, time: 1000});
    			}else{
    				layer.msg("上传失败", {icon: 10, time: 1000});
    			}
//     			var index = parent.layer.getFrameIndex(window.name);
//     			parent.layer.close(index);
    		},
    		error: function(data){
    		}
    	});
    	$("#uploadMultiTupleForm").submit();
    }
    </script>
</head>
<body>

<!-- <div id="uploadimg">  -->
<!--  <div id="fileList" class="uploader-list"></div>  -->
<!--  <div id="imgPicker">选择图片</div>  -->
<!-- </div> -->
			<form id="uploadMultiTupleForm" action="${pageContext.request.contextPath}/anaysis/uploadToRelation" method="post" enctype="multipart/form-data">
					<input  type="hidden" id="selectTypeId" name="selectTypeId">
					<input type="file" id="multiTuplefile"  name="file" >
			</form>
			<div>
			<select  id="selectType" class="btn btn-success radius">
				<option value="1">公司名称建模</option>
				<option value="2">管理人名建模</option>
				<option value="3">关系词建模</option>
				<option value="4">停用词建模</option>
			</select>
			<input class="btn btn-success radius" type="button" style="margin:20px 20px 20px 20px;" value="上传"  onclick="importExcelMultiTuple()"/>
			</div>
</body>
</html>
