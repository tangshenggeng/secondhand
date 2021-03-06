<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>鉴定师个人中心</title>

<!-- Bootstrap -->
<link href="${PATH}/pages/static/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/empor-icon.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/bootstrap-slider.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/cubeportfolio.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/settings.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/bootsnav.css">
<link rel="stylesheet" type="text/css" href="${PATH}/pages/static/css/style.css">
<link rel="icon" href="${PATH}/pages/static/images/favicon.png">
<link href="${PATH}/static/layui/css/layui.css" rel='stylesheet'
	type='text/css' />
	<script type="text/javascript" src="${PATH}/static/vue/vue.min.js"></script>
<script type="text/javascript" src="${PATH}/static/vue/vue-resource.min.js"></script>

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
      <div class="cssload-loader-circle-1"><div class="cssload-loader-circle-2"></div></div>
      <div class="cssload-needle"></div>
      <div class="cssload-loading">loading</div>
    </div>
  </div>
</div>
<!--Pre LOader Ends-->

 
<!--头部静态引入 STARTS-->
<nav class="navbar navbar-default navbar-sticky bootsnav">
    <div class="container-fluid">
			<div class="side_item">
				<ul class="cols selection">
					<li>
						<div class="emp_entry">
							<div class="emp_title">
								<img style="width: 25px; height: 25px" alt="头像"
									src="${appr.apprHeader}"> ${appr.apprNick}<span
									style="color: orange">&nbsp;&nbsp;${appr.apprVip}</span>
							</div>
							<div class="list">
								<a class="list-entry" href="${PATH}/appraisal/loginOut">
									退出登录 </a>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- Start Header Navigation -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                <i class="fa fa-bars"></i>
            </button>
        <a class="navbar-brand" href="${PATH}/pages/index.jsp"><img src="${PATH}/pages/static/images/logo.png" class="logo" alt=""></a>
      </div>
      <!-- End Header Navigation -->

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbar-menu">
        <ul class="nav navbar-nav navbar-left" data-in="fadeIn" data-out="fadeOut">
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
  </nav>


