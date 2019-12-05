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
<title>登录/注册</title>

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
        <li role="presentation"><a href="order" aria-controls="order" role="tab" data-toggle="tab">求鉴定</a></li>
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
	              <label>积分</label>
	              <input type="text" readonly="readonly" value="${appr.apprIntegral}" class="form-control">
	              <input type="button" class="layui-btn layui-btn-primary" id="apprRechargeBtn" value="点击充值积分"/>&nbsp;&nbsp;&nbsp;&nbsp;
	              <input type="button" class="layui-btn layui-btn-primary" id="apprCashBtn" value="点击提现积分"/>
	            </div>
	            <div class="form-group">
	              <label>身份</label>
	              <input type="text" style="color: orange" readonly="readonly" value="${appr.apprVip}" class="form-control">
	              <input type="button" class="layui-btn layui-btn-primary" id="vipBtn" value="点击升级金牌会员"/>
	            </div>
            </div>
          </div>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="profile">
          <form class="callus" action="${PATH}/cust/regiterCust" method="post">
          	<input type="hidden" value="${appr.apprerId}" id="apprerIdInput" name="apprerId">
            <div class="form-group">
              <label>昵称</label>
              <input type="text" name="custNick" class="form-control" placeholder="请输入昵称">
            </div>
            <div class="form-group">
              <label>登录名</label>
              <input type="text" name="custName" class="form-control" placeholder="请输入登录名(请勿包含中文)">
            </div>
            <div class="form-group">
              <label>邮箱</label>
              <input type="email" id="regiterEmailInput" name="custEmail" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
              <label>验证码</label>
              <input type="text" class="form-control" name="formCode" placeholder="请输入邮箱验证码"><br>
              <input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/>
            </div>
            <div class="form-group">
              <label>请输入密码</label>
              <input type="password" name="formPwd1" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
              <label>请再次输入密码</label>
              <input type="password" name="formPwd2" class="form-control" placeholder="请再次输入密码">
            </div>
            <button type="submit" class="btn btn_dark btn_full">注册</button>
          </form>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="order">
          <form class="callus" action="${PATH}/cust/regiterCust" method="post">
          	<input type="hidden" name="custHeader" value="/file/header/2.jpg" />
            <div class="form-group">
              <label>昵称</label>
              <input type="text" name="custNick" class="form-control" placeholder="请输入昵称">
            </div>
            <div class="form-group">
              <label>登录名</label>
              <input type="text" name="custName" class="form-control" placeholder="请输入登录名(请勿包含中文)">
            </div>
            <div class="form-group">
              <label>邮箱</label>
              <input type="email" id="regiterEmailInput" name="custEmail" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
              <label>验证码</label>
              <input type="text" class="form-control" name="formCode" placeholder="请输入邮箱验证码"><br>
              <input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/>
            </div>
            <div class="form-group">
              <label>请输入密码</label>
              <input type="password" name="formPwd1" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
              <label>请再次输入密码</label>
              <input type="password" name="formPwd2" class="form-control" placeholder="请再次输入密码">
            </div>
            <button type="submit" class="btn btn_dark btn_full">注册</button>
          </form>
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
<div id="cashModal" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md8  layui-col-md-offset2"
				style="margin: 10px">
				<form class="layui-form" id="cash_form">
					<input type="hidden" name="apprId" id="techn-cash" value="${appr.apprerId}">
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
var countdown=60; 
function sendemail(){
	layui.use('layer', function(){
	  	var layer = layui.layer;
	  	var obj = $("#codeBtn");
	    var email = $("#regiterEmailInput").val();
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
	var id = $("#techn-cash").val();
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

</script>
</html>