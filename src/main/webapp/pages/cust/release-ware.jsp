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
<title>发布商品</title>

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
     	
        <li role="presentation" class="active"><a href="#registered" aria-controls="registered" role="tab" data-toggle="tab">发布商品</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active">
          <form class="layui-form"  id="releaseWareForm">
          <input type="hidden"  name="custId" value="${sessionScope.id}" id="custIdInput"/>
          <input type="hidden"  name="custNick" value="${sessionScope.nick}"/>
          <input type="hidden"  name="imgOne" id="askImgOne"/>
          <input type="hidden"  name="imgTwo" id="askImgTwo"/>
          <input type="hidden"  name="imgThree" id="askImgThree"/>
            <div class="form-group">
              <label>商品名</label>
              <input type="text" class="form-control" required lay-verify="required" name="wareName" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>价格(积分)</label>
              <input type="number" class="form-control"  required lay-verify="required"  name="warePrice">
            </div>
            <div class="form-group">
               <div class="layui-form-item">
			    <label class="layui-form-label" style="width: 100px">是否鉴定:</label>
			    <div class="layui-input-inline">
			      <input type="checkbox"  lay-text="是|否" lay-skin="switch" lay-filter="isAppr">
			    </div>
			  </div>
            </div>
             <div class="form-group" id="apprIdentInput" style="display: none;">
              <label>鉴定码</label>
              <input type="hidden" name="isAppr" value="否"  id="isApprInput"/>
              <input type="text" class="form-control"  name="apprIdent">
            </div>
            <div class="form-group">
              <div class="layui-upload">
				  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
				  <div class="layui-upload-list">
				    <table class="layui-table">
				      <thead>
				        <tr><th>文件名</th>
				        <th>大小</th>
				        <th>预览</th>
				        <th>状态</th>
				        <th>操作</th>
				      </tr></thead>
				      <tbody id="demoList"></tbody>
				    </table>
				  </div>
				  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
				</div> 
            </div>
            <div class="form-group">
            	<h4 style="padding-bottom: 5px">鉴定专长：</h4>
				<div class="row" id="showBrandAndSorts">
					<div class="col-md-3 col-sm-6">
						<div class="emp_cate equal_inner">
							<h5 class="text-uppercase select-title">品牌</h5>
							<label class="clearfix" lay-ignore v-for="item in brands">
								<div class="squaredFour">
									<input lay-ignore :id="item.brandNumber"  :value="item.brandId" name="brands"  type="checkbox"> 
									<label lay-ignore :for="item.brandNumber"></label>
								</div>
								<h6 class="bottom5" v-text = 'item.brandName'></h6>
							</label> 
						</div>
					</div>
					<div class="col-md-3 col-sm-6"></div>
					<div class="col-md-3 col-sm-6">
						<div class="emp_cate equal_inner">
							<h5 class="text-uppercase select-title">分类</h5>
							<label class="clearfix" lay-ignore v-for="item in sorts">
								<div class="squaredFour">
									<input lay-ignore :id="item.sortId" :value="item.sortId" name="sorts"  type="checkbox"> 
									<label lay-ignore :for="item.sortId"></label>
								</div>
								<h6 class="bottom5" v-text = 'item.sortName'></h6>
							</label>
						</div>
					</div>
				</div>
				</div>
            	<div class="form-group">
              <label>备注</label>
              <textarea name="wareRemark"  required lay-verify="required"  placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
            <button type="button"  lay-submit lay-filter="releaseWareBtn" class="btn btn_dark btn_full">确认</button>
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
layui.use('form', function(){
	var form = layui.form;
	form.on('switch(isAppr)', function(data){
		  if(data.elem.checked==true){
			  $("#apprIdentInput").css("display","")
			  $("#isApprInput").val("是")
		  }else{
			  $("#apprIdentInput").css("display","none")
			   $("#isApprInput").val("否")
		  }
		  
	});  
})
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
var arrayObj = new Array();
layui.use(['upload','layer'], function(){
	  var $ = layui.jquery,
	  layer = layui.layer
	  ,upload = layui.upload;
	//多文件列表示例
	  var demoListView = $('#demoList')
	  ,uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: '${PATH}/releaseWares/uploadWareImg'
	    ,accept: 'file'
	    ,multiple: true
	    ,auto: false
	    ,bindAction: '#testListAction'
	    ,number:3
	    ,choose: function(obj){   
	      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	      //读取本地文件
	      obj.preview(function(index, file, result){
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	          ,'<td>'+ '<img style="width: 100px;height: 100px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'+'</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
	        });
	        
	        demoListView.append(tr);
	      });
	    },before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
	    	
	    }
	    ,done: function(res, index, upload){
	      if(res.code == 0){ //上传成功
	    	arrayObj.push(res.data)
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(3).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(4).html(''); //清空操作
	        tds.eq(5).html(''); //清空操作
	        return delete this.files[index]; //删除文件队列已经上传成功的文件
	      }
	      this.error(index, upload);
	    }
	    ,error: function(index, upload){
	      var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(3).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(4).find('.demo-reload').removeClass('layui-hide'); //显示重传
	    }
	  });
	  
})
layui.use(['form','layer'], function(){
	var form = layui.form,
	layer=layui.layer;
	form.on('submit(releaseWareBtn)', function(data){
		  layui.use('layer', function(){
				var $ = layui.jquery,
				  layer = layui.layer;
				if(arrayObj.length>3){
					layer.msg("只允许上传三张图片！")
					return false;
				}
				if(arrayObj.length==0){
					layer.msg("请确认上传图片！")
					return false;
				}
				var custId = $("#custIdInput").val();
				if(custId==""){
					layer.msg("登录超时！请重新登录！")
					return false;
				}
				$("#askImgOne").val(arrayObj[0]);
				$("#askImgTwo").val(arrayObj[1]);
				$("#askImgThree").val(arrayObj[2]);	
				var data = $("#releaseWareForm").serialize();
				layer.confirm('确认发布商品了吗？', {icon: 3, title:'提示'}, function(index){
					$.ajax({
						url:"${PATH}/releaseWares/releaseWaresByCust",
						method:"POST",
						data:data,
						success:function(res){
							if(res.code==100){
								layer.msg(res.extend.msg,{icon:6},function(){
									location.reload(true) 
								})
							}else{
								layer.msg(res.extend.msg,{icon:6})
							}
						},errror:function(){
							layer.msg("系统错误！")
						}
					});
					layer.close(index);
				});
				
			})
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
})


</script>
</html>