<!-- Login starts -->
<main>
<div class="rev_slider">
  <div class="row">
    <div class="col-sm-2">
    </div>
    <div class="col-sm-8">
      <div class="contentform">
    
    <div class="logintabbed bottom30">
      <ul class="nav nav-tabs nav-justified heading_space" role="tablist">
        <li role="presentation" class="active"><a href="#registered" aria-controls="registered" role="tab" data-toggle="tab">基本信息</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">修改信息</a></li>
        <li role="presentation"><a href="#order" aria-controls="order" role="tab" data-toggle="tab">求鉴定</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="registered">
          <div class="callus">
          <div class="form-group" align="center">
              <img alt="头像" style="width: 80px;height: 80px"  src="${appr.apprHeader}">
            </div>
          
          	 <div class="col-sm-6">
	            <div class="form-group">
	              <label>序列号</label>
	              <input type="text" readonly="readonly" value="${appr.apprIdent}" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>已鉴定的商品数量</label>
	              <input type="text" readonly="readonly" value="${appr.apprNum}" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>鉴定价格</label>
	              <input type="text" readonly="readonly" value="${appr.apprPrice}" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>身份</label>
	              <input type="text" style="color: orange" readonly="readonly" value="${appr.apprVip}" class="form-control">
	              <input type="button" class="layui-btn layui-btn-primary" id="vipBtn" value="点击升级金牌会员"/>
	            </div>
	            <div class="form-group">
	              <label>自我介绍</label>
	              <textarea  type="text" readonly="readonly"  class="form-control"> ${appr.apprRemark}</textarea>
	            </div>
            </div>
          	 <div class="col-sm-6">
	            <div class="form-group">
	              <label>登录名</label>
	              <input type="text" readonly="readonly" value="${appr.apprName}" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>昵称</label>
	              <input type="text" readonly="readonly" value="${appr.apprNick}" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>擅长品牌</label>
	              <input type="text" readonly="readonly" id="goodAtBrands" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>擅长分类</label>
	              <input type="text" readonly="readonly" id="goodAtSorts" class="form-control">
	            </div>
	            <div class="form-group">
	              <label>积分</label>
	              <input type="text" readonly="readonly" value="${appr.apprIntegral}" class="form-control">
	              <input type="button" class="layui-btn layui-btn-primary" id="apprRechargeBtn" value="点击充值积分"/>&nbsp;&nbsp;&nbsp;&nbsp;
	              <input type="button" class="layui-btn layui-btn-primary" id="apprCashBtn" value="点击提现积分"/>
	            </div>
            </div>
          </div>
        </div>
        <!-- 修改信息 -->
        <div role="tabpanel" class="tab-pane fade" id="profile">
          <form class="callus"  id="editApprForm">
          	<input type="hidden" value="${appr.apprerId}" id="apprerIdInput" name="apprerId">
          	<input type="hidden" value="${appr.apprEmail}" id="apprerEmailInput" name="apprEmail">
          	<input type="hidden" value="${appr.apprIdent}" id="appr_ident" name="apprIdent">
          	<div class="form-group" align="center">
            	<div class="layui-form-item">
                    <input type="hidden" name="apprHeader" id="productImg"/>
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="productImgButton">上传头像</button>
                        <div class="layui-upload-list">
                            <img style="width: 80px;height: 80px" class="layui-upload-img" id="productImgImg">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
              <label>昵称</label>
              <input type="text" name="apprNick" class="form-control" placeholder="请输入昵称">
            </div>
            <div class="form-group">
              <label>鉴定定价</label>
              <input type="number" name="apprPrice" class="form-control" placeholder="请输入价格">
            </div>
            <div class="form-group">
              <label>请输入密码</label>
              <input type="password" name="formPwd1" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
              <label>请再次输入密码</label>
              <input type="password" name="formPwd2" class="form-control" placeholder="请再次输入密码">
            </div>
            <div class="form-group">
            	<h4 style="padding-bottom: 5px">鉴定专长：</h4>
				<div class="row" id="showBrandAndSorts">
					<div class="col-md-3 col-sm-6">
						<div class="emp_cate equal_inner">
							<h5 class="text-uppercase select-title">品牌</h5>
							<label class="clearfix" v-for="item in brands">
								<div class="squaredFour">
									<input :id="item.brandNumber" :value="item.brandId" name="brands"  type="checkbox"> 
									<label :for="item.brandNumber"></label>
								</div>
								<h6 class="bottom5" v-text = 'item.brandName'></h6>
							</label> 
						</div>
					</div>
					<div class="col-md-3 col-sm-6"></div>
					<div class="col-md-3 col-sm-6">
						<div class="emp_cate equal_inner">
							<h5 class="text-uppercase select-title">分类</h5>
							<label class="clearfix" v-for="item in sorts">
								<div class="squaredFour">
									<input :id="item.sortId" :value="item.sortId" name="sorts"  type="checkbox"> 
									<label :for="item.sortId"></label>
								</div>
								<h6 class="bottom5" v-text = 'item.sortName'></h6>
							</label>
						</div>
					</div>
				</div>
				</div>
            <div class="form-group">
              <label>自我介绍</label>
              <textarea   name="apprRemark"  class="form-control"></textarea>
            </div>
            <div class="form-group">
              <label>验证码</label>
              <input type="text" class="form-control" name="formCode" placeholder="请输入邮箱验证码"><br>
              <input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/>
            </div>
            <button type="button" id="editApprBtn" class="btn btn_dark btn_full">修改</button>
          </form>
        </div>
        <!-- 请求鉴定表 -->
        <div role="tabpanel" class="tab-pane fade" id="order">
         	<table id="ask_appr_tb" lay-filter="ask_tb_filter">
         	</table>
        </div>
      </div>
    </div>
  </div>
    </div>
  </div>
</div>
</main>
<!-- Login end -->

<!--Footer Starts-->
<footer id="footer" class="footer padding_t clearfix">
  <div class="container footerBg">
    <div class="row">
      <div class="col-sm-12 text-center">
        <p class="heading_space top15 copyright-text">Copyright &copy; 2017 Empor. All right reserved. Designed by<a href="#."> Brighthemes</a></p>
      </div>
    </div>
  </div>
</footer>
<!--Footer Ends-->
<!-- 模态框 -->
<!-- 提现模态框 -->
<div id="cashModal" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md8  layui-col-md-offset2"
				style="margin: 10px">
				<form class="layui-form" id="cash_form">
					<input type="hidden" name="apprId" id="appr-cash" value="${appr.apprerId}">
					<input type="hidden" name="oldIntegral" value="${appr.apprIntegral}">
					<div class="layui-form-item">
						<label class="layui-form-label" style="width: 100px">提现方式</label>
						<div class="layui-input-block">
							<select name="cashWay">
						        <option value="0">---请选择---</option>
						        <option value="微信">微信</option>
						        <option value="支付宝">支付宝</option>
						    </select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-block">
							<input type="text" name="cashAccount" id="cashAccount_modal"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="width: 100px">提现金额</label>
						<div class="layui-input-block">
							<input type="number"  name="cashMoney" id="input_money"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="width: 100px">提现积分</label>
						<div class="layui-input-block">
							<input type="number" id="integral" name="cashIntegral" 
								readonly="readonly" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="confirm-cash">申请提现</button>
						</div>
					</div>
				</form>
				<p style="color: red;" align="center">注意：积分的提现，平台收取最终20%的费用！</p>
			</div>
		</div>
	</div>
	<!-- 充值模态框 -->
