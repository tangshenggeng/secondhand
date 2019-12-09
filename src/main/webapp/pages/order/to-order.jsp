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
<title>下单</title>

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
<!-- 搜索和购物车 -->
<%@ include file="/pages/common/cart_and_search.jsp"%>


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
     	
        <li role="presentation" class="active"><a href="#registered" aria-controls="registered" role="tab" data-toggle="tab">填写订单</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="registered">
          <form class="callus"  id="orderInfoForm">
          <!-- 下单人id -->
          <input type="hidden"  name="originatorId" value="${sessionScope.id}" id="originatorId"/>
          <!-- 下单人昵称 -->
          <input type="hidden"  name="originatorNick" value="${sessionScope.nick}"/>
          
          <input type="hidden"  name="wareId" value="${ware.wareId}"/>
          <input type="hidden"  name="ownerId" value="${ware.custId}"/>
          <input type="hidden"  name="ownerNick" value="${ware.custNick}"/>
          <input type="hidden"  name="wareImg" value="${ware.imgOne}"/>
            <div class="form-group">
              <label>商品名</label>
              <input type="text" value="${ware.wareName}"  class="form-control" readonly="readonly" name="wareName" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>鉴定码</label>
              <input type="text" value="${ware.apprIdent}"  class="form-control" readonly="readonly" name="apprIdent" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>价格</label>
              <input type="text" value="${ware.warePrice}"  class="form-control" readonly="readonly" name="price" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>收货人</label>
              <input type="text"  class="form-control" name="consigneeName" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>联系方式</label>
              <input type="text"  class="form-control" name="consigneeEmail" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>收货地址</label>
              <input type="text" class="form-control" name="consigneeAddr" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>备注</label>
              <textarea  name="consigneeRemark" class="form-control" placeholder="请输入"></textarea>
            </div>
            <button type="button" id="orderWareBtn" class="btn btn_dark btn_full">确认</button>
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
</body>
<script type="text/javascript">
	var error = "${error}";
	if(error!=""){
		layer.msg(error)
	}
$("#orderWareBtn").click(function(){
	var data = $("#orderInfoForm").serialize() 
	layui.use('layer', function(){
		var layer = layui.layer;
		var id = $("#originatorId").val();
		if(id==""){
			layer.msg("登录超时！请重新登录！")
			return false;
		}
		  $.ajax({
			url:"${PATH}/order/orderByCust",	
			method:"POST",
			data:data,
			success:function(res){
				console.log(res);
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						 window.location.href="${PATH}/pages/index.jsp";
					});
				}else{
					layer.msg(res.extend.msg,{icon:5});
				}
			},error:function(){
				layer.msg("系统错误！")
			}
		  });				  
	})
});

</script>
</html>