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
                    <li class="active">分类管理</li>
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
						<button class="layui-btn layui-btn-normal" type="button" id="showSortsBtn"><i class="glyphicon glyphicon-eye-open"> 展示</i></button>
						<button class="layui-btn layui-btn-normal" type="button" id="hideSortsBtn"><i class="glyphicon glyphicon-eye-close"> 隐藏</i></button>
						<button class="layui-btn" type="button" id="addSortBtn"><i class="glyphicon glyphicon-plus"> 隐藏</i></button>
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
<div style="display: none;" id="addSortModal">
		<form class="layui-form" style="margin: 20px 50px">
			<div class="layui-form-item">
				<label class="layui-form-label">分类名</label>
				<div class="layui-input-block">
					<input type="text"name="sortName" required
						lay-verify="required" placeholder="请输入"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">权重</label>
				<div class="layui-input-block">
					<input type="number" name="sortWeight" required
						lay-verify="required" placeholder="请输入" id="regiterEmailInput"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-block">
					<input type="checkbox" name="isShow" lay-skin="switch" value="展示"
						lay-text="展示|隐藏" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="*">添加</button>
					<button class="layui-btn layui-btn-primary" type="reset" id="resetModal">重置</button>
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
				url : '${PATH}/sort/getSortsList',
				text : {
					none : '未找到分类'
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
					field : 'sortId',
					title : '#',
					type:"checkbox",
					align : "center"
				},{
					field : 'sortName',
					title : '分类名',
					align : "center"
				},{
					field : 'sortWeight',
					title : '权重',
					align : "center",
					sort:true
				},{
					field : 'isShow',
					title : '状态',
					style:"color: orange;",
					align : "center",
				}]],
				parseData : function(res) { //res 即为原始返回的数据
					return {
						"code" : res.status, //解析接口状态
						"msg" : res.message, //解析提示文本
						"count" : res.total, //解析数据长度
						"data" : res.data
					//解析数据列表
					};
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
					ids.push($(this)[0].sortId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/sort/delSortsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
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
	$("#showSortsBtn").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('确认展示选中的分类吗？', function(index){
				var checkStatus = table.checkStatus('listTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].sortId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/sort/showSortsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
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
	$("#hideSortsBtn").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('确认隐藏选中的分类吗？', function(index){
				var checkStatus = table.checkStatus('listTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].sortId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/sort/hideSortsByIds",
					method:"POST",
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					data:JSON.stringify(ids),
					success:function(res){
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
	$("#addSortBtn").click(function(){
		$("#resetModal").click()
		layui.use('layer', function() {
			var layer = layui.layer;
			var index = layer.open({
				title : '添加分类',
				fix : true,
				resize : false,
				move : false,
				area: ['800px','300px'],
				zIndex : 500,
				shadeClose : true,
				shade : 0.4,
				type : 1,
				anim: 2,
				content : $('#addSortModal')
			});
		})
	})
	layui.use(['layer', 'form'], function(){
		  var layer = layui.layer
		  ,form = layui.form;
		  form.on('submit(*)', function(data){
			  $.ajax({
				  url:"${PATH}/sort/addSort",
				  method:"POST",
				  contentType: "application/json",//必须指定，否则会报415错误
			      dataType : 'json',
			      data : JSON.stringify(data.field),//序列化复杂对象
				  success:function(res){
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
</html>
