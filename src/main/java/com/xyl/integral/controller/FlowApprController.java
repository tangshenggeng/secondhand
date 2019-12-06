package com.xyl.integral.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyl.appraisal.beans.Appraisal;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.integral.beans.FlowAppr;
import com.xyl.integral.service.FlowApprService;
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
@RequestMapping("/flowAppr")
public class FlowApprController {

	@Autowired
	private AppraisalService apprSer;
	
	@Autowired
	private FlowApprService flowSer;
	
	/**
	 * 充值
	 * */
	@RequestMapping(value="/recharge",method=RequestMethod.GET)
	@ResponseBody
	public Msg recharge(@RequestParam("id")Integer id,@RequestParam("integral")Float integral
			,@RequestParam("money")Float money) {
		Appraisal appr = apprSer.selectById(id);
		Float old = appr.getApprIntegral();
		appr.setApprIntegral(old+integral);
		FlowAppr flow = new FlowAppr();
		flow.setApprId(id);
		flow.setFlowState("100");
		flow.setOldIntegral(old);
		flow.setFlowSort("充值");
		flow.setFlowIntegral(integral);
		flow.setNewIntegral(old+integral);
		flow.setFlowMoney(money);
		flowSer.insert(flow);		//充值记录
		boolean b = apprSer.updateById(appr);
		if(!b) {
			return Msg.fail().add("msg","充值失败！");
		}
		return Msg.success().add("msg", "充值成功！");
	}
	
	
}

