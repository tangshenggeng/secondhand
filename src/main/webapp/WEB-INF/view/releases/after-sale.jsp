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
                    <li class="active">已售商品</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
					<div class="col-lg-12">
						<form class="layui-form" id="kwCustForm">
							<div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" id="start_date" placeholder="发布时间" name="start_date" id="start" lay-key="1">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <input class="layui-input" autocomplete="off" id="end_date" placeholder="发布时间" name="end_date" id="end" lay-key="2">
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
    <!-- 模态框 -->
<div style="display: none;" id="detailWareModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<h4>介绍：</h4>
				<div id="remarkModal"></div>
			</div>
			<div class="layui-card-body">
				<h4>发布人：</h4>
				<div id="custModal" style="letter-spacing:3px"></div>
			</div>
			<div>
                   <p>图片</p>
               <img id="imgOneModal" style="width: 200px;height: 180px" alt="照片" style="width:100%">
               <img id="imgTwoModal" style="width: 200px;height: 180px" alt="照片" style="width:100%">
               <img id="imgThreeModal" style="width: 200px;height: 180px" alt="照片" style="width:100%">
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
		var data = $("#kwCustForm").serializeArray();
		layui.use(['table','util'], function() {
			var table = layui.table
			,util = layui.util;
			//第一个实例
			table.render({
				elem : '#custListTb',
				height : 500,
				url : '${PATH}/releaseWares/getAfterSaleList',
				text : {
					none : '未找到商品'
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
					field : 'wareId',
					title : '#',
					type:"checkbox",
					align : "center"
				}, {
					field : 'wareIdent',
					title : '商品序列号',
					align : "center"
				}, {
					field : 'wareName',
					title : '商品名称',
					align : "center"
				},{
					field : 'warePrice',
					title : '售价',
					align : "center",
					sort:true
				},{
					field : 'apprIdent',
					title : '状态',
					style:"color: orange;",
					align : "center",
				},{
					field : 'createTime',
					title : '创建时间',
					align : "center",
					sort:true
					,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd')}}</div>"
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
			table.on('tool(custListTbFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
			  if(layEvent === 'detail'){ //查看
				  console.log(data.custId)
				  $.ajax({
					  url:"${PATH}/cust/getById/"+data.custId,
					  method:"GET",
					  success:function(res){
						  console.log(res)
						  $("#custModal").html(res.extend.cust.custName)
					  }
				  })
				  $("#remarkModal").html(data.wareRemark)
				  $("#imgOneModal").attr("src",data.imgOne)
				  $("#imgTwoModal").attr("src",data.imgTwo)
				  $("#imgThreeModal").attr("src",data.imgThree)
				  var index = layer.open({
						title : '商品信息',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['800px','500px'],
						shadeClose : true,
						shade : 0.4,
						type : 1,
						content : $('#detailWareModal')
					});
				  
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
					ids.push($(this)[0].wareId);
				})
				if(ids.length==0){
					layer.msg("请选择数据！");
					return null;
				}
				$.ajax({
					url:"${PATH}/releaseWares/delWaresByIds",
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
  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</script>
</html>
