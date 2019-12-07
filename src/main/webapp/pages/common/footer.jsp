<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer id="footer" class="footer padding_t clearfix">
  <div class="container footerBg">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="text-uppercase bottom10">鉴定商品真伪查询</h2>
        <p class="heading_space">Get 10% off your first purchase. by subscribing to our Newsletter.</p>
        <div class="row">
          <div class="col-sm-2"></div>
          <div class="col-sm-8">
            <form>
              <div class="input-group">
                <input type="text" id="waresIdentInput" class="form-control" placeholder="请输入鉴定码" required>
                <span class="input-group-btn">
                <button id="findApprWareByIdent" type="button"><i class="icon-arrow-right2"></i></button>
                </span>
              </div>
            </form>
          </div>
          <div class="col-sm-2"></div>
        </div>
        <ul class="simple_breadcrumb padding">
          <li><a href="#.">Shop Now</a></li>
          <li><a href="#.">The Story</a></li>
          <li><a href="#.">Lookbook</a></li>
          <li><a href="#.">Life Style </a></li>
          <li><a href="#.">Blog</a></li>
          <li><a href="#.">Contact Us</a></li>
          <li><a href="#.">Privacy Policy</a></li>
        </ul>
        <ul class="social">
          <li><a href="#."><i class="icon-facebook-1"></i></a></li>
          <li><a href="#."><i class="icon-pinterest"></i></a></li>
          <li><a href="#."><i class="icon-twitter"></i></a></li>
          <li><a href="#."><i class="icon-google4"></i></a></li>
          <li><a href="#."><i class="icon-instagram"></i></a></li>
        </ul>
        <p class="heading_space top15 copyright-text">Copyright &copy; 2017 Empor. All right reserved. Designed by<a href="#."> Brighthemes</a></p>
      </div>
    </div>
  </div>
</footer>
<link href="${PATH}/static/layui/css/layui.css" rel='stylesheet'
	type='text/css' />
<!-- 模态框 -->
<div id="rachargeModal" style="display: none;">
	<fieldset class="layui-elem-field layui-field-title" style="margin: 30px auto;width: 700px">
  		<legend>
  			<div>
  				<h4>鉴定码：<span id="apprIdentSpan"></span></h4><br>
  				<h4>鉴定人：<span id="custNickSpan"></span></h4><br>
  				<h4>鉴定师：<span id="appraisalSpan"></span></h4><br>
  				<h4>鉴定结果：<span style="color: red" id="apprResultSpan"></span></h4>
  			</div>
  		</legend>
	</fieldset>
</div>
<script src="${PATH}/pages/static/js/jquery.2.2.3.min.js"></script>
<script src="${PATH}/static/layer/layer.js"></script>
<script type="text/javascript">
	$("#findApprWareByIdent").click(function(){
		var ident = $("#waresIdentInput").val();
		if(ident==""){
			layer.msg("请输入鉴定码！");
			return false;
		}
		$.ajax({
			url:"${PATH}/askAppraisal/findWaresByIdent/"+ident,
			method:"get",
			success:function(res){
				console.log(res)
				if(res.code==100){
					$("#apprIdentSpan").html(res.extend.appr.askIdent);
					$("#custNickSpan").html(res.extend.appr.custNick);
					$("#appraisalSpan").html(res.extend.appr.apprNick);
					$("#apprResultSpan").html(res.extend.appr.askState);
					layer.open({
						type : 1,//类型
						area : [ '800px', '300px' ],//定义宽和高
						title : '鉴定商品查询',//题目
						anim: 6,
						resize :false,
						move :false,
						shadeClose : false,//点击遮罩层关闭
						content : $('#rachargeModal'),
						cancel: function(index, layero){ 
							 $("#rachargeModal").css("display","none")
						} 
					});
				}else{
					layer.msg("未查询到鉴定商品信息!",function(){
						//location.reload()    
					})
					
				}
			},error:function(){
				layer.msg("系统错误！")				
			}
		})
	});
</script>

