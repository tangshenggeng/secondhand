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
<title>客户信息</title>

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
<%@ include file="/pages/common/header.jsp"%>
<!--HEADER ENDS-->

   
<!--Shopping Cart-->

   <!--Shopping Cart ends-->

<!--Search-->
<div id="search">
  <button type="button" class="close">×</button>
  <form class="centered clearfix">
    <input type="search" value="" placeholder="Search here...."  required/>
    <button type="submit" class="btn-search"><i class="icon-icons185"></i></button>
  </form>
</div>
<div id="recharge">
  <button type="button" class="close">×</button>
  <form class="centered clearfix">
  	<input type="hidden" value="${cust.custId}" id="rechargeCustId">
    <input type="number" id="input_money" placeholder="输入金额(人民币和积分比例为1:10)" required/>
    <input type="number" id="integral" readonly="readonly" required/>
    <button type="button" id="confirm-recharge" class="btn-search">点击充值</button>
  </form>
</div>
 <!--Search Ends-->
 
 <!--Shopping Cart-->
	<div id="sidebar-wrapper">
		<ul class="nav sidebar-nav">
			<li class="tablecart">
				<div class="photo">
					<a href="#"> <img
						src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
					</a>
				</div>

				<div class="cartbody">
					<h5>Little Barrel in White</h5>
					<span>1 × $1,288.00</span> <i class="fa fa-close cross"></i>
				</div>
			</li>
			<li class="tablecart">
				<div class="photo">
					<a href="#"> <img
						src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
					</a>
				</div>
				<div class="cartbody">
					<h5>Little Barrel in White</h5>
					<span>1 × $1,288.00</span> <i class="fa fa-close cross"></i>
				</div>
			</li>
			<li class="tablecart">
				<div class="photo">
					<a href="#"> <img
						src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
					</a>
				</div>
				<div class="cartbody">
					<h5>Little Barrel in White</h5>
					<span>1 × $1,288.00</span> <i class="fa fa-close cross"></i>
				</div>
			</li>
			<li class="text-center margin40 top40">
				<div class="image-cart bottom10">
					<img src="${PATH}/pages/static/images/shopping-cart.png" alt="">
				</div>
				<h4 class="text-uppercase">no products in the cart.</h4>
			</li>
		</ul>
		<div class="cart-bottom clearfix">
			<h5 class="pull-left top10 bottom10">SUBTOTAL</h5>
			<h5 class="pull-right top10 bottom10">$1,798.00</h5>
			<div class="clearfix"></div>
			<a class="btn btn_dark button_moema">view cart</a> <a
				class="btn btn_colored button_moema">Checkout</a>
		</div>
	</div>
	<!--Shopping Cart ends-->
 
<!-- Login starts -->
<main>
<div class="rev_slider">
  <div class="row">
    
    <div class="col-sm-6 layui-col-md-offset3">
      <div class="contentform">
    <ol class="breadcrumb_simple text-center heading_space">
      <li><a href="#" style="color:red;" >
	      
      </a></li>
    </ol>
    <div class="logintabbed bottom30">
      <ul class="nav nav-tabs nav-justified heading_space" role="tablist">
     	 <span style="color:red;font-size: 20px">
     	 		${findInfoError}
		      ${custError}
		      ${codeError}
		      ${editError}
	      </span>
        <li role="presentation" class="active"><a href="#registered" aria-controls="registered" role="tab" data-toggle="tab">客户信息</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">修改资料</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="registered">
          <div class="callus">
            <div class="form-group" align="center">
              <img alt="头像" style="width: 80px;height: 80px"  src="${cust.custHeader}">
            </div>
            <div class="form-group">
              <label>登录名</label>
              <input type="text" class="form-control" readonly="readonly" value="${cust.custName}">
            </div>
            <div class="form-group">
              <label>昵称</label>
              <input type="text" value="${cust.custNick}" readonly="readonly" class="form-control">
            </div>
			<div class="form-group">
              <label>会员有效期</label>
              <input type="text" style="color: orange" value="${end}" readonly="readonly" class="form-control">
            </div>
            <div class="form-group">
              <label>昵称</label>
              <input type="text" value="${cust.custNick}" readonly="readonly" class="form-control">
            </div>
            
            <div class="form-group">
              <label>Email</label>
              <input type="text" value="${cust.custEmail}" readonly="readonly" class="form-control">
            </div>
            <div class="form-group">
              <label>积分</label>
              <input type="text" value="${cust.custIntegral}" readonly="readonly" class="form-control">
              <input type="button" class="layui-btn layui-btn-primary custRecharge" value="点击充值积分"/>
              &nbsp;&nbsp;<input type="button" class="layui-btn layui-btn-primary" id="vipBtn" value="点击升级会员"/>
            </div>
            
          </div>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="profile">
          <form class="callus" action="${PATH}/cust/changeCustInfo" method="post">
          	<input type="hidden"  value="${cust.custEmail}" id="regiterEmailInput" name="custEmail"  />
          	<input type="hidden"  value="${cust.custId}" name="custId"  />
            <div class="form-group" align="center">
            	<div class="layui-form-item">
                    <input type="hidden" name="custHeader" id="productImg"/>
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
              <input type="text" value="${cust.custNick}"  name="custNick" class="form-control" placeholder="请输入昵称">
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
              <label>验证码</label>
              <input type="text" class="form-control" name="formCode" placeholder="请输入邮箱验证码"><br>
              <input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/>
            </div>
            <button type="submit" class="btn btn_dark btn_full">修改</button>
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
<%@ include file="/pages/common/footer.jsp"%>
<!--Footer Ends-->


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
        ,url: '${PATH}/cust/uploadHeaderImg'  //图片上传接口返回和（layui 的upload 模块）返回的JOSN一样
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
//联动
$("#input_money").bind('input propertychange', function() {
	var num1 = $(this).val();
	if (isNaN(num1)) { //如果为非数字，结果为空
		$("#integral").val() = "";
	} else { //将第二个输入框设置为美元值乘以汇率的结果
		$("#integral").val(num1 * 10)
	}
});
//充值
$("#confirm-recharge").click(function() {
	var id = $("#rechargeCustId").val();
	var integral = $("#integral").val();
	var money = $("#input_money").val();
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
					url : "${PATH}/cust/recharge?id=" + id + "&integral=" + integral+"&money="+money,
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

layui.use('layer', function() {
	var layer = layui.layer;
	$("#vipBtn").click(function(){
	var id = $("#rechargeCustId").val();
	layer.confirm('确定花费一百积分升级为会员吗？', {icon: 3, title:'提示'}, function(index){
		  $.ajax({
			  url:"${PATH}/cust/upgradeVIP/"+id,
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

</script>
</html>