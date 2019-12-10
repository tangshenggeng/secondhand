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
<title>注册</title>

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
<div id="search">
  <button type="button" class="close">×</button>
  <form class="centered clearfix">
    <input type="search" value="" placeholder="Search here...."  required/>
    <button type="submit" class="btn-search"><i class="icon-icons185"></i></button>
  </form>
</div>
 <!--Search Ends-->
<!-- Login starts -->
<main>
<div class="rev_slider">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6">
      <div class="contentform">
    <ol class="breadcrumb_simple text-center heading_space">
      <li><a href="#" style="color:red;" >
	      
      </a></li>
    </ol>
    <div class="logintabbed bottom30">
      <ul class="nav nav-tabs nav-justified heading_space" role="tablist">
     	 <span style="color:red;font-size: 20px">
     	 	  ${pwdError}
		      ${apprError}
		      ${codeError}
		      ${regiterError}
		      ${nameError}
		      ${msg}
		      ${unSele}
	      </span>
        <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="profile" >
          <form class="callus" id="regiterApprForm" action="${PATH}/appraisal/regiterAppr" method="post">
          	<input type="hidden" name="apprHeader" value="/file/header/2.jpg" />
            <div class="form-group">
              <label>昵称</label>
              <input type="text" name="apprNick" class="form-control" placeholder="请输入昵称">
            </div>
            <div class="form-group">
              <label>真实姓名</label>
              <input type="text" name="apprName" class="form-control" placeholder="请输入登录名">
            </div>
            <div class="form-group">
              <label>邮箱</label>
              <input type="email" id="regiterEmailInput" name="apprEmail" class="form-control" placeholder="请输入邮箱">
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
              <label>备注</label>
              <textarea  name="apprRemark" class="form-control" placeholder="请输入"></textarea>
            </div>
            <div class="form-group">
            	<div class="layui-form-item">
                    <input type="hidden" name="apprPhoto" id="productImg"/>
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="productImgButton">上传照片</button>
                        <div class="layui-upload-list">
                            <img style="width: 100px;height: 90px" class="layui-upload-img" id="previewImg">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
              <label>验证</label>
              <div id="technVerify"></div>
            </div>
            <button type="submit" disabled="disabled" id="regiterApprBtn" class="btn btn_dark btn_full">注册</button>
          </form>
        </div>
      </div>
    </div>
    <div class="hr_head"><span>OR</span></div>
    <div class="share_with text-center top30">
      <h5 class="bottom20">快捷登录</h5>
      <a href="#." class="facebook"><i class="icon-facebook-1"></i> Facebook </a>
      <a href="#." class="twitter"><i class="icon-twitter-1"></i> twitter</a>
      <a href="#." class="google"><i class="icon-google4"></i> google +</a>
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

</script>
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
layui.use(['upload','layer','form'], function(){
	 var $ = layui.jquery
	 ,upload = layui.upload
	 ,layer = layui.layer
	 ,form = layui.form;
	 var uploadInst = upload.render({
	    elem: '#productImgButton'
	    ,url: '${PATH}/appraisal/uploadApprPhoto'
	    ,accept:"images"	//指定允许上传时校验的文件类型
	    ,exts:'jpg|png|gif|bmp|jpeg'
	    ,acceptMime:'image/*' //规定打开文件选择框时，筛选出的文件类型
	    ,size:1024	//设置文件最大可允许上传的大小，单位 KB。
	    ,field:"file"
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#previewImg').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.code > 0){
	        return layer.msg(res.msg,{icon:6});
	      }
	      //上传成功
	      console.log(res.data)
	      $("#productImg").val(res.data);
	      return layer.msg(res.msg,{icon:6});
	      
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	      });
	    }
	  });
})
//验证
$('#technVerify').slideVerify({
	type : 1,		//类型
	vOffset : 5,	//误差量，根据需求自行调整
	barSize : {
		width : '80%',
		height : '40px',
	},
	ready : function() {
	},
	success : function() {
		$("#regiterApprBtn").removeAttr("disabled");
	},
	error : function() {
	}
});
</script>
</html>