<div id="rachargeModal" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md8  layui-col-md-offset2"
				style="margin: 10px">
				<form class="layui-form">
					<input type="hidden" name="apprId" id="techn-cash" value="${appr.apprerId}">
					<div class="layui-form-item">
						<label class="layui-form-label" style="width: 100px">充值金额</label>
						<div class="layui-input-block">
							<input type="number"  name="cashMoney" id="racharge_money"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="width: 100px">充值积分</label>
						<div class="layui-input-block">
							<input type="number" id="racharge_integral" name="cashIntegral" 
								readonly="readonly" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="confirm-racharge">充值</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- 查看商品图片 -->
<div id="lookWareImgModal" style="display: none;">
	<div class="layui-carousel" id="test1" align="center">
	  <div carousel-item align="center">
	    <div align="center"><img alt="" align="middle" id="imgOneModal"></div>
	    <div align="center"><img alt="" align="middle" id="imgTwoModal"></div>
	    <div align="center"><img alt="" align="middle" id="imgThreeModal"></div>
	  </div>
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
<script src="${PATH}/pages/static/js/jquery.themepunch.revolution.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.actions.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.layeranimation.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.navigation.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.parallax.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.slideanims.min.js"></script>
<script src="${PATH}/pages/static/js/revolution.extension.video.min.js"></script>
<script src="${PATH}/pages/static/js/functions.js"></script>
<script src="${PATH}/static/layui/layui.all.js"></script>
</body>
<script type="text/javascript">
var showDiv = new Vue({
	el:"#showBrandAndSorts",
	data:{
		brands:[],
		sorts:[]
	},created: function () {
		//展示品牌
		this.$http.get("${PATH}/brand/getBrandsByShow").then(function(response){
			//成功
			this.brands=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
		//展示分类
		this.$http.get("${PATH}/sort/getSortssByShow").then(function(response){
			//成功
			this.sorts=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	}
});
$(function() {
	var ident= "${appr.apprIdent}"
	$.ajax({
		url:"${PATH}/appraisal/getByApprIdent/"+ident,
		method:"get",
		success:function(res){
			$("#goodAtBrands").val(res.brand);
			$("#goodAtSorts").val(res.sort)
		}
	});
});
</script>
<script type="text/javascript">
var contextPath = "${PATH}/static/"
layui.config({
    base: contextPath + 'layui/easyCropper/' //layui自定义layui组件目录
})
layui.use(['easyCropper'], function(){
    var easyCropper = layui.easyCropper;
    //创建一个图片裁剪上传组件
    var productImgCropper = easyCropper.render({
        elem: '#productImgButton'
        ,saveW:380     //保存宽度
        ,saveH:360     //保存高度
        ,mark:1/1   //选取比例
        ,size: 2048    // 大小限制 默认1024k 选填
        ,area:'600px'  //弹窗宽度
        ,url: '${PATH}/appraisal/uploadHeaderImg'  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
        ,done: function(url){ //上传完毕回调
            $("#productImg").val(url);
            $("#productImgImg").attr('src',url);
        }
    });
})

var countdown=60; 
function sendemail(){
	layui.use('layer', function(){
	  	var layer = layui.layer;
	  	var obj = $("#codeBtn");
	    var email = $("#apprerEmailInput").val();
	    var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	    if(!reg.test(email)){
	    	layer.msg("请输入正确的邮箱！",{icon:5});
	    	return;
	    }
	    $.ajax({
	    	url:"${PATH}/regiterCode/createEmailCode?regEmail="+email,
	    	method:"get",
	    	success:function(res){
	    		if(res.code==100){
	    			layer.msg(res.extend.msg,{icon:6});
	    		}else{
	    			layer.msg(res.extend.msg,{icon:5});
	    		}
	    	},error:function(){
	    		layer.msg("系统错误！",{icon:5});
	    		return;
	    	}
	    });
	    settime(obj);
	});
    }
function settime(obj) { //发送验证码倒计时
    if (countdown == 0) { 
        obj.attr('disabled',false); 
        //obj.removeattr("disabled"); 
        obj.val("点击获取验证码");
        countdown = 60; 
        return;
    } else { 
        obj.attr('disabled',true);
        obj.val("重新发送(" + countdown + ")");
        countdown--; 
    } 
setTimeout(function() { 
    settime(obj) }
    ,1000) 
}
//提现
$("#apprCashBtn").click(function() {
	layui.use([ 'util', 'laydate', 'layer' ], function() {
		var util = layui.util, laydate = layui.laydate, layer = layui.layer;
		layer.open({
			type : 1,//类型
			area : [ '600px', '400px' ],//定义宽和高
			title : '积分提现',//题目
			anim: 6,
			shadeClose : false,//点击遮罩层关闭
			content : $('#cashModal')
		//打开的内容
		});
	});
});
//充值
$("#apprRechargeBtn").click(function() {
	layui.use([ 'util', 'laydate', 'layer' ], function() {
		var util = layui.util, laydate = layui.laydate, layer = layui.layer;
		layer.open({
			type : 1,//类型
			area : [ '600px', '300px' ],//定义宽和高
			title : '积分充值',//题目
			anim: 2,
			shadeClose : false,//点击遮罩层关闭
			content : $('#rachargeModal')
		//打开的内容
		});
	});
});
//升级黄金鉴定师
layui.use('layer', function() {
	var layer = layui.layer;
	$("#vipBtn").click(function(){
	var id = $("#apprerIdInput").val();
	layer.confirm('确定花费500积分升级为会员吗？', {icon: 3, title:'提示'}, function(index){
		  $.ajax({
			  url:"${PATH}/appraisal/upgradeVIP/"+id,
			  method:"get",
			  success : function(res) {
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6,
						}, function() {
							location.reload();
						})
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						})
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					})
				}
		  });
		  layer.close(index);
		});
	});
})
//联动
$("#input_money").bind('input propertychange', function() {
	var num1 = $(this).val();
	if (isNaN(num1)) { //如果为非数字，结果为空
		$("#integral").val() = "";
	} else { 
		$("#integral").val(num1 * 10)
	}
});
//联动
$("#racharge_money").bind('input propertychange', function() {
	var num1 = $(this).val();
	if (isNaN(num1)) { //如果为非数字，结果为空
		$("#racharge_integral").val() = "";
	} else { 
		$("#racharge_integral").val(num1 * 10)
	}
});
//确认提现
$("#confirm-cash").click(function() {
	var id = $("#appr-cash").val();
	var data = $("#cash_form").serialize() ;
	var integral = $("#integral").val();
	var input_money = $("#input_money").val();
	var cashAccount_modal = $("#cashAccount_modal").val();
	var oldIntegral = $("#oldIntegral").val();
	if(cashAccount_modal==""){
		layer.msg("请输入账号！")
		return;
	}
	if (integral == "0"||integral=="") {
		layer.msg("请输入积分！")
		return;
	}
	if(input_money>(oldIntegral*10)){
		layui.layer.msg("提现积分超额啦！！！",{icon:5});
		return ;
	}
	$.ajax({
		url : "${PATH}/cashAppr/cashIntegral",
		method : "post",
		data:data,
		success : function(res) {
			if (res.code == 100) {
				layer.msg(res.extend.msg, {
					icon : 6,
					time : 5000
				}, function() {
					location.reload();
				})
			} else {
				layer.msg(res.extend.msg, {
					icon : 5
				})
			}
		},
		error : function() {
			layer.msg("系统错误！", {
				icon : 5
			})
		}
	});
});

