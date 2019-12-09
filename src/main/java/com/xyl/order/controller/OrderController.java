package com.xyl.order.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.order.beans.Order;
import com.xyl.order.service.OrderService;
import com.xyl.release.beans.ReleaseWares;
import com.xyl.release.service.ReleaseWaresService;
import com.xyl.utils.Msg;
import com.xyl.utils.UUIDUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-09
 */
@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private ReleaseWaresService releSer;		//发表的商品id
	
	@Autowired
	private OrderService orderSer;				//订单表
	
	@Autowired
	private CustService custSer;			//客户表
	
	
	/**
	 * 客户下单
	 * */
	@RequestMapping(value="/orderByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg orderByCust(Order order) {
		if(order.getOriginatorNick().equals("")) {
			return Msg.fail().add("msg","登录超时！请重新登录！");
		}
		if(order.getWareName().equals("")) {
			return Msg.fail().add("msg","未找到相关商品！");
		}
		if(order.getOriginatorId()==order.getOwnerId()) {
			return Msg.fail().add("msg","请不要自己购买自己的商品！");
		}
		String addr = order.getConsigneeAddr();
		String email = order.getConsigneeEmail();
		String name = order.getConsigneeName();
		String remark = order.getConsigneeRemark();
		if(addr.equals("")||email.equals("")|| name.equals("")||remark.equals("")) {
			return Msg.fail().add("msg","请完整填写好信息！");
		}
		order.setOrderNumber(UUIDUtil.createUUID());
		order.setOrderState("已下单");
		//跟新购买者信息
		Cust cust = custSer.selectById(order.getOriginatorId());
		Float newIn = cust.getCustIntegral()-order.getPrice();
		if(newIn<0) {
			return Msg.fail().add("msg", "您的积分不足！");
		}
		cust.setCustIntegral(newIn);
		boolean c = custSer.updateById(cust);
		if(c) {
			boolean b = orderSer.insert(order);
			if(b) {
				//把应的商品隐藏
				ReleaseWares wares = releSer.selectById(order.getWareId());
				wares.setIsShow("隐藏");
				releSer.updateById(wares);
				return Msg.success().add("msg", "下单成功！请耐心等待宝贝主人发货！");
			}else {
				return Msg.fail().add("msg", "下单失败！");
			}
			
		}else {
			return Msg.fail().add("msg", "下单失败！积分流动失败！");
		}
		
	}
	
	//===========页面跳转=================
	@RequestMapping(value="/toOrderByCust/{id}",method=RequestMethod.GET)
	public String toOrderByCust(@PathVariable("id")Integer wareId,Model model) {
		ReleaseWares wares = releSer.selectById(wareId);
		if(wares==null) {
			model.addAttribute("error", "未找到该商品！");
			return "forward:/pages/order/to-order.jsp";
		}
		model.addAttribute("ware", wares);
		return "forward:/pages/order/to-order.jsp";
	}
	
	
}

