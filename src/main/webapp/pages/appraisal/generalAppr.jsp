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
<title>金牌鉴定师</title>
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


<!--HEADER STARTS-->
<%@ include file="/pages/common/header.jsp"%>
<!--HEADER ENDS-->
<!-- 搜索和购物车 -->
<%@ include file="/pages/common/cart_and_search.jsp"%>



<main>
  
<!-- Page Header start -->
<div class="container-fluid">
  <section class="about-banner parallax padding">
    <div class="container text-center padding_half">
      <div class="row">
        <div class="col-sm-12 whitecolor padding">
          <p class="title_text whitecolor bottom25">Best Selling Products Our all the World</p>
          <h1 class="text-uppercase" style="color: orange">金牌鉴定师</h1>
        </div>
        <div class="col-sm-12">
          <a class="scrollings scroll" href="#emp_about"><img src="${PATH}/pages/static/images/arrow.png" alt=""></a>
        </div>
      </div>
    </div>
  </section>
</div>
<!-- Page Header ends -->


<!-- About Starts-->
  <%-- <section id="emp_about" class="padding">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6">
        <h2 class="text-uppercase bottom10">empor tour</h2>
        <p class="title_text blackcolor bottom30">We create fashionable and functional Design Brands</p>
        <p class="top10 bottom40">It is a long established fact that a reader will be distracted by the readable content of a page
          when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less web page editors now use Lorem
          Ipsum as sites still in their infancy uncover many web.</p>
        <p class="bottom40">It is a long established fact that a reader will be distracted by the readable content of a page when
          looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,
          as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum is that it has Many
          desktop publishing packages.</p>
        <ul class="iconic">
          <li class="text-uppercase top25"><i class="icon-hotairballoon"></i> Free Shipping</li>
          <li class="text-uppercase top25"><i class="icon-icons206"></i> scure payment process</li>
          <li class="text-uppercase top25"><i class="icon-wallet2"></i> 25% GRADE HILL-CLIMBING</li>
        </ul>
      </div>
      <div class="col-sm-6">
        <div class="image">
          <img src="${PATH}/pages/static/images/aboutbox.jpg" alt="about">
        </div>
      </div>
    </div>
  </div>
</section> --%>
<!--About ends-->


<!--About Video & Team-->
<%-- <section id="emp_video" class="padding_t gradient-bg">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="whitecolor bottom10 text-uppercase">MEET OUR TEAM OF EXPERTS</h2>
        <p class="heading_space whitecolor title_text"> We create fashionable and functional Design Brands</p>
        <div class="image ">
          <img src="${PATH}/pages/static/images/video.jpg" alt="video">
          <div class="centered text-center"><a href="https://player.vimeo.com/video/102732914?title=0&amp;byline=0&amp;portrait=0&amp;color=ff4157&amp;wmode=opaque" class="html5lightbox video-btn emp-play"><i class="icon-film"></i> </a> </div>
        </div>
      </div>
    </div>
  </div>
</section> --%>
<!--Meet the Team-->
<section id="team" class="padding_b">
  <div class="container">
    <div class="row text-center" id="showVipAppr">
    
      <div class="col-sm-4" v-for="item in vipApprs">
        <div class="team_wrap top50">
          <div class="image bottom15">
            <img :src="item.apprPhoto" alt="头像">
            <div class="list_content">
              <ul class="socialsimple whitecolor centered" v-text="item.apprRemark">
                
              </ul>
            </div>
          </div>
          <h4 v-text="item.apprNick"></h4>
          <span v-text="item.apprIdent"></span>
          <div id="loadMore-gallery" class="btn btn_default button_moema margin40">
	        <a :href="'${PATH}/appraisal/toAskForApprPage/'+item.apprIdent+'/'+item.apprerId" class="cbp-l-loadMore-link" rel="nofollow">
	        <span class="cbp-l-loadMore-defaultText">求鉴定</span>
	        </a>
	      </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--Parallax Background ends -->


<!--BlockQuotes-->
<section id="emp-blockquotes" class="emp-blockquotes padding">
  <div class="container">
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8 text-center">
        <i class="icon-quotes-left default_color"></i>
        <blockquote>If you Go Anywhere, Even Paradise,
          You will Miss your Home.</blockquote>
        <div class="bordered"><i class="line"></i> <h6>JARLATH MELLET</h6></div>
      </div>
      <div class="col-sm-2"></div>
    </div>
  </div>
</section>
<!--BlockQuotes ends -->
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
<script type="text/javascript">
var showVipAppr = new Vue({
	el:"#showVipAppr",
	data:{
		vipApprs:[]
	},created: function () {
		//展示分类
		this.$http.get("${PATH}/appraisal/getGeneralApprsByShow").then(function(response){
			console.log(response.body)
			//成功
			this.vipApprs=response.body;
		},function(response) {
			//错误
			console.log("系统错误！")
		});
	}
});
var error = "${error}"
if(error!=""){
	layer.msg(error)
}

</script>
</body>
</html>