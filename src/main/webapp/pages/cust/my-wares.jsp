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
<title>我的商品</title>

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
<style>
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

<!--Page Load Popup-->

<main>

<!-- Slider Start -->

<!-- Slider End -->



<!--Gallery Starts-->
<section id="emp_gallery" class="padding">
  <div class="container-fluid">

			<div class="row">
				<div class="col-sm-12 heading_space clearfix" id="waresList">
					<div class="col-sm-4" >
					<div class="form-group">
		              <input type="text" v-model="keyWord"  class="form-control" placeholder="请输入关键字">
		            </div>
		            <button type="button" v-on:click="fingByKeyWords" class="btn btn_dark btn_full">查询</button>
		            </div>
		            
					<div class="clearfix"></div>
					<br>
					<div id="projects_1" class="cbp">
						<!-- 商品展示 -->
						<div class=" sale col-sm-3" v-for="item in wares" >
							<div class="image">
								<div class="fader">
									<img :src="item.imgOne" alt="">
									<p style="width: 100%;height: 439px;display: block;line-height: 439px;text-align: center;">商品介绍：{{ item.wareRemark}}</p>
								</div>
								
							</div>
							<div class="product_caption padding_b">
							<div class="shop_buttons_my">
									<button v-on:click="stopShowWare(item)" class="btn btn_default btn_dark button_moema icon-drop" > 
										下架
									</button>
								</div>
								<a href="#.">
									<h6 class="bottom10">商品名称：{{item.wareName }}</h6>
								</a>
								<p class="p-price">价格：{{ item.warePrice}}</p>
								<p class="p-price"  style="color: orange">鉴定码：{{ item.apprIdent}}</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>

			<div class="col-sm-12 text-center" style="margin-top:50px">
      <div id="loadMore-gallery" class="btn btn_default button_moema margin40">
        <a href="loadmore-gallery/loadMore.html" class="cbp-l-loadMore-link" rel="nofollow">
        <span class="cbp-l-loadMore-defaultText">LOAD MORE</span>
        <span class="cbp-l-loadMore-loadingText">LOADING...</span>
        <span class="cbp-l-loadMore-noMoreLoading">NO MORE WORKS</span>
        </a>
      </div>
    </div>

  </div>
</section>
   
<!--Modal on Quick View-->
<div class="modal fade emp-quickview" id="demo" tabindex="-1" role="dialog" aria-labelledby="demo" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
            <div class="row">
               <div class="col-sm-6">
                  <div class="image">
                     <img src="${PATH}/pages/static/images/product5.jpg" alt="">
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="view-rating">
                     <span class="view-stars bottom30">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
                     <span>(3 customer review)</span>
                  </div>
                  <h2>Barber’s Broom Classiscs</h2>
                  <h3 class="top10">$112.00</h3>
                  <p class="top30 bottom30">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its distribution of letters.</p>
                  <a class="btn btn_colored btn_rounded button_moema icon-drop" href="#."> <i class="icon-icons102"></i> Add to Cart</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
  

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
<script type="text/javascript">
	var error = "${error}";
	if(error!=""){
		layer.msg(error)
	}
	var waresList = new Vue({
		el:"#waresList",
		data:{
			wares:[],
			keyWord:"",
			custId:"${custId}"
		},created:function(){
			this.$http.post("${PATH}/releaseWares/getMyWares",{
				keyWord:this.keyWord,
				custId:this.custId
				}).then(function(response){
				//成功
				this.wares=response.body;
				console.log(this.wares)
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},methods:{
			fingByKeyWords:function(event){
				this.$http.post("${PATH}/releaseWares/getMyWares",{
					keyWord:this.keyWord,
					custId:this.custId
					}).then(function(response){
					//成功
					this.wares=response.body;
				},function(response) {
					//错误
					console.log("系统错误！")
				});
			},
			stopShowWare:function(item){
				var wareId = item.wareId
				var ident = item.wareIdent
				layer.confirm('确认下架该商品吗?', function(index){
					$.ajax({
						url:"${PATH}/releaseWares/stopShowWare/"+wareId+"/"+ident,
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
					})
					layer.close(index);
				})
			}
		}
		
	});
	
</script>
</body>
</html>