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
<title>商品详情</title>

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
<link rel="icon" href="${PATH}/static/layui/layui.css">
<style>
	#projects,#projects_1{
		height: 584px !important
	}
	.shop_buttons_my {
	float:right;
	margin-top:10px;
    bottom: 5px;
    font-size: 13px;
    text-transform: uppercase;
}
.shop_buttons_my a.add_emp {
    background: #252525;
}
.shop_buttons_my a {
    color: #fff;
    margin-left: -6px;
    padding: 7px 10px;
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
<%-- <%@ include file="/pages/common/cart_and_search.jsp"%> --%>

<!--Page Load Popup-->
<!-- <div id="pageload-modal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <div class="modal-body text-center">
        <h3 class="bottom10 text-uppercase">Empor Offer</h3>
        <p class="bottom40">get <span class="default_color">25%</span> off your First order. Join our newsletter to receive the
          latest updates and promotions
        </p>
        <form class="bottom40">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search&hellip;">
            <span class="input-group-btn">
            <button type="button"><i class="icon-arrow-right2"></i></button>
            </span>
          </div>
        </form>
        <ul class="social">
          <li><a href="#."><i class="icon-facebook-1"></i></a></li>
          <li><a href="#."><i class="icon-pinterest"></i></a></li>
          <li><a href="#."><i class="icon-twitter"></i></a></li>
          <li><a href="#."><i class="icon-google4"></i></a></li>
        </ul>
      </div>
    </div>
  </div>
</div> -->
<!--Page Load Popup-->

<main>

<!-- Slider Start -->

<!-- Slider End -->



<!--Gallery Starts-->
<section id="shop-detail-one">
   <div class="container-fluid" style="padding-left: 30px; padding-right: 30px;"  id="lookWareInfo">
      <div class="row" style="margin: 20px 0">
      <div class="col-sm-2" ></div>
         <div class="col-sm-4 pull-left">
					<div class="row">
						<div class="layui-carousel" id="test1" lay-filter="test1">
						  <div carousel-item="">
						    <div align="center"><img :src="infos.imgOne"></div>
						    <div align="center"><img :src="infos.imgTwo"></div>
						    <div align="center"><img :src="infos.imgThree"></div>
						  </div>
						</div> 
					</div>
				</div>
         <div class="col-sm-4 product_detail padding_half">
            <p class="product_rating">
            <span></span> {{infos.apprIdent}}</p>
            <h3 class="bottom25 top10">{{infos.wareName}}</h3>
            <p class="p-price"><span class="default_color">积分：{{infos.warePrice}}
            	
            </span>
            </p><br>
            <span class="notify">{{infos.wareIdent}}</span>
            <p class="simple bottom20 top20">{{infos.wareRemark}}</p>
            
            <div class="row">
               <div class="col-sm-9 col-md-8">
                  <form class="callus">
                     <div class="">
                        <a class="btn btn_colored btn_rounded button_moema icon-drop bottom30" :href="'${PATH}/order/toOrderByCust/'+infos.wareId">
                           <i class="icon-icons102"></i> 立即购买
                        </a>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         <div class="col-sm-2"></div>
      </div>
   </div>
</section>
<section class="product-info" >
   <ul class="tabs">
      <li class="active" rel="tab1">发布人 </li>
   </ul>
   <div class="tab_container">
      <div id="tab1" class="tab_content" style="display: block;">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
               	 <div id="ownerInfoDiv">
	               	 <h3 class="top50"><img alt="" style="width: 50px;height: 50px" :src="custInfo.custHeader"><br><br>{{custInfo.custNick}}</h3>
	                 <p class="top25 bottom40" style="color: orange">{{custInfo.custState}}</p>
	                 <p class="heading_space">联系方式：{{custInfo.custEmail}}</p>
               	 </div>
                  
                  <h3 class="top15 bottom25"> 评论</h3>
                  <ul class="specification padding_b" id="evaDiv">
                     <li class="clearfix" v-for="item in evas">
                        <p class="pull-left">{{item.evaluateText}}</p>
                        <span class="pull-right">评价人：{{item.commentatorNick}}</span>
                     </li>
                  </ul>
               </div>
            </div>
         </div>

         <!--Bg-->
         

         <!--Two columns-->
         <!-- <section class="bg_half bgdefault" style="background-color: white;">
            <div class="container-fluid equal_parent row" style="padding-left: 30px; padding-right: 30px;">
               <div class="row" style="background-color: white;">
                  <div class="col-sm-6" style="">
                     <div class="row" style="">
                        <div class="image" style=""></div>
                     </div>
                  </div>
                  <div style="background-color: white;color: black;" class="col-sm-6 bgdefault whitecolor padding equal_inner text-center bg_info" style="height: 510px;">
                    <div class="centered leftright">
                      <h3 class="bottom20"></h3>
                     <p class="whitecolor" style="color: black;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its distribution of letters It is a long established fact that a reader will be distracted by the readable content of a page when looking.</p>
                    </div>
                  </div>
               </div>
            </div>
         </section> -->

         <!--Parallax Image-->
         
      </div>
      
      <!-- #tab3 -->
   </div>
   <!-- .tab_container -->
</section>
   

  

 </main>

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
<script src="${PATH}/static/layer/layer.js"></script>
<script src="${PATH}/static/layui/layui.all.js"></script>

<script type="text/javascript">
	var error = "${error}"
	if(error!=""){
		layer.msg(error)
	}
	var lookWareInfo = new Vue({
		el:"#lookWareInfo",
		data:{
			infos:[],
			wareUrl:"${PATH}/releaseWares/getWareInfo/${wareId}"
		},created: function () {
			//展示分类
			this.$http.get(this.wareUrl).then(function(response){
				//成功
				this.infos=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},updated:function(){
			
		}
	})
	layui.use(['carousel', 'form'], function(){
		  var carousel = layui.carousel
		  ,form = layui.form;
		  //常规轮播
		  carousel.render({
		    elem: '#test1'
		    ,arrow: 'always'
		    ,anim:"updown"
		    ,width:"360px"
		    ,height:"440px"
		  });
	})
	var ownerInfoDiv = new Vue({
		el:"#ownerInfoDiv",
		data:{
			custInfo:[],
			custUrl:"${PATH}/cust/getById/${custId}"
		},created: function () {
			//展示分类
			this.$http.get(this.custUrl).then(function(response){
				console.log(response.body.extend.cust)
				//成功
				this.custInfo=response.body.extend.cust;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		}
	})
	var evaDiv = new Vue({
		el:"#evaDiv",
		data:{
			evas:[],
			evaUrl:"${PATH}/evaluate/getByOwnerId/${custId}"
		},created: function () {
			//展示分类
			this.$http.get(this.evaUrl).then(function(response){
				console.log(response.body)
				//成功
				this.evas=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		}
	})
</script>
</body>
</html>