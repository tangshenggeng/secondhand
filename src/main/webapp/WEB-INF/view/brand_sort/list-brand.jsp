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
<style type="text/css">
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
                    <li class="active">品牌列表</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<form class="layui-form" id="kwCustForm">
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="kwWords" placeholder="关键字" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                            	<select name="isShow">
							        <option value="0">---请选择---</option>
							        <option value="展示">展示</option>
							        <option value="隐藏">隐藏</option>
							      </select>
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <button class="layui-btn" type="button" id="kwFormBtn"><i class="layui-icon layui-icon-search"></i></button>
                            </div>
                            <div class="layui-inline layui-show-xs-block">
 								<button class="layui-btn" type="reset" ><i class="layui-icon layui-icon-refresh"></i></button>                               
                            </div>
						</form>
					</div>
					<div class="col-lg-12">
					<br>
						<button class="layui-btn layui-btn-danger" type="button" id="delByIds"><i class="layui-icon layui-icon-delete"> 删除</i></button>
						<button class="layui-btn layui-btn-normal" type="button" id="showBrandsBtn"><i class="glyphicon glyphicon-eye-open"> 展示</i></button>
						<button class="layui-btn layui-btn-normal" type="button" id="hideBrandsBtn"><i class="glyphicon glyphicon-eye-close"> 隐藏</i></button>
						<table id="custListTb"
							class="table table-responsive table-hover"
							lay-filter="brandListTbFilter">
		
						</table>
					</div>
				</div>
                <!-- /.row -->

            </div>

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- 模态框 -->
<div style="display: none;" id="detailBrandModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<div>
					<img alt="logo" id="brandLogo">
				</div>
			</div>
			<div class="layui-card-body" >
				<h3>品牌介绍：</h3>
				<div id="brandIntroduceDiv"></div>
			</div>
			
		</div>
	</div>
<div style="display: none;" id="editBrandModal">
		<div class="layui-form-item"  style="margin-top: 10px">
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
		<form class="layui-form" style="margin-bottom: 20px">
			<input type="hidden" name="brandLogo" id="brand_img">
			<input type="hidden" name="brandId" id="brandIdModal">
			<div class="layui-form-item">
				<label class="layui-form-label">品牌名</label>
				<div class="layui-input-block">
					<input type="text" id="brandNameModal" name="brandName" required
						lay-verify="required" placeholder="请输入品牌名"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权重</label>
				<div class="layui-input-block">
					<input type="number" name="brandWeight" id="brandWeightModal" required
						lay-verify="required" placeholder="请输入"
						id="regiterEmailInput" autocomplete="off"
						class="layui-input">
				</div>
			  </div>
			<div class="layui-form-item">
				<label class="layui-form-label">介绍</label>
				<div class="layui-input-block">
					<textarea name="brandIntroduce" id="brandIntroduceModal" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*">修改</button>
				</div>
			</div>
		</form>
	</div>
    <!-- jQuery -->
    <script src="${PATH}/static/js/jquery2.0-min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${PATH}/static/admin/js/bootstrap.min.js"></script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="${PATH}/static/admin/js/plugins/morris/raphael.min.js"></script>

