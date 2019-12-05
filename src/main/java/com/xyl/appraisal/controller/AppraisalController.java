package com.xyl.appraisal.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.xyl.appraisal.beans.ApprBrand;
import com.xyl.appraisal.beans.ApprSort;
import com.xyl.appraisal.beans.Appraisal;
import com.xyl.appraisal.service.ApprBrandService;
import com.xyl.appraisal.service.ApprSortService;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.code.beans.RegiterCode;
import com.xyl.code.service.RegiterCodeService;
import com.xyl.integral.beans.FlowAppr;
import com.xyl.integral.service.FlowApprService;
import com.xyl.utils.ConstantUtils;
import com.xyl.utils.EmailUntils;
import com.xyl.utils.ExamineChinese;
import com.xyl.utils.Msg;
import com.xyl.utils.UUIDUtil;
import com.xyl.utils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-05
 */
@Controller
@RequestMapping("/appraisal")
public class AppraisalController {

	@Autowired
	private AppraisalService apprSer;		//鉴定师
	
	@Autowired
	private RegiterCodeService regiterCodeSer; //校验码
	
	@Autowired
	private ApprBrandService brandSer;		//品牌中间表
	
	@Autowired
	private ApprSortService sortSer;		//分类中间表
	
	@Autowired
	private FlowApprService flowSer;		//积分流动
	
	/**
	 * 升级为金牌鉴定员
	 * 
	 * */
	@RequestMapping(value="/upgradeVIP/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg upgradeVIP(@PathVariable("id")Integer apprid,Model model) {
		Appraisal appr = apprSer.selectById(apprid);
		Float old = appr.getApprIntegral();
		if(old<500f) {
			return Msg.fail().add("msg","对不起！您的积分不足！请先充值！");
		}
		if(appr.getApprVip().equals("金牌鉴定员")) {
			return Msg.fail().add("msg","您已经是金牌鉴定师啦！");
		}
		appr.setApprIntegral(old-500);
		appr.setApprVip("金牌鉴定员");
		FlowAppr flow = new FlowAppr();
		flow.setApprId(apprid);
		flow.setFlowState("100");
		flow.setFlowSort("消费");
		flow.setOldIntegral(old);
		flow.setFlowIntegral(500.0f);
		flow.setNewIntegral(old-500);
		flow.setFlowMoney(50f);
		flowSer.insert(flow);		//消费记录
		boolean b = apprSer.updateById(appr);
		EmailUntils utils = new EmailUntils();
		utils.addOrder(appr.getApprEmail(), "升级金牌鉴定师", 500f, old-500);
		if(!b) {
			return Msg.fail().add("msg","升级失败！");
		}
		model.addAttribute("appr.apprVip", "金牌鉴定师");
		return Msg.success().add("msg", "升级成功！");
	}
	
	/**
	 * 登录
	 * */
	@RequestMapping(value="/loginInto",method=RequestMethod.POST)
	public String loginInto(Appraisal app,Model model) {
		EntityWrapper<Appraisal> wrapper = new EntityWrapper<>();
		wrapper.eq("appr_pwd",app.getApprPwd())
		.andNew()
		.eq("appr_name", app.getFormCode())
		.or()
		.eq("appr_email",  app.getFormCode()).eq("appr_state","通过");
		Appraisal one = apprSer.selectOne(wrapper);
		if(one==null) {
			model.addAttribute("nameError", "用户名或密码错误");
			return "forward:/pages/appraisal/login.jsp";
		}
		model.addAttribute("appr", one);
		return "forward:/pages/appraisal/appr-info.jsp";
	}
	/**
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/pages/index.jsp";
	}
	/**
	 * 注册
	 * */
	@RequestMapping(value="/regiterAppr",method=RequestMethod.POST)
	private String regiterAppr(Appraisal app,Model model) {
		//验证两次输入的密码
		if(!app.getFormPwd1().equals(app.getFormPwd2())) {
			model.addAttribute("pwdError", "两次密码不一致！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		boolean chinese = ExamineChinese.isContainChinese(app.getApprName());
		if(chinese) {
			model.addAttribute("nameError", "用户名包含中文！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(app.getApprName(),app.getApprEmail());
		if(orNot) {
			model.addAttribute("apprError", "您已经注册过了！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", app.getApprEmail())
					.eq("code", app.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			model.addAttribute("codeError", "验证码有误！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		List<Integer> brands = app.getBrands();
		List<Integer> sorts = app.getSorts();
		if(brands.isEmpty()||sorts.isEmpty()) {
			model.addAttribute("unSele", "请选择您擅长的品牌以及分类！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		String ident = UUIDUtil.createUUID();
		Appraisal appr = new Appraisal();
		appr.setApprEmail(app.getApprEmail());
		appr.setApprHeader(app.getApprHeader());
		appr.setApprIdent(ident);
		appr.setApprIntegral(0f);
		appr.setApprName(app.getApprName());
		appr.setApprNick(app.getApprNick());
		appr.setApprNum(0);
		appr.setApprPhoto(app.getApprPhoto());
		appr.setApprPrice(0f);
		appr.setApprPwd(app.getFormPwd2());
		appr.setApprRemark(app.getApprRemark());
		appr.setApprState("待审核");
		appr.setApprVip("普通鉴定师");
		boolean b = apprSer.insert(appr);
		if(b) {
			ArrayList<ApprBrand> brandList = new ArrayList<>();
			for (Integer integer : brands) {
				ApprBrand brand = new ApprBrand();
				brand.setApprIdent(ident);
				brand.setBrandId(integer);
				brandList.add(brand);
			}
			brandSer.insertBatch(brandList);
			ArrayList<ApprSort> sortList = new ArrayList<>();
			for (Integer integer : sorts) {
				ApprSort sort = new ApprSort();
				sort.setApprIdent(ident);
				sort.setSortId(integer);;
				sortList.add(sort);
			}
			sortSer.insertBatch(sortList);
			model.addAttribute("msg", "注册成功！请耐心等待管理员审核！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		model.addAttribute("regiterError", "注册失败！");
		return "forward:/pages/appraisal/regiter.jsp";
	}
	
	private boolean repeatOrNot(String apprName, String apprEmail) {
		EntityWrapper<Appraisal> getCustWrapper = new EntityWrapper<>();
		getCustWrapper.eq("appr_name", apprEmail).orNew()
						.eq("appr_email", apprName);
		int count2 = apprSer.selectCount(getCustWrapper);
		if(count2 != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadApprPhoto",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadApprPhoto(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, ConstantUtils.APPRASISAL_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String url = "/file/appraisal/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", url);
		return resultMap;
	}
	
}

