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
                    <li class="active">客户消费</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<form class="layui-form" id="kwRechargeForm">
							<div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" type="number" placeholder="金额范围头" name="start_money">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" type="number" placeholder="金额范围尾" name="end_money">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="name" placeholder="输入客户名" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                            <select name="sort" lay-verify="required">
						        <option value="0">---请选择---</option>
						        <option value="充值">充值</option>
						        <option value="消费">消费</option>
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
						<table id="rechargeListTb"
							class="table table-responsive table-hover"
							lay-filter="rechargeListTbFilter">

						</table>	
					</div>
				</div>
                <!-- /.row -->

            </div>

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- 查看模态框 -->
	<div style="display: none;" id="detailCustModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<h4>客户名：</h4>
				<div id="custNameDiv"></div>
			</div>
			<div class="layui-card-body" >
				<h4>客户昵称：</h4>
				<div id="custNickDiv"></div>
			</div>
			<div class="layui-card-body">
				<h4>当前积分：</h4>
				<div id="custNowDiv"></div>
			</div>
		</div>
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
		var data = $("#kwRechargeForm").serializeArray();
		layui.use(['table','util'], function() {
			var table = layui.table
			,util = layui.util;
			//第一个实例
			table.render({
				elem : '#rechargeListTb',
				height : 600,
				url : '${PATH}/rechargeCust/getRechargeList',
				text : {
					none : '未找到充值信息'
				},
				id:"rechargeListTbId",
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
					field : 'rechargeId',
					title : '#',
					type:"checkbox",
					rowspan:2,
					align : "center"
				}, {
					field : 'rechargeMoney',
					title : '金额（￥）',
					rowspan:2,
					style:"color: red;",
					align : "center"
				},{
					title : '积分',
					colspan:3,
					align : "center"
				},{
					field : 'rechargeSort',
					title : '方式',
					rowspan:2,
					style:"color: orange;",
					align : "center",
				},{
					field : 'createTime',
					title : '创建时间',
					rowspan:2,
					sort:true,
					align : "center"
					,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
				},{
					fixed : 'right',
					title : '操作',
					rowspan:2,
					toolbar : '#barDemo',
					align : "center"
				}],[
					{
						field : 'oldIntegral',
						title : '充值前',
						align : "center"
					},
					{
						field : 'rechargeIntegral',
						title : '充值量',
						align : "center"
					},
					{
						field : 'newIntegral',
						title : '充值后',
						align : "center"
					}
					
				]],
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
			table.on('tool(rechargeListTbFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data; //获得当前行数据
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				if (layEvent === 'detail') { //查看
					var custId = data.rechargeCustId
					$.ajax({
						url:"${PATH}/cust/getById/"+custId,
						method:"get",
						success:function(res){
							if(res.code==100){
								$("#custNowDiv").html(res.extend.cust.custIntegral);
								$("#custNickDiv").html(res.extend.cust.custNick);
								$("#custNameDiv").html(res.extend.cust.custName);
							}
						},error:function(){
							layui.layer.msg("系统错误！",{icon:5})
						}
						
					});
					var index = layer.open({
						title : '消费人信息',
						fix : true,
						resize : false,
						move : false,
						area: ['600px','320px'],
						zIndex : 500,
						shadeClose : true,
						shade : 0.4,
						type : 1,
						anim: 4,
						content : $('#detailCustModal')
					});
				}else if(layEvent === 'reject'){
					var data = data
					var flag = data.rechargeState
					if(flag=="200"){
						layer.msg("当前客户已经驳回",{icon:5})
						return;
					}
					$.ajax({
						url:"${PATH}/rechargeCust/rejectRecharge",
						method:"post",
						contentType: "application/json",//必须指定，否则会报415错误
				        dataType : 'json',
						data:JSON.stringify(data),
						success:function(res){
							if(res.code==100){
								layer.msg(res.extend.msg,{icon:6},function(){
									renderTb();
								})
							}else{
								layer.msg(res.extend.msg,{icon:5})
							}
						},error:function(){
							layer.msg("系统错误！",{icon:5})
						}
					});
				} else if (layEvent === 'LAYTABLE_TIPS') {
					layer.alert('Hi，头部工具栏扩展的右侧图标。');
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
			layer.confirm('真的删除行么', function(index){
				var checkStatus = table.checkStatus('rechargeListTbId');
				var datas = checkStatus.data
				var ids = new Array();
				$(datas).each(function(){
					ids.push($(this)[0].rechargeId);
				})
				console.log(ids)
				if(ids.length==0){
					layer.msg("请选择要删除的数据！",{icon:5});
					return;
				}
				$.ajax({
					url:"${PATH}/rechargeCust/delRechargeByIds",
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
	<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="reject">驳回</button>
</div>
</script>
</html>
