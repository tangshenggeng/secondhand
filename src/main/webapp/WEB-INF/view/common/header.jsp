<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${PATH}/admin/index">遇您识货后台</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.admin}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <!-- <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li> -->
                        <li>
                            <a href="${PATH}/admin/loginOut"><i class="fa fa-fw fa-power-off"></i>退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="${PATH}/admin/index"><i class="fa fa-fw fa-dashboard"></i> 导航</a>
                    </li>
                    <!-- <li>
                        <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li> -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="glyphicon glyphicon-user"></i> 客户管理<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="${PATH}/cust/toAddCustPage">添加客户</a>
                            </li>
                            <li>
                                <a href="${PATH}/cust/toListMemberPage">普通客户</a>
                            </li>
                            <li>
                                <a href="${PATH}/cust/toListVIPPage">会员客户</a>
                            </li>
                            <li>
                                <a href="${PATH}/cust/toListExceptionPage">异常客户</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#appr"><i class="glyphicon glyphicon-user"></i> 技师管理<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="appr" class="collapse">
                            <li>
                                <a href="${PATH}/appraisal/toListMemberPage">待审核鉴定师</a>
                            </li>
                            <li>
                                <a href="${PATH}/appraisal/toListAgreePage">已通过鉴定师</a>
                            </li>
                            <li>
                                <a href="${PATH}/appraisal/toListExceptionPage">异常鉴定师</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#integral"><i class="glyphicon glyphicon-usd"></i> 积分订单管理<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="integral" class="collapse">
                            <li>
                                <a href="${PATH}/rechargeCust/toWaitRechargePage">客户积分订单</a>
                            </li>
                            <li>
                                <a href="${PATH}/rechargeCust/toExceptionRechargePage">客户异常积分订单</a>
                            </li>
                           <%--  <li>
                                <a href="${PATH}/rechargeCust/toWaitRechargePage">鉴定师积分订单</a>
                            </li>
                            <li>
                                <a href="${PATH}/rechargeCust/toExceptionRechargePage">鉴定师异常积分订单</a>
                            </li> --%>
                            <li>
                                <a href="${PATH}/cashAppr/toCashPage">申请提现订单</a>
                            </li>
                            <li>
                                <a href="${PATH}/cashAppr/toSuccessCashPage">完成提现订单</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#brandAndSort"><i class="glyphicon glyphicon-th-list"></i> 品牌和分类管理<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="brandAndSort" class="collapse">
                            <li>
                                <a href="${PATH}/brand/toAddBrandPage">添加品牌</a>
                            </li>
                            <li>
                                <a href="${PATH}/brand/toBrandListPage">品牌列表</a>
                            </li>
                            <li>
                                <a href="${PATH}/sort/toSortListPage">分类管理</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>