</body>
	<script type="text/javascript">
	$(function() {
		renderTb();
	});
	function renderTb() {
		var data = $("#kwCustForm").serializeArray();
		layui.use(['table','util'], function() {
			var table = layui.table
			,util = layui.util;
			//第一个实例
			table.render({
				elem : '#custListTb',
				height : 500,
				url : '${PATH}/brand/getBrandList',
				text : {
					none : '未找到品牌'
				},
				id:"listTbId",
				skin : 'line' ,
				contentType: "application/json",//必须指定，否则会报415错误
			    dataType : 'json',
				method:"POST",
				page : true //开启分页
				,
				where : {
					kwdata : data
				},
				cols : [ [ //表头
				{
					field : 'brandId',
					title : '#',
					type:"checkbox",
					align : "center"
				}, {
					field : 'brandNumber',
					title : '唯一标识',
					align : "center"
				}, {
					field : 'brandName',
					title : '品牌名',
					align : "center"
				},{
					field : 'brandLogo',
					title : 'LOGO',
					align : "center",
					templet: function(d){
				        return '<img alt="LOGO" style="width: 30px;height: 30px"  src="'+d.brandLogo+'">'
				    }
				},{
					field : 'brandWeight',
					title : '权重',
					align : "center",
					sort:true
				},{
					field : 'isShow',
					title : '状态',
					style:"color: orange;",
					align : "center",
				},{
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					align : "center"
				}]],
				parseData : function(res) { //res 即为原始返回的数据
					console.log(res)
					return {
						"code" : res.status, //解析接口状态
						"msg" : res.message, //解析提示文本
						"count" : res.total, //解析数据长度
						"data" : res.data
					//解析数据列表
					};
				}
			});
			table.on('tool(brandListTbFilter)', function(obj) { 
				var data = obj.data; //获得当前行数据
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				if (layEvent === 'detail') { //查看
					$("#brandIntroduceDiv").html(data.brandIntroduce);
					$("#brandLogo").attr("src",data.brandLogo);
					var index = layer.open({
						title : '品牌信息',
						fix : true,
						resize : false,
						move : false,
						area: ['800px','530px'],
						zIndex : 500,
						shadeClose : true,
						shade : 0.4,
						type : 1,
						anim: 3,
						content : $('#detailBrandModal')
					});
				}else if(layEvent === 'edit'){
					$('#previewImg').attr('src', data.brandLogo);
					$("#brandIdModal").val(data.brandId)
					$("#brand_img").val(data.brandLogo)
					$("#brandNameModal").val(data.brandName)
					$("#brandWeightModal").val(data.brandWeight)
					$("#brandIntroduceModal").val(data.brandIntroduce)
					var index = layer.open({
						title : '修改信息',
						fix : true,
						resize : false,
						move : false,
						area: ['800px','530px'],
						zIndex : 500,
						shadeClose : true,
						shade : 0.4,
						type : 1,
						anim: 3,
						content : $('#editBrandModal')
					});
				}
			});
		});
	}
	//筛选
	$("#kwFormBtn").click(function(){
		renderTb();
	});
	//批量删除
	$("#delByIds").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('真的删除行吗？无法恢复的！', function(index){
				var checkStatus = table.checkStatus('listTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].brandId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/brand/delBrandsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
						console.log(res)
						if(res.code == 100){
							layer.msg(res.extend.msg,{icon:6},function(){
								renderTb();
							});
						}else{
							layer.msg(res.extend.msg,{icon:5},function(){
								renderTb();
							});
						}
					},error:function(){
						layer.msg("系统错误！",{icon:5},function(){
							renderTb();
						});
					}
				});	
			  layer.close(index);
			});
		});
	})
	//批量展示
	$("#showBrandsBtn").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('确认展示选中的品牌吗？', function(index){
				var checkStatus = table.checkStatus('listTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].brandId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/brand/showBrandsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
						console.log(res)
						if(res.code == 100){
							layer.msg(res.extend.msg,{icon:6},function(){
								renderTb();
							});
						}else{
							layer.msg(res.extend.msg,{icon:5},function(){
								renderTb();
							});
						}
					},error:function(){
						layer.msg("系统错误！",{icon:5},function(){
							renderTb();
						});
					}
				});	
			  layer.close(index);
			});
		});
	})
	//批量隐藏
	$("#hideBrandsBtn").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('确认隐藏选中的品牌吗？', function(index){
				var checkStatus = table.checkStatus('listTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].brandId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/brand/hideBrandsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
						console.log(res)
						if(res.code == 100){
							layer.msg(res.extend.msg,{icon:6},function(){
								renderTb();
							});
						}else{
							layer.msg(res.extend.msg,{icon:5},function(){
								renderTb();
							});
						}
					},error:function(){
						layer.msg("系统错误！",{icon:5},function(){
							renderTb();
						});
					}
				});	
			  layer.close(index);
			});
		});
	})
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
	layui.use(['layer', 'form'], function(){
		  var layer = layui.layer
		  ,form = layui.form;
		  form.on('submit(*)', function(data){
			  if(data.field.brandLogo==""){
				  layer.msg("请选择品牌LOGO",{icon:5})
				  return false;
			  }
			  $.ajax({
				  url:"${PATH}/brand/editBrand",
				  method:"POST",
				  contentType: "application/json",//必须指定，否则会报415错误
			      dataType : 'json',
			      data : JSON.stringify(data.field),//序列化复杂对象
				  success:function(res){
					  console.log(res)
					  if(res.code == 100 ){
						  layer.msg(res.extend.msg,{icon:6},function(){
							  renderTb();
							 layer.closeAll()
						  })
					  }else{
						  layer.msg(res.extend.msg,{icon:5})
					  }
				  },error:function(){
					  layer.msg("系统错误！",{icon:5},function(){
						  renderTb();
						  layer.closeAll()
					  })
				  }
			  });
			  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
	</script>
<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="layui-btn layui-btn-xs" lay-event="detail">查看</button>
<button type="button" class="layui-btn layui-btn-xs   layui-btn-warm" lay-event="edit">编辑</button>
</div>
</script>
</html>
