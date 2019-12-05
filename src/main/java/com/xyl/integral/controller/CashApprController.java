package com.xyl.integral.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyl.appraisal.beans.Appraisal;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.integral.beans.CashAppr;
import com.xyl.integral.service.CashApprService;
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
			return Msg.fail().add("msg","提现失败！");
		}
		return Msg.success().add("msg", "提现成功！请您耐心等待工作人员的审核。");
	}
}