//充值
$("#confirm-racharge").click(function() {
	var id = $("#techn-cash").val();
	var integral = $("#racharge_integral").val();
	var money = $("#racharge_money").val();
	layui.use('layer', function() {
		if (integral == "") {
			layer.msg("请输入金额！")
			return;
		}
		layer.open({
			type : 1,
			time : 5000,
			anim : 1,
			area : '460px',
			content : '<img alt="收款码"  style="width: 457;height: 440"  src="${PATH}/pages/static/images/weixin.jpg">',
			success : function(layero, index) {
				$.ajax({
					url : "${PATH}/flowAppr/recharge?id=" + id + "&integral=" + integral+"&money="+money,
					method : "get",
					success : function(res) {
						if (res.code == 100) {
							layer.msg(res.extend.msg, {
								icon : 6,
								time : 5000
							}, function() {
								location.reload();
							})
						} else {
							layer.msg(res.extend.msg, {
								icon : 5
							}, function() {
								location.reload();
							})
						}
					},
					error : function() {
						layer.msg("系统错误！", {
							icon : 5
						})
					}
				});
			}
		});
	})
});
$("#editApprBtn").click(function(){
	var data = $("#editApprForm").serialize();
	layui.use('layer', function() {
		var layer = layui.layer;
		$.ajax({
			url:"${PATH}/appraisal/editInfoByAppr",
			method:"POST",
			data:data,
			success:function(res){
				if(res.code==100){
	    			layer.msg(res.extend.msg,{icon:6},function(){
	    				window.location.href="${PATH}/appraisal/loginOut";
	    			});
	    		}else{
	    			layer.msg(res.extend.msg,{icon:5});
	    		}
			},error:function(){
				layer.msg("系统错误！",{icon:5});
	    		return;
			}
		});	
	})
});
</script>
<script type="text/javascript">
$(function() {
	renderTb();
});
function renderTb(){
	layui.use(['table','layer'], function(){
		var ident = $("#appr_ident").val();
		var apprid = $("#appr-cash").val();
		var table = layui.table,
		layer=layui.layer;
		  //第一个实例
		  table.render({
		    elem: '#ask_appr_tb'
		    ,height: 600
		    ,url: '${PATH}/askAppraisal/getAskByAppr' //数据接口
		    ,where: {ident:ident, apprid: apprid}
		    ,method:"post"
		    ,contentType: "application/json"//必须指定，否则会报415错误
			,dataType : 'json'
			,text : {
				none : '暂无数据'
			}
		    ,page: true //开启分页
		    ,cols: [[ //表头
		      {field: 'askIdent', title: '鉴定码'}
		      ,{field: 'createTime', title: '请求时间',sort:true
					,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
		      ,{field: 'waresName', title: '商品名' }
		      ,{field: 'waresRemark', title: '留言'} 
		      ,{
				fixed : 'right',
				title : '操作',
				toolbar : '#barDemo',
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
		  table.on('tool(ask_tb_filter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
	    	  var data = obj.data; //获得当前行数据
	    	  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	    	  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
	    	 
	    	  if(layEvent === 'detail'){ //查看
					  $("#imgOneModal").attr("src",data.waresImgOne)  	    
					  $("#imgTwoModal").attr("src",data.waresImgTwo)  	    
					  $("#imgThreeModal").attr("src",data.waresImgThree)  	    
	    		  var index = layer.open({
						title : '商品图片',
						fix : true,
						resize : false,
						move : false,
						zIndex : 500,
						area: ['800px','450px'],
						shadeClose : true,
						shade : 0.4,
						type : 1,
						content : $('#lookWareImgModal')
					});
	    	    
	    	  } else if(layEvent === 'really'){ //真
	    	    layer.confirm('确认鉴定为真吗？', function(index){
	    	    	$.ajax({
	    	    		url:"${PATH}/askAppraisal/apprWareReally/"+data.askId+"/"+data.apprId+"/"+data.custId,
	    	    		method:"get",
	    	    		beforeSend:function(){
	    	    			var loading = layer.load(1,{time: 5000});
	    	    		},
	    	    		success:function(res){
	    	    			if(res.code==100){
	    	    				layer.msg(res.extend.msg,function(){
	    	    					renderTb();
	    	    				})
	    	    			}else{
	    	    				layer.msg(res.extend.msg)
	    	    			}
	    	    		},error:function(){
	    	    			layer.msg("系统错误！");
	    	    		},
	    	    		
	    	    	});
	    	    });
	    	  } else if(layEvent === 'fake'){ //编辑
	    		  layer.confirm('确认鉴定为假吗？', function(index){
		    	    	$.ajax({
		    	    		url:"${PATH}/askAppraisal/apprWareFake/"+data.askId+"/"+data.apprId+"/"+data.custId,
		    	    		method:"get",
		    	    		success:function(res){
		    	    			if(res.code==100){
		    	    				layer.msg(res.extend.msg,function(){
		    	    					renderTb();
		    	    				})
		    	    			}else{
		    	    				layer.msg(res.extend.msg)
		    	    			}
		    	    		},error:function(){
		    	    			layer.msg("系统错误！");
		    	    		}
		    	    	});
		    	    });
	    	  } else if(layEvent === 'LAYTABLE_TIPS'){
	    	    layer.alert('Hi，头部工具栏扩展的右侧图标。');
	    	  }
	    	});
		});
	layui.use('carousel', function(){
		  var carousel = layui.carousel;
		  //建造实例
		  carousel.render({
		    elem: '#test1'
		    ,width: '100%' //设置容器宽度
		    ,arrow: 'always' //始终显示箭头
		    ,autoplay:false
		    ,trigger:'click'
		  });
		});
}

</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="really">正品</a>
  <a class="layui-btn layui-btn-xs  layui-btn-danger" lay-event="fake">假货</a>
</script>
</html>