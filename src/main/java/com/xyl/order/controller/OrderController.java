package com.xyl.order.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.order.beans.Order;
import com.xyl.order.service.OrderService;
import com.xyl.release.beans.ReleaseWares;
import com.xyl.release.service.ReleaseWaresService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
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
	 * 批量删除
	 * */
	@RequestMapping(value="/delOrdersByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delWaresByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = orderSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	
	/**
	 * 得到所有的未完成订单
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getUnFinallyList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getUnFinallyList(@RequestBody Map kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		if(!formCode.equals("")) {
			wrapper.like("order_number", formCode)
			.or().like("ware_name", formCode)
			.or().like("appr_ident", formCode)
			.or().like("originator_nick", formCode)
			.or().like("owner_nick", formCode)
			.or().like("consignee_name", formCode)
			.or().like("consignee_email", formCode)
			.or().like("consignee_addr", formCode)
			.or().like("consignee_remark", formCode);
		}
		wrapper.ne("order_state", "完成");
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有未完成");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的未完成订单
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getFinallyList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFinallyList(@RequestBody Map kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		if(!formCode.equals("")) {
			wrapper.like("order_number", formCode)
			.or().like("ware_name", formCode)
			.or().like("appr_ident", formCode)
			.or().like("originator_nick", formCode)
			.or().like("owner_nick", formCode)
			.or().like("consignee_name", formCode)
			.or().like("consignee_email", formCode)
			.or().like("consignee_addr", formCode)
			.or().like("consignee_remark", formCode);
		}
		wrapper.eq("order_state", "完成");
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有完成订单");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 同意退货
	 * */
	@RequestMapping(value="/agreeRefund/{ident}",method=RequestMethod.GET)
	@ResponseBody
	public Msg agreeRefund(@PathVariable("ident")String ident) {
		Order order = orderSer.selectOne(new EntityWrapper<Order>().eq("order_number", ident)
				.eq("order_state", "申请退货"));
		if(order==null) {
			return Msg.fail().add("msg", "未查询到订单！");
		}
		Float price = order.getPrice();
		Cust owner = custSer.selectById(order.getOwnerId());		//商品的原主任id
		Cust originator = custSer.selectById(order.getOriginatorId());	//下单人id
		owner.setCustIntegral(owner.getCustIntegral()-price);
		originator.setCustIntegral(originator.getCustIntegral()+price);
		ArrayList<Cust> custList = new ArrayList<Cust>();
		custList.add(owner);
		custList.add(originator);
		order.setOrderState("同意退货");
		boolean b = custSer.updateAllColumnBatchById(custList);
		if(!b) {
			return Msg.fail().add("msg", "积分回滚失败！");
		}
		boolean c = orderSer.updateById(order);
		if(c) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	/**
	 * 完成
	 * */
	@RequestMapping(value="/finallyOrder/{ident}",method=RequestMethod.GET)
	@ResponseBody
	public Msg finallyOrder(@PathVariable("ident")String ident) {
		Order order = orderSer.selectOne(new EntityWrapper<Order>().eq("order_number", ident)
				.eq("order_state", "同意退货"));
		if(order==null) {
			return Msg.fail().add("msg", "未查询到订单！");
		}
		order.setOrderState("完成");
		boolean c = orderSer.updateById(order);
		if(c) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	
	/**
	 * 确认收货
	 * */
	@RequestMapping(value="/receivingWare/{orderId}/{orderNum}",method=RequestMethod.GET)
	@ResponseBody
	public Msg receivingWare(@PathVariable("orderId")Integer orderId,
			@PathVariable("orderNum")String orderNum) {
		Order order = orderSer.selectOne(new EntityWrapper<Order>().eq("order_id", orderId).eq("order_number", orderNum)
				.eq("order_state", "已发货"));
		if(order == null) {
			return Msg.fail().add("msg", "未查询到订单！");
		}
		order.setOrderState("已收货");
		order.setConfirmTime(new Date());
		Cust cust = custSer.selectById(order.getOwnerId());
		cust.setCustIntegral(cust.getCustIntegral()+order.getPrice());
		boolean c = custSer.updateById(cust);
		if(!c) {
			return Msg.fail().add("msg", "失败！");
		}
		boolean b = orderSer.updateById(order);
		
		if(b) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	
	/**
	 * 填写快递信息
	 * */
	@RequestMapping(value="/expressInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg expressInfo(Order order) {
		System.out.println(order);
		Order beforeOrder = orderSer.selectOne(new EntityWrapper<Order>().eq("order_id", order.getOrderId())
				.eq("order_number", order.getOrderNumber()).eq("order_state", "已下单"));
		if(beforeOrder==null) {
			return Msg.fail().add("msg", "未找到对应已下单的订单！");
		}
		beforeOrder.setExpressCom(order.getExpressCom());
		beforeOrder.setExpressNumber(order.getExpressNumber());
		beforeOrder.setOrderState("已发货");
		boolean b = orderSer.updateById(beforeOrder);
		if(b) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	/**
	 * 申请退货
	 * */
	@RequestMapping(value="/askRefund",method=RequestMethod.POST)
	@ResponseBody
	public Msg askRefund(Order order) {
		Order beforeOrder = orderSer.selectOne(new EntityWrapper<Order>().eq("order_id", order.getOrderId())
				.eq("order_number", order.getOrderNumber()).eq("order_state", "已收货"));
		if(beforeOrder==null) {
			return Msg.fail().add("msg", "未找到对应已下单的订单！");
		}
		beforeOrder.setConsigneeRemark(order.getConsigneeRemark());
		beforeOrder.setOrderState("申请退货");
		boolean b = orderSer.updateById(beforeOrder);
		if(b) {
			return Msg.success().add("msg", "成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	
	/**
	 * 我的订单(买)
	 * @return 
	 * */
	@RequestMapping(value="/getBuyOrdersByCust",method=RequestMethod.POST)
	@ResponseBody
	public List<Order> getBuyOrdersByCust(@RequestBody Map map) {
		String originatorId = (String) map.get("originatorId");
		String originatorNick = (String) map.get("originatorNick");
		Integer orid = Integer.parseInt(originatorId);
		List<Order> list = orderSer.selectList(new EntityWrapper<Order>().eq("originator_id",orid)
							.eq("originator_nick", originatorNick).ne("order_state", "完成")
							.orderBy("create_time", false));
		return list;
	}
	/**
	 * 我的订单(卖)
	 * @return 
	 * */
	@RequestMapping(value="/getSaleOrdersByCust",method=RequestMethod.POST)
	@ResponseBody
	public List<Order> getSaleOrdersByCust(@RequestBody Map map) {
		String originatorId = (String) map.get("originatorId");
		String originatorNick = (String) map.get("originatorNick");
		Integer orid = Integer.parseInt(originatorId);
		List<Order> list = orderSer.selectList(new EntityWrapper<Order>().eq("owner_id",orid)
				.eq("owner_nick", originatorNick).ne("order_state", "完成")
				.orderBy("create_time", false));
		return list;
	}
	
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
	//下单
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
	//我的订单
	@RequestMapping(value="/toMyOrderPage/{custId}/{custName}",method=RequestMethod.GET) 
	public String toMyOrderPage(@PathVariable("custId")Integer custId
			,@PathVariable("custName")String custName,Model model) {
		Cust count = custSer.selectOne(new EntityWrapper<Cust>().eq("cust_id", custId).eq("cust_name", custName));
		if(count==null) {
			model.addAttribute("error", "登录超时！请重新登录！");
			return "forward:/pages/cust/my-orders.jsp";
		}
		model.addAttribute("id", count.getCustId());
		model.addAttribute("nick", count.getCustNick());
		return "forward:/pages/cust/my-orders.jsp";
	}
	//未完成页面
	@RequestMapping(value="/toBeforeFinallyPage",method=RequestMethod.GET)
	public String toBeforeFinallyPage() {
		return "/orders/unfinally-order";
	}
	//完成页面
	@RequestMapping(value="/toFinallyPage",method=RequestMethod.GET)
	public String toFinallyPage() {
		return "/orders/finally-order";
	}
}

