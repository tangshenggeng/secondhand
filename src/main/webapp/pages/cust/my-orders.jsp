<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>订单中心</title>

<!-- Bootstrap -->
<link href="${PATH}/pages/static/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/empor-icon.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/bootstrap-slider.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/cubeportfolio.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/settings.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/bootsnav.css">
<link rel="stylesheet" type="text/css"
	href="${PATH}/pages/static/css/style.css">
<link rel="icon" href="${PATH}/pages/static/images/favicon.png">
<link href="${PATH}/static/layui/css/layui.css" rel='stylesheet'
	type='text/css' />
<style>
.emp_cart .table>tbody>tr>td:last-child {
	padding-right: 0;
	text-align: center;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="boxed">

	<!--Pre LOADER-->
	<div class="loader">
		<div id="cssload-wrapper">
			<div class="cssload-loader">
				<div class="cssload-line"></div>
				<div class="cssload-line"></div>
				<div class="cssload-line"></div>
				<div class="cssload-line"></div>
				<div class="cssload-line"></div>
				<div class="cssload-line"></div>
				<div class="cssload-subline"></div>
				<div class="cssload-subline"></div>
				<div class="cssload-subline"></div>
				<div class="cssload-subline"></div>
				<div class="cssload-subline"></div>
				<div class="cssload-loader-circle-1">
					<div class="cssload-loader-circle-2"></div>
				</div>
				<div class="cssload-needle"></div>
				<div class="cssload-loading">loading</div>
			</div>
		</div>
	</div>
	<!--Pre LOader Ends-->


	<!--头部静态引入 STARTS-->
	<%@ include file="/pages/common/header.jsp"%>
	<!--HEADER ENDS-->


	<!--Shopping Cart-->

	<!--Shopping Cart ends-->

	<!--Search-->
	<div id="search">
		<button type="button" class="close">×</button>
		<form class="centered clearfix">
			<input type="search" value="" placeholder="Search here...." required />
			<button type="submit" class="btn-search">
				<i class="icon-icons185"></i>
			</button>
		</form>
	</div>
	<!--Search Ends-->
	<!-- main -->
	<main
		style="margin-bottom: 663px; box-shadow: rgba(0, 0, 0, 0.8) 0px 20px 30px -20px;">
	<!--Shop Cart-->
	<section id="emp-cart" class="padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3 class="text-uppercase heading_space">我的购买商品</h3>
					<div class="table-responsive emp_cart">
						<table class="table" id="myorder_table_buy">
							<tbody>
								<thead>
								<tr>
									<th style="text-align: center;">商品</th>
									<th style="text-align: center;">订单号</th>
									<th style="text-align: center;">备注</th>
									<th style="text-align: center;">状态</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in orders">
									<td><a href="#" class="shopping-product"><img
											style="width: 74px; height: 74px" :src="item.wareImg"
											alt="商品图片"></a>
										<h6>{{item.wareName}}</h6></td>
									<td class="product-name">
										<h5>{{item.orderNumber}}</h5>

									</td>
									
									<td class="cart_price"><strong>{{item.consigneeRemark}}</strong>
										<!-- <span class="textdeco"> $280.00</span> --></td>
									<td><p class="instock">{{item.orderState}}</p></td>

									<td>
										<button v-on:click="seeWareInfo(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											查看</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<button v-if="item.orderState === '已发货'"  v-on:click="receivingInfo(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											已收货</button>
										<button v-if="item.orderState === '已收货'"  v-on:click="askRefund(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											申请退货</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<button v-if="item.orderState === '已收货'"  v-on:click="evaluateWares(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											评价</button>
									</td>

								</tr>
							</tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="emp-cart" class="padding">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h3 class="text-uppercase heading_space">我的卖出商品</h3>
					<div class="table-responsive emp_cart">
						<table class="table" id="myorder_table_sale">
							<thead>
								<tr>
									<th style="text-align: center;">商品</th>
									<th style="text-align: center;">订单号</th>
									<th style="text-align: center;">备注</th>
									<th style="text-align: center;">状态</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in orders">
									<td><a href="#" class="shopping-product"><img
											style="width: 74px; height: 74px" :src="item.wareImg"
											alt="商品图片"></a>
										<h6>{{item.wareName}}</h6></td>
									<td class="product-name">
										<h5>{{item.orderNumber}}</h5>

									</td>
									<!-- <td class="product-name">
                    <h5>{{item.orderNumber}}</h5>
                </td> -->
									<td class="cart_price"><strong>{{item.consigneeRemark}}</strong>
										<!-- <span class="textdeco"> $280.00</span> --></td>
									<td><p class="instock">{{item.orderState}}</p></td>

									<td>
										<button v-on:click="seeWareInfo(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											查看</button>&nbsp;&nbsp;&nbsp;&nbsp;
											
										<button v-if="item.orderState === '已下单'" v-on:click="expressInfo(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											已发货</button>
										<button v-if="item.orderState === '申请退货'" v-on:click="agreeRefund(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											同意退货</button>
										<button v-if="item.orderState === '同意退货'" v-on:click="finallyWare(item)"
											class="btn btn_default btn_dark button_moema icon-drop">
											完成</button>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--Shop Cart ends--> </main>
	<!-- main end -->


	<!--Footer Starts-->
	<%@ include file="/pages/common/footer.jsp"%>
	<!--Footer Ends-->
	<!-- 模态框 -->
	<!-- 查看收货人信息 （我卖的商品）-->
	<div style="display: none;" id="detailWareModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<h4>收货人：</h4>
				<div id="consignee_name"></div>
			</div>
			<div class="layui-card-body">
				<h4>联系方式：</h4>
				<div id="consignee_email" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>收货地址：</h4>
				<div id="consignee_addr" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>快递公司：</h4>
				<div id="express_com_saler" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>快递单号：</h4>
				<div id="express_number_saler" style="letter-spacing: 3px"></div>
			</div>
		</div>
	</div>
	<!-- 查看订单信息（我买的） -->
	<div style="display: none;" id="detailWareByBuyerModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<h4>收货人：</h4>
				<div id="consignee_name_buyer"></div>
			</div>
			<div class="layui-card-body">
				<h4>联系方式：</h4>
				<div id="consignee_email_buyer" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>收货地址：</h4>
				<div id="consignee_addr_buyer" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>快递公司：</h4>
				<div id="express_com" style="letter-spacing: 3px"></div>
			</div>
			<div class="layui-card-body">
				<h4>快递单号：</h4>
				<div id="express_number" style="letter-spacing: 3px"></div>
			</div>
			
		</div>
	</div>
	<!-- 填写快递信息 -->
	<div style="display: none;" id="expressWareModal">
		<div class="layui-card">
			<form class="layui-form" style="margin: 20px 20px">
				<input type="hidden" id="orderIdExpress" name="orderId"/>
				<input type="hidden" id="orderNumberExpress" name="orderNumber"/>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px">快递公司</label>
					<div class="layui-input-block">
						<input type="text" name="expressCom" required lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px">快递单号</label>
					<div class="layui-input-block">
						<input type="text" name="expressNumber" required lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="expressInfoBtn">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div style="display: none;" id="askRefundWareModal">
		<div class="layui-card">
			<form class="layui-form" style="margin: 20px 20px">
				<input type="hidden" id="orderIdExpress_ask" name="orderId"/>
				<input type="hidden" id="orderNumberExpress_ask" name="orderNumber"/>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px">退货理由</label>
					<div class="layui-input-block">
						<textarea  name="consigneeRemark"  required lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="askRefundBtn">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 评价 -->
	<div style="display: none;" id="evaluateWares">
		<div class="layui-card">
			<form class="layui-form" style="margin: 20px 20px">
				<input type="hidden" id="ownerId_eva" name="ownerId"/>
				<input type="hidden" id="commentatorId_eva" name="commentatorId"/>
				<input type="hidden" id="commentatorNick_eva" name="commentatorNick"/>
				<input type="hidden" id="orderId_eva" name="orderId"/>
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px">评价</label>
					<div class="layui-input-block">
						<textarea  name="evaluateText"  required lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="evaluateBtn">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="${PATH}/pages/static/js/jquery.2.2.3.min.js"></script>
	<script src="${PATH}/pages/static/js/bootstrap.min.js"></script>
	<script src="${PATH}/pages/static/js/bootsnav.js"></script>
	<script src="${PATH}/pages/static/js/jquery.appear.js"></script>
	<script src="${PATH}/pages/static/js/jquery-countTo.js"></script>
	<script src="${PATH}/pages/static/js/jquery.cubeportfolio.min.js"></script>
	<script src="${PATH}/pages/static/js/footer-reveal.min.js"></script>
	<script src="${PATH}/pages/static/js/jquery.matchHeight-min.js"></script>
	<script src="${PATH}/pages/static/js/owl.carousel.min.js"></script>
	<script src="${PATH}/pages/static/js/viedobox_video.js"></script>
	<script src="${PATH}/pages/static/js/bootstrap-slider.min.js"></script>
	<script src="${PATH}/pages/static/js/bootstrap-select.min.js"></script>
	<script src="${PATH}/pages/static/js/select.js"></script>
	<script src="${PATH}/pages/static/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="${PATH}/pages/static/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="${PATH}/pages/static/js/revolution.extension.actions.min.js"></script>
	<script
		src="${PATH}/pages/static/js/revolution.extension.layeranimation.min.js"></script>
	<script
		src="${PATH}/pages/static/js/revolution.extension.navigation.min.js"></script>
	<script
		src="${PATH}/pages/static/js/revolution.extension.parallax.min.js"></script>
	<script
		src="${PATH}/pages/static/js/revolution.extension.slideanims.min.js"></script>
	<script src="${PATH}/pages/static/js/revolution.extension.video.min.js"></script>
	<script src="${PATH}/pages/static/js/functions.js"></script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
</body>
<script type="text/javascript">
	var error = "${error}"
	if(error!=""){
		layer.msg(error)
	}
	//买
	var myorder_table_buy = new Vue({
		el:"#myorder_table_buy",
		data:{
			orders:[],
			originatorId:"${id}",
			originatorNick:"${nick}"
		},created: function () {
			//展示分类
			this.$http.post("${PATH}/order/getBuyOrdersByCust",{
				originatorId:this.originatorId,
				originatorNick:this.originatorNick
			}).then(function(response){
				console.log(response.body)
				//成功
				this.orders=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},methods:{
			seeWareInfo:function(item){
				$("#consignee_addr_buyer").html(item.consigneeAddr)
				$("#consignee_email_buyer").html(item.consigneeEmail)
				$("#consignee_name_buyer").html(item.consigneeName)
				$("#express_com").html(item.expressCom)
				$("#express_number").html(item.expressNumber)
					var index = layer.open({
						title : '订单信息',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['600px','350px'],
						shadeClose : true,
						shade : 0.4,
						type : 1,
						content : $('#detailWareByBuyerModal')
					});
				},
				askRefund:function(item){
					var id = "${sessionScope.id}"
					if(id==""){
						layer.msg("登录超时！请重新登录！")
						return false;
					}
					$("#orderIdExpress_ask").val(item.orderId)
					$("#orderNumberExpress_ask").val(item.orderNumber)
					var index = layer.open({
						title : '申请退货',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['600px','250px'],
						shadeClose : false,
						shade : 0.4,
						type : 1,
						content : $('#askRefundWareModal')
					});
				},
				receivingInfo:function(item){
					var id = "${sessionScope.id}"
					if(id==""){
						layer.msg("登录超时！请重新登录！")
						return false;
					} 
					var orderId = item.orderId
					var orderNum = item.orderNumber
					layer.confirm('确认收货吗?', function(index){
						  $.ajax({
							  url:"${PATH}/order/receivingWare/"+orderId+"/"+orderNum,
							  method:"get",
							  success:function(res){
								  if(res.code==100){
										layer.msg(res.extend.msg,{icon:6},function(){
											location.reload(true)  
										})
									}else{
										layer.msg(res.extend.msg,{icon:5})
									}
							  },error:function(){
								  layer.msg("系统错误！")
							  }
						  });
						  layer.close(index);
					});    
				},
				//评价
				evaluateWares:function(item){
					$("#ownerId_eva").val(item.ownerId)
					$("#commentatorId_eva").val(item.originatorId)
					$("#commentatorNick_eva").val(item.originatorNick)
					$("#orderId_eva").val(item.orderId)
					var index = layer.open({
						title : '评价',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['600px','250px'],
						shadeClose : false,
						shade : 0.4,
						type : 1,
						content : $('#evaluateWares')
					});
				}
		}
	});
	//卖
	var myorder_table_sale = new Vue({
		el:"#myorder_table_sale",
		data:{
			orders:[],
			originatorId:"${id}",
			originatorNick:"${nick}"
		},created: function () {
			//展示分类
			this.$http.post("${PATH}/order/getSaleOrdersByCust",{
				originatorId:this.originatorId,
				originatorNick:this.originatorNick
			}).then(function(response){
				console.log(response.body)
				//成功
				this.orders=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},methods:{
			seeWareInfo:function(item){
				$("#consignee_addr").html(item.consigneeAddr)
				$("#consignee_email").html(item.consigneeEmail)
				$("#consignee_name").html(item.consigneeName)
				$("#express_com_saler").html(item.expressCom)
				$("#express_number_saler").html(item.expressNumber)
					var index = layer.open({
						title : '订单信息',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['600px','350px'],
						shadeClose : true,
						shade : 0.4,
						type : 1,
						content : $('#detailWareModal')
					});
				},
				expressInfo:function(item){
					var id = "${sessionScope.id}"
					if(id==""){
						layer.msg("登录超时！请重新登录！")
						return false;
					}
					$("#orderIdExpress").val(item.orderId)
					$("#orderNumberExpress").val(item.orderNumber)
					var index = layer.open({
						title : '填写快递信息',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['600px','250px'],
						shadeClose : false,
						shade : 0.4,
						type : 1,
						content : $('#expressWareModal')
					});
				},
				agreeRefund:function(item){
					var id = "${sessionScope.id}"
					if(id==""){
						layer.msg("登录超时！请重新登录！")
						return false;
					}
					var orderIdent = item.orderNumber
					$.ajax({
						url:"${PATH}/order/agreeRefund/"+orderIdent,
						method:"get",
						success:function(res){
							if(res.code==100){
								layer.msg(res.extend.msg,{icon:6},function(){
									location.reload(true)  
								})
							}else{
								layer.msg(res.extend.msg,{icon:5})
							}
						},error:function(){
							layer.msg("系统错误！")
						}
					});
				},
				finallyWare:function(item){
					var id = "${sessionScope.id}"
					if(id==""){
						layer.msg("登录超时！请重新登录！")
						return false;
					}
					var orderIdent = item.orderNumber
					$.ajax({
						url:"${PATH}/order/finallyOrder/"+orderIdent,
						method:"get",
						success:function(res){
							if(res.code==100){
								layer.msg(res.extend.msg,{icon:6},function(){
									location.reload(true)  
								})
							}else{
								layer.msg(res.extend.msg,{icon:5})
							}
						},error:function(){
							layer.msg("系统错误！")
						}
					});
				},
			}
			
	});
</script>
<script type="text/javascript">
layui.use(['form','layer'], function(){
	  var form = layui.form
	  layer=layui.layer;
	  var id = "${sessionScope.id}"
		if(id==""){
			layer.msg("登录超时！请重新登录！")
			return false;
		}
	  //监听提交
	  form.on('submit(expressInfoBtn)', function(data){
	    var data = data.field;
	    $.ajax({
			url:"${PATH}/order/expressInfo",	    	
			method:"post",
			data:data,
			success:function(res){
				console.log(res)
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						location.reload(true)  
					})
				}else{
					layer.msg(res.extend.msg,{icon:5})
				}
			},error:function(){
				layer.msg("系统错误！")
			}
	    });
	    return false;
	  });
	});
layui.use(['form','layer'], function(){
	  var form = layui.form
	  layer=layui.layer;
	  var id = "${sessionScope.id}"
		if(id==""){
			layer.msg("登录超时！请重新登录！")
			return false;
		}
	  //监听提交
	  form.on('submit(askRefundBtn)', function(data){
		  var data = data.field;
		    $.ajax({
				url:"${PATH}/order/askRefund",	    	
				method:"post",
				data:data,
				success:function(res){
					console.log(res)
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							location.reload(true)  
						})
					}else{
						layer.msg(res.extend.msg,{icon:5})
					}
				},error:function(){
					layer.msg("系统错误！")
				}
		    });
		    return false;
	  });
	});
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(evaluateBtn)', function(data){
		  var data = data.field;
		    $.ajax({
				url:"${PATH}/evaluate/addEvaluate",	    	
				method:"post",
				data:data,
				success:function(res){
					console.log(res)
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							location.reload(true)  
						})
					}else{
						layer.msg(res.extend.msg,{icon:5})
					}
				},error:function(){
					layer.msg("系统错误！")
				}
		    });
		    return false;
	  });
	});

</script>
</html>