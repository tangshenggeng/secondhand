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
<title>忘记密码</title>

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
<link href="${PATH}/static/verify/verify.css" rel="stylesheet">
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
<!-- <div id="search">
  <button type="button" class="close">×</button>
  <form class="centered clearfix">
    <input type="search" value="" placeholder="Search here...."  required/>
    <button type="submit" class="btn-search"><i class="icon-icons185"></i></button>
  </form>
</div> -->
 <!--Search Ends-->
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
     	 
        <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">忘记密码</a></li>
      </ul>
        <div role="tabpanel" class="tab-pane fade in active" id="profile">
          <form class="callus">
            <div class="form-group">
              <label>邮箱</label>
              <input type="email" id="changeEmailInput" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
              <label>验证码</label>
              <input type="text" class="form-control" id="changeCode" placeholder="请输入邮箱验证码"><br>
              <input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/>
            </div>
            <div class="form-group">
              <label>请输入密码</label>
              <input type="password" name="formPwd1" id="change-pwd1" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
              <label>请再次输入密码</label>
              <input type="password" name="formPwd2" id="change-pwd2" class="form-control" placeholder="请再次输入密码">
            </div>
            <div class="form-group">
              <label>验证</label>
              <div id="forgetVerify"></div>
            </div>
            <button type="button" id="custChangePwdBtn" disabled="disabled" class="btn btn_dark btn_full">修改</button>
          </form>
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
<script src="${PATH}/static/verify/verify.min.js"></script>
</body>
<script type="text/javascript">
$("#custChangePwdBtn").click(function() {
	layui.use('layer', function() {
		var layer = layui.layer;
		var changeEmail = $("#changeEmailInput").val();
		var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (!reg.test(changeEmail)) {
			layer.msg("请输入正确的邮箱！", {
				icon : 5
			});
			return;
		}
		var changeCode = $("#changeCode").val();
		var changePwd1 = $("#change-pwd1").val();
		var changePwd2 = $("#change-pwd2").val();
		if (changePwd1 != changePwd2) {
			layer.msg("两次输入的密码不一致！", {
				icon : 5
			});
			return;
		}
		$.ajax({
			url : "${PATH}/appraisal/forgetPwd",
			method : "post",
			contentType : "application/json",//必须指定，否则会报415错误
			dataType : 'json',
			data : JSON.stringify({
				email : changeEmail,
				code : changeCode,
				changePwd : changePwd2
			}),
			success : function(res) {
				if (res.code == 100) {
					layer.msg(res.extend.msg, {
						icon : 6
					}, function() {
						window.location.href="${PATH}/pages/appraisal/login.jsp";
					});
				} else {
					layer.msg(res.extend.msg, {
						icon : 5
					});
				}
			},
			error : function() {
				layer.msg("系统错误！", {
					icon : 5
				});
			}
		});

	})
});
//验证码
var countdown=60; 
function sendemail(){
	layui.use('layer', function(){
	  	var layer = layui.layer;
	  	var obj = $("#codeBtn");
	    var email = $("#changeEmailInput").val();
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
$('#forgetVerify').slideVerify({
	type : 1,		//类型
	vOffset : 5,	//误差量，根据需求自行调整
	barSize : {
		width : '80%',
		height : '40px',
	},
	ready : function() {
	},
	success : function() {
		$("#custChangePwdBtn").removeAttr("disabled");
	},
	error : function() {
	}
});
</script>
</html>