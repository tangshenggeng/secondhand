package com.xyl.integral.controller;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.appraisal.beans.Appraisal;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.cust.beans.Cust;
import com.xyl.integral.beans.CashAppr;
import com.xyl.integral.beans.RechargeCust;
import com.xyl.integral.service.CashApprService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
import com.xyl.utils.EmailUntils;
import com.xyl.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-05
 */
@Controller
@RequestMapping("/cashAppr")
public class CashApprController {
	
	@Autowired
	private CashApprService cashSer;
	
	@Autowired
	private AppraisalService apprSer;
	
	/**
	 * 提现异常
	 * */
	@RequestMapping(value="/exceptionCash",method=RequestMethod.POST)
	@ResponseBody
	public Msg rejectCash(@RequestBody Map map) {
		Integer apprId = (Integer) map.get("apprId");
		Integer cashIntegral = (Integer) map.get("cashIntegral");
		Integer cashId = (Integer) map.get("cashId");
		Appraisal appraisal = apprSer.selectById(apprId);
		appraisal.setApprIntegral(appraisal.getApprIntegral()+cashIntegral);
		boolean a = apprSer.updateById(appraisal);
		
		EmailUntils untils = new EmailUntils();
		untils.cashSuccessOrFail(appraisal.getApprEmail(), "fail", map);
		
		CashAppr cashAppr = cashSer.selectById(cashId);
		cashAppr.setCashState("200");
		boolean b = cashSer.updateById(cashAppr);
		if(b&&a) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 提现成功
	 * */
	@RequestMapping(value="/successCash",method=RequestMethod.POST)
	@ResponseBody
	public Msg successCash(@RequestBody Map map) {
		Integer apprId = (Integer) map.get("apprId");
		Integer cashId = (Integer) map.get("cashId");
		String cashState = (String) map.get("cashState");
		if(cashState.equals("异常")){
			return Msg.fail().add("msg","当前订单已经是异常状态！无法成功！");
		}
		Appraisal appraisal = apprSer.selectById(apprId);
		
		EmailUntils untils = new EmailUntils();
		untils.cashSuccessOrFail(appraisal.getApprEmail(), "success", map);
		
		CashAppr cashAppr = cashSer.selectById(cashId);
		cashAppr.setCashState("300");
		boolean b = cashSer.updateById(cashAppr);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}

	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delCashByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCashByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = cashSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 得到所有鉴定师的提现申请和拒绝
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getCashList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRechargeList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<CashAppr> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		String sort = (String) afterMap.get("sort");
		if(!sort.equals("0")) {
			wrapper.eq("cash_way", sort);
		}
		if(!name.equals("")) {
			EntityWrapper<Appraisal> entityWrapper = new EntityWrapper<>();
			entityWrapper.like("appr_ident", name).or().like("appr_nick", name).or()
			.like("appr_name", name).or().like("appr_email",name);
			List<Appraisal> selectList = apprSer.selectList(entityWrapper);
			ArrayList<Integer> list = new ArrayList<>();
			selectList.forEach(apprs -> list.add(apprs.getApprerId()));
			wrapper.like("cash_account", name).or().in("appr_id", list);
		}
		String start_money = (String) afterMap.get("start_money");
		String end_money = (String) afterMap.get("end_money");
		if(!start_money.equals("") && !end_money.equals("")) {
			Float start = Float.parseFloat(start_money);
			Float end = Float.parseFloat(end_money);
			wrapper.between("cash_money", start, end);
		}
		wrapper.ne("cash_state","300");
		Page<Map<String, Object>> selectMapsPage = cashSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有申请和驳回的提现");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有鉴定师的提现申请和拒绝
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getSuccessCashList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSuccessCashList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<CashAppr> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		String sort = (String) afterMap.get("sort");
		if(!sort.equals("0")) {
			wrapper.eq("cash_way", sort);
		}
		if(!name.equals("")) {
			EntityWrapper<Appraisal> entityWrapper = new EntityWrapper<>();
			entityWrapper.like("appr_ident", name).or().like("appr_nick", name).or()
			.like("appr_name", name).or().like("appr_email",name);
			List<Appraisal> selectList = apprSer.selectList(entityWrapper);
			ArrayList<Integer> list = new ArrayList<>();
			selectList.forEach(apprs -> list.add(apprs.getApprerId()));
			wrapper.like("cash_account", name).or().in("appr_id", list);
		}
		String start_money = (String) afterMap.get("start_money");
		String end_money = (String) afterMap.get("end_money");
		if(!start_money.equals("") && !end_money.equals("")) {
			Float start = Float.parseFloat(start_money);
			Float end = Float.parseFloat(end_money);
			wrapper.between("cash_money", start, end);
		}
		wrapper.eq("cash_state","300");
		Page<Map<String, Object>> selectMapsPage = cashSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有完成的提现");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 提现
	 * */
	@RequestMapping(value="/cashIntegral",method=RequestMethod.POST)
	@ResponseBody
	public Msg cashIntegral(CashAppr cash) {
		if(cash.getCashWay().equals("0")) {
			return Msg.fail().add("msg", "请选择提现方式！");
		}
		Appraisal appr = apprSer.selectById(cash.getApprId());
		Float oldIntegral = appr.getApprIntegral();
		Float cashIntegral = cash.getCashIntegral();
		Float nowIntegral = oldIntegral-cashIntegral;
		if(nowIntegral<0) {
			return Msg.fail().add("msg", "提现积分超额！");
		}
		appr.setApprIntegral(nowIntegral);
		appr.setApprerId(cash.getApprId());
		apprSer.updateById(appr);
		cash.setCashState("100");
		cash.setNewIntegral(nowIntegral);
		boolean b = cashSer.insert(cash);
		if(!b) {
			return Msg.fail().add("msg","申请提现失败！");
		}
		return Msg.success().add("msg", "提现成功！请您耐心等待工作人员的审核。");
	}
	
	//=========页面跳转=================
	//去往鉴定师提现订单页面
	@RequestMapping(value="/toCashPage",method=RequestMethod.GET)
	public String toCashPage() {
		return "/integral/cash-list";
	}
	//去往鉴定师完成提现订单页面
	@RequestMapping(value="/toSuccessCashPage",method=RequestMethod.GET)
	public String toSuccessCashPage() {
		return "/integral/cash-success-list";
	}
}

