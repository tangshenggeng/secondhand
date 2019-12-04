package com.xyl.integral.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.integral.beans.RechargeCust;
import com.xyl.integral.service.RechargeCustService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
import com.xyl.utils.EmailUntils;
import com.xyl.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-28
 */
@Controller
@RequestMapping("/rechargeCust")
public class RechargeCustController {
	
	@Autowired
	private RechargeCustService rechargeSer;		//充值积分
	
	@Autowired
	private CustService custSer;
	
	
	/**
	 * 驳回消费
	 * */
	@RequestMapping(value="/exceptionRecharge",method=RequestMethod.POST)
	@ResponseBody
	public Msg rejectCash(@RequestBody Map map) {
		Integer custId = (Integer) map.get("rechargeCustId");
		Integer rechargeIntegral = (Integer) map.get("rechargeIntegral");
		Integer rechargeId = (Integer) map.get("rechargeId");
		String rechargeSort = (String) map.get("rechargeSort");
		Cust cust = custSer.selectById(custId);
		Float old = cust.getCustIntegral();	//得到客户的积分情况(避免客户下单了更新了积分)
		Cust errorCust = new Cust();		//更新技师积分
		float rollBackIntegral;
		if(rechargeSort.equals("充值")) {
			rollBackIntegral = old-rechargeIntegral;
		}else {
			rollBackIntegral = old+rechargeIntegral;
		}
		errorCust.setCustIntegral(rollBackIntegral);
		errorCust.setCustId(custId);
		boolean rollBACK = custSer.updateById(errorCust);	//对积分进行回滚
		if(!rollBACK) {
			return Msg.fail().add("msg", "操作失败！原因积分回滚失败！");
		}
		EmailUntils untils = new EmailUntils();
		if(rollBackIntegral<0) {
			untils.sendEmailsRollBack(cust.getCustEmail(), "true", map,rollBackIntegral);
		}else {
			untils.sendEmailsRollBack(cust.getCustEmail(), "false", map,rollBackIntegral);
		}
		RechargeCust rechargeCust = new RechargeCust();
		rechargeCust.setRechargeId(rechargeId);
		rechargeCust.setRechargeState("200");
		boolean b = rechargeSer.updateById(rechargeCust);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 恢复消费
	 * */
	@RequestMapping(value="/recoveryRecharge",method=RequestMethod.POST)
	@ResponseBody
	public Msg recoveryRecharge(@RequestBody Map map) {
		Integer custId = (Integer) map.get("rechargeCustId");
		Integer rechargeIntegral = (Integer) map.get("rechargeIntegral");
		Integer rechargeId = (Integer) map.get("rechargeId");
		String rechargeSort = (String) map.get("rechargeSort");
		Cust cust = custSer.selectById(custId);
		Float old = cust.getCustIntegral();	//得到客户的积分情况(避免客户下单了更新了积分)
		Cust errorCust = new Cust();		//更新技师积分
		float rollBackIntegral;
		if(rechargeSort.equals("充值")) {
			rollBackIntegral = old+rechargeIntegral;
		}else {
			rollBackIntegral = old-rechargeIntegral;
		}
		errorCust.setCustIntegral(rollBackIntegral);
		errorCust.setCustId(custId);
		boolean rollBACK = custSer.updateById(errorCust);	//对积分进行回滚
		if(!rollBACK) {
			return Msg.fail().add("msg", "操作失败！原因积分回滚失败！");
		}
		RechargeCust rechargeCust = new RechargeCust();
		rechargeCust.setRechargeId(rechargeId);
		rechargeCust.setRechargeState("100");
		boolean b = rechargeSer.updateById(rechargeCust);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delRechargeByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = rechargeSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	
	
	/**
	 * 得到所有客户充值或消费状态
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getRechargeList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRechargeList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<RechargeCust> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		String sort = (String) afterMap.get("sort");
		if(!sort.equals("0")) {
			wrapper.eq("recharge_sort", sort);
		}
		if(!name.equals("")) {
			List<Integer> custIds = getCustId(name); //如果输入了客户名，通过客户名得到技师id
			wrapper.in("recharge_cust_id", custIds);
		}
		
		String start_money = (String) afterMap.get("start_money");
		String end_money = (String) afterMap.get("end_money");
		if(!start_money.equals("") && !end_money.equals("")) {
			Float start = Float.parseFloat(start_money);
			Float end = Float.parseFloat(end_money);
			wrapper.between("recharge_money", start, end);
		}
		String rechargeState = (String) afterMap.get("rechargeState");
		wrapper.eq("recharge_state","100");
		Page<Map<String, Object>> selectMapsPage = rechargeSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有同意的交易");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有客户充值或消费状态
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getExceptionRechargeList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExceptionRechargeList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<RechargeCust> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		String sort = (String) afterMap.get("sort");
		if(!sort.equals("0")) {
			wrapper.eq("recharge_sort", sort);
		}
		if(!name.equals("")) {
			List<Integer> custIds = getCustId(name); //如果输入了客户名，通过客户名得到技师id
			wrapper.in("recharge_cust_id", custIds);
		}
		
		String start_money = (String) afterMap.get("start_money");
		String end_money = (String) afterMap.get("end_money");
		if(!start_money.equals("") && !end_money.equals("")) {
			Float start = Float.parseFloat(start_money);
			Float end = Float.parseFloat(end_money);
			wrapper.between("recharge_money", start, end);
		}
		String rechargeState = (String) afterMap.get("rechargeState");
		wrapper.eq("recharge_state","200");
		Page<Map<String, Object>> selectMapsPage = rechargeSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有异常的交易");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	private List<Integer> getCustId(String name) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.like("cust_name", name).orNew().like("cust_nick", name).orNew().like("cust_email", name);
		List<Cust> list = custSer.selectList(wrapper);
		ArrayList<Integer> custIds = new ArrayList<>();
		for (Cust cust : list) {
			custIds.add(cust.getCustId());
		}
		return custIds;
	}


	//=======页面跳转=========
	@RequestMapping(value="/toWaitRechargePage",method=RequestMethod.GET)
	public String toCustIntegralPage() {
		return "/integral/wait-recharge";
	}
	@RequestMapping(value="/toExceptionRechargePage",method=RequestMethod.GET)
	public String toExceptionRechargePage() {
		return "/integral/exception-recharge";
	}
	
}

