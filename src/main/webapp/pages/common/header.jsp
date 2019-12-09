<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="default">
<script type="text/javascript" src="${PATH}/static/vue/vue.min.js"></script>
<script type="text/javascript" src="${PATH}/static/vue/vue-resource.min.js"></script>
  <nav class="navbar navbar-default navbar-sticky bootsnav">
    <div class="container-fluid">
      <div class="side_item">
		<c:choose>
			<c:when test="${sessionScope.nick == null}">
				<ul class="cols selection">
					<li><a class="login_toggle" href="${PATH}/pages/cust/login.jsp">登录  / 注册</a></li>
					<li><a class="login_toggle" href="${PATH}/pages/admin-login.jsp">后台登录</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${sessionScope.flag == 1}">
						<ul class="cols selection">
					  <li>
					  	<div class="emp_entry">
					      <div class="emp_title">
					      	<img style="width: 25px;height: 25px" alt="头像" src="${sessionScope.header}">
					      		${sessionScope.nick}<span style="color:orange">&nbsp;&nbsp;${sessionScope.state}</span>
					      	</div>
					      <div class="list">
				              <a class="list-entry" href="${PATH}/cust/toReleaseWarePage/${sessionScope.id}/${sessionScope.name}">
				                	发布商品
				              </a>
				              <a class="list-entry" href="${PATH}/cust/getCustInfo/${sessionScope.id}/${sessionScope.name}">
				                	个人中心
				              </a>
				              <a class="list-entry" href="${PATH}/cust/loginOut">
				                	退出登录
				              </a>
					       </div>
					    </div>
					   </li>
			          <li><a href="#."><i class="icon-heart3"></i></a></li>
			          <li class="search_btn"><i class="icon-icons185"></i></li>
			          <!-- <li><a href="#."><i class="icon-icons9"></i></a></li> -->
			          <li><a href="javascript:void(0)" class="hamburger is-closed" data-toggle="offcanvas"><i class="icon-icons102"></i></a>
				      </li>
				      </ul>
					</c:when>
					<c:when test="${sessionScope.flag == 2}">
						
					</c:when>
				</c:choose>
			</c:otherwise>
		</c:choose>
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
        	<li><a href="${PATH}/pages/index.jsp">首页</a></li>
	         <li class="dropdown">
	           <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类</a>
	           <ul class="dropdown-menu" id="showSorts">
	             <li v-for="item in sorts"><a :href="'${PATH}/releaseWares/getWaresBySortId/'+item.sortId" v-text = 'item.sortName'></a></li>
	           </ul>
	         </li>
	         <li class="dropdown">
	           <a href="#" class="dropdown-toggle" data-toggle="dropdown">品牌分类</a>
	           <ul class="dropdown-menu" id="showBrands">
	             <li v-for="item in brands"><a :href="'${PATH}/releaseWares/getWaresByBrandId/'+item.brandId" v-text = 'item.brandName'></a></li>
	           </ul>
	         </li>
          <li class="dropdown megamenu-fw">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">鉴定师分类</a>
            <ul class="dropdown-menu megamenu-content" role="menu">
              <li>
                <div class="row">
                  <!-- <div class="col-menu col-md-3">
                    <h6 class="title">普通鉴定师</h6>
                    <div class="content">
                      <ul class="menu-col" id="show">
                        <li><a href="shop-detail2.html">Shop — Catalog</a></li>
                        <li><a href="shop-detail1.html">Shop — Categories Grid</a></li>
                        <li><a href="shop5.html">Shop — Product Category</a></li>
                        <li><a href="shop3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Checkout</a></li>
                      </ul>
                    </div>
                  </div> -->
                  <!-- end col-3 -->
                  <!-- <div class="col-menu col-md-3">
                    <h6 class="title">金牌鉴定师</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-recent1.html">Shop — Catalog</a></li>
                        <li><a href="shop-recent2.html">Shop — Categories Grid</a></li>
                        <li><a href="shop-recent3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Checkout</a></li>
                        <li><a href="shop-cart.html">Order Tracking</a></li>
                      </ul>
                    </div>
                  </div> -->
                  <!-- end col-3 -->
                  <div class="col-menu col-md-3">
                    <div class="content">
                      <div class="image">
                        <img src="${PATH}/pages/static/images/menu.jpg" alt="menu">
                        <div class="centered text-center">
                          <h4 class="text-uppercase">鉴定师</h4>
                          <!-- <a href="#." class="btn_shop text-uppercase">Shop now</a> -->
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-menu col-md-3">
                    <h6 class="title">鉴定师</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="${PATH}/pages/appraisal/regiter.jsp">申请加入</a></li>
                        <li><a href="${PATH}/pages/appraisal/login.jsp">登录入口</a></li>
                        <li><a style="color: orange;" href="${PATH}/pages/appraisal/vipAppr.jsp">金牌鉴定师</a></li>
                        <li><a href="${PATH}/pages/appraisal/generalAppr.jsp">普通鉴定师</a></li>
                        <li><a href="shop5.html">鉴定师说明</a></li>
                      </ul>
                    </div>
                  </div>
                  
                  <!-- end col-3 -->
                </div>
                <!-- end row -->
              </li>
            </ul>
          </li>
          <!-- <li><a href="blog.html">Blog</a></li> -->
          <!-- <li class="dropdown megamenu-fw">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">加入鉴定师</a>
            <ul class="dropdown-menu megamenu-content" role="menu">
              <li>
                <div class="row">
                  <div class="col-menu col-md-3">
                    <h6 class="title">申请鉴定师</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-recent1.html">申请鉴定师</a></li>
                        <li><a href="shop-recent2.html">Shop — Categories Grid</a></li>
                        <li><a href="shop5.html">Shop — Product Category</a></li>
                        <li><a href="shop-recent3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Checkout</a></li>
                      </ul>
                    </div>
                  </div>
                  end col-3
                  <div class="col-menu col-md-3">
                    <h6 class="title">Products demos</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-recent1.html">Shop — Catalog</a></li>
                        <li><a href="#">Shop — Categories Grid</a></li>
                        <li><a href="#">Shop — with Sidebar</a></li>
                        <li><a href="#">Shopping Cart</a></li>
                        <li><a href="#">Checkout</a></li>
                        <li><a href="shop-cart.html">Order Tracking</a></li>
                      </ul>
                    </div>
                  </div>
                  end col-3
                  <div class="col-menu col-md-3">
                    <h6 class="title">Other Pages</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="contact.html">Contact  — V1</a></li>
                        <li><a href="contact2.html">Contact  — V2</a></li>
                        <li><a href="contact3.html">Contact  — V3</a></li>
                        <li><a href="faq.html">Faq's</a></li>
                        <li><a href="404.html">404</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-menu col-md-3">
                    <h6 class="title">Other Pages</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="about-designer.html">About Designer</a></li>
                        <li><a href="author-post.html">Author Posts</a></li>
                        <li><a href="wishlist.html">Wishlist</a></li>
                        <li><a href="wishlist-empty.html">Wishlist Empty</a></li>
                      </ul>
                    </div>
                  </div>
                  end col-3
                </div>
                end row
              </li>
            </ul>
          </li> -->
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
  </nav>
  <script type="text/javascript">
  var showDiv = new Vue({
		el:"#showSorts",
		data:{
			sorts:[]
		},created: function () {
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
  var showDiv = new Vue({
		el:"#showBrands",
		data:{
			brands:[],
		},created: function () {
			//展示品牌
			this.$http.get("${PATH}/brand/getBrandsByShow").then(function(response){
				//成功
				this.brands=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		}
	});

  
  </script>
</header>