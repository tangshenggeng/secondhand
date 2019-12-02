<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="default">
  <nav class="navbar navbar-default navbar-sticky bootsnav">
    <div class="container-fluid">
    
      <div class="side_item">
		<c:choose>
			<c:when test="${sessionScope.nick == null}">
				<ul class="cols selection">
					<li><a class="login_toggle" href="${PATH}/pages/cust/login.jsp">登录  / 注册</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${sessionScope.flag == 1}">
						<ul class="cols selection">
							<%-- <li>
					          <div class="emp_entry">
					            <div class="emp_title">昵称</div>
					            <div class="list">
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/us.png" alt="us">个人资料
					              </a>
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/uk.png" alt="uk"> United Kingdom
					              </a>
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/france.png" alt="France"> France
					              </a>
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/australia.png" alt="Australia"> Australia
					              </a>
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/italia.png" alt="Italia"> Italia
					              </a>
					              <a class="list-entry" href="javascript:void(0)">
					                <img src="${PATH}/pages/static/images/duc.png" alt="Deutschland"> Deutschland
					              </a>
					            </div>
					          </div>
				        </li> --%>

					  <li>
					  	<div class="emp_entry">
					      <div class="emp_title">
					      	<img style="width: 25px;height: 25px" alt="头像" src="${sessionScope.header}">
					      		${sessionScope.nick}
					      	</div>
					      <div class="list">
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
						<li class="layui-nav-item" lay-unselect=""><a
							href="javascript:;"><img src="${sessionScope.photo}"
								class="layui-nav-img"> ${sessionScope.nick} </a>
							<dl class="layui-nav-child">
								<dd>
									<a class="dropdown-item"
										href="${PATH}/technician/getTechnInfo/${sessionScope.id}/${sessionScope.phone}">个人中心</a>
								</dd>
								<dd>
									<a class="dropdown-item"
										href="${PATH}/orders/getTechnOrders/${sessionScope.id}/${sessionScope.phone}">我的订单</a>
								</dd>
								<dd>
									<a class="dropdown-item"
										href="${PATH}/blogs/writeBlog/${sessionScope.id}/${sessionScope.phone}">编写博客</a>
								</dd>
								<dd>
									<a class="dropdown-item"
										href="${PATH}/blogs/getBlogsByTechn/${sessionScope.id}/${sessionScope.phone}">我的博客</a>
								</dd>
								<dd>
									<a class="dropdown-item" href="${PATH}/cust/loginOut">退出登录</a>
								</dd>
							</dl></li>
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
        <a class="navbar-brand" href="index.html"><img src="${PATH}/pages/static/images/logo.png" class="logo" alt=""></a>
      </div>
      <!-- End Header Navigation -->

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbar-menu">
        <ul class="nav navbar-nav navbar-left" data-in="fadeIn" data-out="fadeOut">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home</a>
            <ul class="dropdown-menu">
              <li><a href="index.html">Home Shop 1</a></li>
              <li><a href="index2.html">Home Shop 2</a></li>
              <li><a href="index3.html">Home V3 — Collection: Men</a></li>
              <li><a href="index4.html">Home V4 — Collection: Women</a></li>
              <li><a href="index5.html">Home V5 — Collections / Parallax</a></li>
              <li><a href="index6.html">Home V6 — Simple eCommerce</a></li>
              <li><a href="shop4.html">Home V7 — Portfolio</a></li>
              <li><a href="#">Home V8 — Startup Site</a></li>
            </ul>
          </li>
          <li class="dropdown megamenu-fw">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop Styles</a>
            <ul class="dropdown-menu half-content" role="menu">
              <li>
                <div class="row">
                  <div class="col-menu col-md-5">
                    <h6 class="title">Layouts</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop1.html">Home Shop 1</a></li>
                        <li><a href="shop2.html">Home Shop 2</a></li>
                        <li><a href="shop3.html">Home Shop 3</a></li>
                        <li><a href="shop4.html">Home Shop 4</a></li>
                        <li><a href="shop5.html">Home Shop 5</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- end col-6 -->
                  <div class="col-menu col-md-7">
                    <h6 class="title">Layouts</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-detail2.html">Shop — Catalog</a></li>
                        <li><a href="shop4.html">Shop — Categories Grid</a></li>
                        <li><a href="shop-detail3.html">Shop — Product Category</a></li>
                        <li><a href="shop3.html">Shop — with Sidebar</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- end col-6 -->
                </div>
                <!-- end row -->
              </li>
            </ul>
          </li>
          <li class="dropdown megamenu-fw">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages</a>
            <ul class="dropdown-menu megamenu-content" role="menu">
              <li>
                <div class="row">
                  <div class="col-menu col-md-3">
                    <h6 class="title">Categories</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-detail2.html">Shop — Catalog</a></li>
                        <li><a href="shop-detail1.html">Shop — Categories Grid</a></li>
                        <li><a href="shop5.html">Shop — Product Category</a></li>
                        <li><a href="shop3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Checkout</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- end col-3 -->
                  <div class="col-menu col-md-3">
                    <h6 class="title">Products demos</h6>
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
                  </div>
                  <!-- end col-3 -->
                  <div class="col-menu col-md-3">
                    <h6 class="title">Shop Pages</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-detail1.html">Shop — Categories Grid</a></li>
                        <li><a href="shop5.html">Shop — Product Category</a></li>
                        <li><a href="shop3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Order Tracking</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-menu col-md-3">
                    <div class="content">
                      <div class="image">
                        <img src="${PATH}/pages/static/images/menu.jpg" alt="menu">
                        <div class="centered text-center">
                          <h4 class="text-uppercase">Deal of the week</h4>
                          <a href="#." class="btn_shop text-uppercase">Shop now</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- end col-3 -->
                </div>
                <!-- end row -->
              </li>
            </ul>
          </li>
          <li><a href="blog.html">Blog</a></li>
          <li class="dropdown megamenu-fw">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Elements</a>
            <ul class="dropdown-menu megamenu-content" role="menu">
              <li>
                <div class="row">
                  <div class="col-menu col-md-3">
                    <h6 class="title">Categories</h6>
                    <div class="content">
                      <ul class="menu-col">
                        <li><a href="shop-recent1.html">Shop — Catalog</a></li>
                        <li><a href="shop-recent2.html">Shop — Categories Grid</a></li>
                        <li><a href="shop5.html">Shop — Product Category</a></li>
                        <li><a href="shop-recent3.html">Shop — with Sidebar</a></li>
                        <li><a href="wishlist.html">Shopping Cart</a></li>
                        <li><a href="shop-cart.html">Checkout</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- end col-3 -->
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
                  <!-- end col-3 -->
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
                  <!-- end col-3 -->
                </div>
                <!-- end row -->
              </li>
            </ul>
          </li>
          <li><a href="#">Demos</a></li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
  </nav>
</header>