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
<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
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
                    <li class="active">异常客户</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<form class="layui-form" id="kwCustForm">
							<div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" id="start_date" placeholder="注册时间开始日" name="start_date" id="start" lay-key="1">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" id="end_date" placeholder="注册时间截止日" name="end_date" id="end" lay-key="2">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="formCode" placeholder="关键字" autocomplete="off" class="layui-input">
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
						<button class="layui-btn layui-btn-normal" type="button" id="recoveryCustBtn"><i class="layui-icon layui-icon-refresh-3"> 恢复</i></button>
						<table id="custListTb"
							class="table table-responsive table-hover"
							lay-filter="custListTbFilter">
		
						</table>
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
				height : 312,
				url : '${PATH}/cust/getExceptionCustList',
				text : {
					none : '未找到顾客'
				},
				id:"custListTbId",
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
					field : 'custId',
					title : '#',
					type:"checkbox",
					align : "center"
				}, {
					field : 'custName',
					title : '用户名',
					align : "center"
				}, {
					field : 'custEmail',
					title : '邮箱',
					align : "center"
				},{
					field : 'custIntegral',
					title : '积分',
					align : "center",
					sort:true
				},{
					field : 'vipEnd',
					title : '状态',
					style:"color: orange;",
					align : "center",
					templet: function(d){
				        if(d.vipEnd!=null){
				        	return "<div>会员</div>"
				        }else{
				        	return "<div>非会员</div>"
				        }
				    }
				},{
					field : 'createTime',
					title : '创建时间',
					align : "center",
					sort:true
					,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd')}}</div>"
				}/* ,{
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					align : "center"
				} */]],
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
		});
	}
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  //执行一个laydate实例
		  laydate.render({
		    elem: '#start_date' //指定元素,
		    ,eventElem: '#start_date'
		    ,trigger: 'click'
		  });
		  laydate.render({
		    elem: '#end_date' //指定元素,
		    ,eventElem: '#end_date'
		    ,trigger: 'click'
		  });
		});
	//筛选
	$("#kwFormBtn").click(function(){
		renderTb();
	});
	//批量删除
	$("#delByIds").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('真的删除行么', function(index){
				var checkStatus = table.checkStatus('custListTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].custId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/cust/delCustByIds",
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
	//批量异常
	$("#recoveryCustBtn").click(function(){
		layui.use(['table','layer'], function() {
			var table = layui.table
			,layer = layui.layer;
			layer.confirm('确认恢复用户吗？', function(index){
				var checkStatus = table.checkStatus('custListTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].custId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/cust/recoveryCustByIds",
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
	
	</script>

</html>
