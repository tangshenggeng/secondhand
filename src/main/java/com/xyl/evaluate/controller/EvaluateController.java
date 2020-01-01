package com.xyl.evaluate.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.xyl.cust.beans.Cust;
import com.xyl.evaluate.beans.Evaluate;
import com.xyl.evaluate.service.EvaluateService;
import com.xyl.order.beans.Order;
import com.xyl.order.service.OrderService;
import com.xyl.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-11
 */
@Controller
@RequestMapping("/evaluate")
public class EvaluateController {
	
	@Autowired
	private OrderService orderSer;
	
	@Autowired
	private EvaluateService evaSer;
	
	/**
	 * 根据被评价id查询
	 * */
	@RequestMapping(value="/getByOwnerId/{id}",method=RequestMethod.GET)
	@ResponseBody
	public List<Evaluate> getById(@PathVariable("id")Integer ownerId) {
		List<Evaluate> list = evaSer.selectList(new EntityWrapper<Evaluate>().eq("owner_id", ownerId));
		return list;
	}
	
	/**
	 * 评价
	 * */
	@RequestMapping(value="/addEvaluate",method=RequestMethod.POST)
	@ResponseBody
	public Msg askRefund(Evaluate eva) {
		String nick = eva.getCommentatorNick();
		if(nick.equals("")) {
			return Msg.fail().add("msg", "登录超时！");
		}
		Order order = orderSer.selectById(eva.getOrderId());
		order.setOrderState("完成");
		order.setConfirmTime(new Date());
		boolean c = orderSer.updateById(order);
		boolean b = evaSer.insert(eva);
		if(b) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	
}

