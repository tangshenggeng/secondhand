<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

   
<!--Shopping Cart-->
<div id="sidebar-wrapper">
   <ul class="nav sidebar-nav">
      <li class="tablecart">
         <div class="photo">
            <a href="#">
               <img src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
            </a>
         </div>

         <div class="cartbody">
            <h5>Little Barrel in White</h5>
            <span>1 × $1,288.00</span>
            <i class="fa fa-close cross"></i>
         </div>
      </li>
      <li class="tablecart">
         <div class="photo">
            <a href="#">
               <img src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
            </a>
         </div>
         <div class="cartbody">
            <h5>Little Barrel in White</h5>
            <span>1 × $1,288.00</span>
            <i class="fa fa-close cross"></i>
         </div>
      </li>
      <li class="tablecart">
         <div class="photo">
            <a href="#">
               <img src="${PATH}/pages/static/images/tablecart1.jpg" alt="">
            </a>
         </div>
         <div class="cartbody">
            <h5>Little Barrel in White</h5>
            <span>1 × $1,288.00</span>
            <i class="fa fa-close cross"></i>
         </div>
      </li>
      <%-- <li class="text-center margin40 top40">
         <div class="image-cart bottom10">
            <img src="${PATH}/pages/static/images/shopping-cart.png" alt="">
         </div>
         <h4 class="text-uppercase">no products in the cart.</h4>
      </li> --%>
   </ul>
   <div class="cart-bottom clearfix">
      <h5 class="pull-left top10 bottom10">SUBTOTAL</h5>
      <h5 class="pull-right top10 bottom10">$1,798.00</h5>
      <div class="clearfix"></div>
      <a class="btn btn_dark button_moema">view cart</a>
      <a class="btn btn_colored button_moema">Checkout</a>
   </div>
</div>
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