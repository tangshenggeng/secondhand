<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>遇您识货后台</title>

    <!-- Bootstrap Core CSS -->
    <link href="${PATH}/static/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${PATH}/static/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${PATH}/static/admin/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${PATH}/static/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="${PATH}/static/layui/css/layui.css" rel="stylesheet">
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
</style>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
       <!-- 引入导航及头部 -->
 		<%@ include file="/WEB-INF/view/common/header.jsp" %>
        <div id="page-wrapper">

            <div class="container-fluid"  style="margin-top: 60px">
				<ol class="breadcrumb" >
                    <li>主页</li>
                    <li class="active">添加品牌</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-6 col-md-offset-3">
						<div class="layui-form-item"  style="margin-top: 50px">
						    <label class="layui-form-label">图片</label>
						    <div class="layui-input-block">
						       <div class="layui-upload">
								  <button type="button" class="layui-btn" id="uploadFoodImg">选择图片</button>
								  <div class="layui-upload-list">
								    <img class="layui-upload-img" style="width: 100px;height: 100px;" id="previewImg">
								    <p id="demoText"></p>
								  </div>
								</div>
						    </div>
						  </div>
						<form class="layui-form" style="margin-bottom: 100px">
							<input type="hidden" name="brandLogo" id="brand_img">
							<div class="layui-form-item">
								<label class="layui-form-label">品牌名</label>
								<div class="layui-input-block">
									<input type="text" name="brandName" required
										lay-verify="required" placeholder="请输入品牌名"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">权重</label>
								<div class="layui-input-block">
									<input type="number" name="brandWeight" required
										lay-verify="required" placeholder="请输入"
										id="regiterEmailInput" autocomplete="off"
										class="layui-input">
								</div>
							  </div>
							<div class="layui-form-item">
								<label class="layui-form-label">介绍</label>
								<div class="layui-input-block">
									<textarea name="brandIntroduce" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">状态</label>
								<div class="layui-input-block">
									<input type="checkbox" name="isShow" lay-skin="switch" value="展示" lay-text="展示|隐藏" checked>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="*">添加</button>
									<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
                <!-- /.row -->

            </div>

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${PATH}/static/js/jquery2.0-min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${PATH}/static/admin/js/bootstrap.min.js"></script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="${PATH}/static/admin/js/plugins/morris/raphael.min.js"></script>

</body>
	<script type="text/javascript">
	layui.use(['layer', 'form'], function(){
		  var layer = layui.layer
		  ,form = layui.form;
		  var brand_img = $("#brand_img").val()
		  form.on('submit(*)', function(data){
			  if(brand_img==""){
				  layer.msg("请选择品牌LOGO",{icon:5})
				  return false;
			  }
			  $.ajax({
				  url:"${PATH}/brand/addBrand",
				  method:"POST",
				  contentType: "application/json",//必须指定，否则会报415错误
			      dataType : 'json',
			      data : JSON.stringify(data.field),//序列化复杂对象
				  success:function(res){
					  console.log(res)
					  if(res.code == 100 ){
						  layer.msg(res.extend.msg,{icon:6},function(){
							  $("#resetForm").click();
						  })
					  }else{
						  layer.msg(res.extend.msg,{icon:5},function(){
							  $("#resetForm").click();
						  })
					  }
				  },error:function(){
					  layer.msg("系统错误！",{icon:5},function(){
						  $("#resetForm").click();
					  })
				  }
			  });
			  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
	layui.use(['upload','layer','form'], function(){
		 var $ = layui.jquery
		 ,upload = layui.upload
		 ,layer = layui.layer
		 ,form = layui.form;
		 var uploadInst = upload.render({
		    elem: '#uploadFoodImg'
		    ,url: '${PATH}/brand/uploadBrandImg'
		    ,accept:"images"	//指定允许上传时校验的文件类型
		    ,exts:'jpg|png|gif|bmp|jpeg'
		    ,acceptMime:'image/*' //规定打开文件选择框时，筛选出的文件类型
		    ,size:1024	//设置文件最大可允许上传的大小，单位 KB。
		    ,field:"file"
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#previewImg').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg(res.msg,{icon:6});
		      }
		      //上传成功
		      $("#brand_img").val(res.data);
		      return layer.msg(res.msg,{icon:6});
		      
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
	})
	
	
	</script>

</html>
