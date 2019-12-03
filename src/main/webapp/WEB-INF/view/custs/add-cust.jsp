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
                    <li class="active">添加客户</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-6 col-md-offset-3">
						<form class="layui-form" style="margin: 100px 0 200px 0">
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-block">
									<input type="text" name="custName" required
										lay-verify="required" placeholder="请输入用户名"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">邮箱</label>
								<div class="layui-input-block">
									<input type="email" name="custEmail" required
										lay-verify="required" placeholder="请输入邮箱"
										id="regiterEmailInput" autocomplete="off"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
							    <label class="layui-form-label">分类</label>
							    <div class="layui-input-block">
							      <select name="sort" lay-verify="required">
							        <option value="0">---请选择---</option>
							        <option value="普通">普通</option>
							        <option value="会员">会员</option>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
								<label class="layui-form-label">积分</label>
								<div class="layui-input-block">
									<input type="number" name="integral" required
										lay-verify="required" placeholder="请输入邮箱"
										id="regiterEmailInput" autocomplete="off"
										class="layui-input">
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
		  form.on('submit(*)', function(data){
			  $.ajax({
				  url:"${PATH}/cust/addCust",
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
	</script>

</html>
