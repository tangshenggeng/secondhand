package com.xyl.appraisal.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.appraisal.beans.ApprBrand;
import com.xyl.appraisal.beans.ApprSort;
import com.xyl.appraisal.beans.Appraisal;
import com.xyl.appraisal.service.ApprBrandService;
import com.xyl.appraisal.service.ApprSortService;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.brandAndSort.beans.Brand;
import com.xyl.brandAndSort.beans.Sort;
import com.xyl.brandAndSort.service.BrandService;
import com.xyl.brandAndSort.service.SortService;
import com.xyl.code.beans.RegiterCode;
import com.xyl.code.service.RegiterCodeService;
import com.xyl.cust.beans.Cust;
import com.xyl.integral.beans.FlowAppr;
import com.xyl.integral.service.FlowApprService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
import com.xyl.utils.ConstantUtils;
import com.xyl.utils.EmailUntils;
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
	private ApprBrandService brandMidSer;		//品牌中间表
	
	@Autowired
	private ApprSortService sortMidSer;		//分类中间表
	
	@Autowired
	private BrandService brandSer;			//品牌表
	
	@Autowired
	private SortService sortSer;			//分类表
	
	@Autowired
	private FlowApprService flowSer;		//积分流动
	
	/**
	 * 根据id查询客户
	 * */
	@RequestMapping(value="/getById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id")Integer id) {
		Appraisal appr = apprSer.selectById(id);
		return Msg.success().add("appr", appr);
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delApprByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = apprSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 批量通过
	 * */
	@RequestMapping(value="/agreeApprByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg agreeApprByIds(@RequestBody ArrayList<Integer> list) {
		List<Appraisal> selectBatchIds = apprSer.selectBatchIds(list);
		selectBatchIds.forEach(apprs -> apprs.setApprState("通过"));
		boolean b = apprSer.updateBatchById(selectBatchIds);
		if(b) {
			String[] emails = new String[selectBatchIds.size()];
			for (int i = 0; i < selectBatchIds.size(); i++) {
				emails[i] = selectBatchIds.get(i).getApprEmail();
			}
			EmailUntils.sendEmails(emails, "success");
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 批量异常
	 * */
	@RequestMapping(value="/exceptionApprByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg exceptionApprByIds(@RequestBody ArrayList<Integer> list) {
		List<Appraisal> selectBatchIds = apprSer.selectBatchIds(list);
		selectBatchIds.forEach(apprs -> apprs.setApprState("异常"));
		boolean b = apprSer.updateBatchById(selectBatchIds);
		if(b) {
			String[] emails = new String[selectBatchIds.size()];
			for (int i = 0; i < selectBatchIds.size(); i++) {
				emails[i] = selectBatchIds.get(i).getApprEmail();
			}
			EmailUntils.sendEmails(emails, "fail");
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 批量恢复
	 * */
	@RequestMapping(value="/recoveryApprByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg recoveryApprByIds(@RequestBody ArrayList<Integer> list) {
		List<Appraisal> selectBatchIds = apprSer.selectBatchIds(list);
		selectBatchIds.forEach(apprs -> apprs.setApprState("通过"));
		boolean b = apprSer.updateBatchById(selectBatchIds);
		if(b) {
			String[] emails = new String[selectBatchIds.size()];
			for (int i = 0; i < selectBatchIds.size(); i++) {
				emails[i] = selectBatchIds.get(i).getApprEmail();
			}
			EmailUntils.sendEmails(emails, "success");
			return Msg.success().add("msg", "成功");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 批量升级
	 * */
	@RequestMapping(value="/vipApprByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg vipApprByIds(@RequestBody ArrayList<Integer> list) {
		List<Appraisal> selectBatchIds = apprSer.selectBatchIds(list);
		selectBatchIds.forEach(apprs -> apprs.setApprVip("金牌鉴定师"));
		boolean b = apprSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 得到品牌和分类
	 * */
	@RequestMapping(value="/getByApprIdent/{ident}")
	@ResponseBody
	public HashMap<String, List<String>> getByApprIdent(@PathVariable("ident")String ident){
		HashMap<String, List<String>> hashMap = new HashMap<>();
		//品牌
		List<ApprBrand> listBrandMid = brandMidSer.selectList(new EntityWrapper<ApprBrand>().eq("appr_ident", ident));
		ArrayList<Integer> brandIds = new ArrayList<>();
		listBrandMid.forEach(list -> brandIds.add(list.getBrandId()));
		List<Brand> selectBatchIds = brandSer.selectBatchIds(brandIds);
		ArrayList<String> brandName = new ArrayList<>();
		selectBatchIds.forEach(brand -> brandName.add(brand.getBrandName()));
		//分类
		List<ApprSort> listSortMid = sortMidSer.selectList(new EntityWrapper<ApprSort>().eq("appr_ident", ident));
		ArrayList<Integer> sortIds = new ArrayList<>();
		listSortMid.forEach(list -> sortIds.add(list.getSortId()));
		List<Sort> selectIds = sortSer.selectBatchIds(sortIds);
		ArrayList<String> sortName = new ArrayList<>();
		selectIds.forEach(brand -> sortName.add(brand.getSortName()));
		hashMap.put("brand", brandName);
		hashMap.put("sort", sortName);
		return hashMap;
	}
	
	/**
	 * 得到所有的鉴定师(待审核)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getMemberApprList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMemberApprList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		Wrapper<Appraisal> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("appr_ident", formCode).or().like("appr_nick", formCode)
					.or().like("appr_name", formCode).or().like("appr_email", formCode)
					.like("appr_remark", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		wrapper.eq("appr_state","待审核");
		Page<Map<String, Object>> mapsPage = apprSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有待审核鉴定师");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的鉴定师(异常)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getExceptionApprList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExceptionApprList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		Wrapper<Appraisal> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("appr_ident", formCode).or().like("appr_nick", formCode)
			.or().like("appr_name", formCode).or().like("appr_email", formCode)
			.like("appr_remark", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		wrapper.eq("appr_state","异常");
		Page<Map<String, Object>> mapsPage = apprSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有待审核鉴定师");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的鉴定师(已通过)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getAgreeApprList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAgreeApprList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		Wrapper<Appraisal> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("appr_ident", formCode).or().like("appr_nick", formCode)
			.or().like("appr_name", formCode).or().like("appr_email", formCode)
			.like("appr_remark", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		wrapper.eq("appr_state","通过");
		Page<Map<String, Object>> mapsPage = apprSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有通过鉴定师");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
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
		.eq("appr_email",app.getFormCode()).andNew().eq("appr_state","通过");
		Appraisal one = apprSer.selectOne(wrapper);
		if(one==null) {
			model.addAttribute("nameError", "用户名或密码错误或还在审核");
			return "forward:/pages/appraisal/login.jsp";
		}
		model.addAttribute("appr", one);
		return "forward:/pages/appraisal/appr-info.jsp";
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
			brandMidSer.insertBatch(brandList);
			ArrayList<ApprSort> sortList = new ArrayList<>();
			for (Integer integer : sorts) {
				ApprSort sort = new ApprSort();
				sort.setApprIdent(ident);
				sort.setSortId(integer);;
				sortList.add(sort);
			}
			sortMidSer.insertBatch(sortList);
			model.addAttribute("msg", "注册成功！请耐心等待管理员审核！");
			return "forward:/pages/appraisal/regiter.jsp";
		}
		model.addAttribute("regiterError", "注册失败！");
		return "forward:/pages/appraisal/regiter.jsp";
	}
	/**
	 * 修改
	 * */
	@RequestMapping(value="/editInfoByAppr",method=RequestMethod.POST)
	@ResponseBody
	private Msg editAppr(Appraisal app) {
		//验证两次输入的密码
		if(!app.getFormPwd1().equals("")||!app.getFormPwd2().equals("")) {
			if(!app.getFormPwd1().equals(app.getFormPwd2())) {
				return Msg.fail().add("msg", "两次密码不一致！");
			}else {
				app.setApprPwd(app.getFormPwd2());
			}
		}
		if(app.getApprHeader().equals("")) {
			app.setApprHeader(null);
		}
		if(app.getApprNick().equals("")) {
			app.setApprNick(null);
		}
//		if(app.getApprPrice().equals("")) {
//			app.setApprPrice(null);
//		}
		if(app.getApprRemark().equals("")) {
			app.setApprRemark(null);
		}
		if(app.getBrands()!=null) {
			brandMidSer.delete(new EntityWrapper<ApprBrand>().eq("appr_ident", app.getApprIdent()));
			List<Integer> brands = app.getBrands();
			ArrayList<ApprBrand> brandList = new ArrayList<>();
			for (Integer integer : brands) {
				ApprBrand brand = new ApprBrand();
				brand.setApprIdent(app.getApprIdent());
				brand.setBrandId(integer);
				brandList.add(brand);
			}
			brandMidSer.insertBatch(brandList);
		}
		if(app.getSorts()!=null) {
			sortMidSer.delete(new EntityWrapper<ApprSort>().eq("appr_ident", app.getApprIdent()));
			List<Integer> sorts = app.getSorts();
			ArrayList<ApprSort> sortList = new ArrayList<>();
			for (Integer integer : sorts) {
				ApprSort sort = new ApprSort();
				sort.setApprIdent(app.getApprIdent());
				sort.setSortId(integer);;
				sortList.add(sort);
			}
			sortMidSer.insertBatch(sortList);
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", app.getApprEmail())
		.eq("code", app.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			return Msg.fail().add("msg", "验证码有误！");
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		boolean b = apprSer.updateById(app);
		if(b) {
			return Msg.success().add("msg", "修改成功！请重新登录！");
		}
		return Msg.fail().add("msg", "修改失败！");
	}
	/**
	 * 上传头像
	 * @return 
	 * */
	@RequestMapping(value="/uploadHeaderImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadHeaderImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, ConstantUtils.HEADER_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String url = "/file/header/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", url);
		return resultMap;
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
	//=============页面跳转====================
	//待审核界面
	@RequestMapping(value="/toListMemberPage",method=RequestMethod.GET)
	public String toListMemberPage() {
		return "/appraisal/list-member";
	}
	//通过界面
	@RequestMapping(value="/toListAgreePage",method=RequestMethod.GET)
	public String toListAgreePage() {
		return "/appraisal/list-agree";
	}
	//异常界面
	@RequestMapping(value="/toListExceptionPage",method=RequestMethod.GET)
	public String toListExceptionPage() {
		return "/appraisal/list-exception";
	}
	/**
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/pages/index.jsp";
	}
	//判断是否有重复注册
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
}

