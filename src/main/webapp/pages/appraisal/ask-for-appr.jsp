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
<title>求鉴定</title>

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
     	
        <li role="presentation" class="active"><a href="#registered" aria-controls="registered" role="tab" data-toggle="tab">求鉴定商品信息</a></li>
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="registered">
          <form class="callus"  id="askApprForm">
          <input type="hidden"  name="custId" value="${sessionScope.id}" id="custIdInput"/>
          <input type="hidden"  name="custNick" value="${sessionScope.nick}"/>
          <input type="hidden"  name="apprId" value="${appr.apprerId }" id="apprIdInput"/>
          <input type="hidden"  name="apprIdent" value="${appr.apprIdent}"/>
          <input type="hidden"  name="apprNick" value="${appr.apprNick}"/>
          <input type="hidden"  name="apprPrice" value="${appr.apprPrice}"/>
          <input type="hidden"  name="waresImgOne" id="askImgOne"/>
          <input type="hidden"  name="waresImgTwo" id="askImgTwo"/>
          <input type="hidden"  name="waresImgThree" id="askImgThree"/>
            <div class="form-group">
              <label>商品名</label>
              <input type="text" class="form-control" name="waresName" placeholder="请输入">
            </div>
            <div class="form-group">
              <label>价格(积分)</label>
              <input type="text" class="form-control" readonly="readonly" value="${appr.apprPrice}">
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
              <label>备注</label>
              <textarea  name="waresRemark" class="form-control" placeholder="请输入"></textarea>
            </div>
            <button type="button" id="askApprBtn" class="btn btn_dark btn_full">确认</button>
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
var arrayObj = new Array();
layui.use(['upload','layer'], function(){
	  var $ = layui.jquery,
	  layer = layui.layer
	  ,upload = layui.upload;
	//多文件列表示例
	  var demoListView = $('#demoList')
	  ,uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: '${PATH}/askAppraisal/uploadAskImg'
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
$("#askApprBtn").click(function(){
	
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
		var apprId = $("#apprIdInput").val();
		if(custId==""||apprId==""){
			layer.msg("登录超时！请重新登录！")
			return false;
		}
		$("#askImgOne").val(arrayObj[0]);
		$("#askImgTwo").val(arrayObj[1]);
		$("#askImgThree").val(arrayObj[2]);	
		var data = $("#askApprForm").serialize();
		layer.confirm('确认鉴定了吗？会消耗积分的哟！', {icon: 3, title:'提示'}, function(index){
			$.ajax({
				url:"${PATH}/askAppraisal/askApprByCust",
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
})
</script>
</html>