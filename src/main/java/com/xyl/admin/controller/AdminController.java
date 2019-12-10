package com.xyl.admin.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.xyl.admin.beans.Admin;
import com.xyl.admin.service.AdminService;
import com.xyl.appraisal.service.AppraisalService;
import com.xyl.cust.service.CustService;
import com.xyl.order.service.OrderService;
import com.xyl.release.service.ReleaseWaresService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-01
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CustService custSer;
	
	@Autowired
	private AppraisalService apprSer;
	
	@Autowired
	private OrderService orderSer;
	
	@Autowired
	private ReleaseWaresService releSer;
	/**
	 * 统计
	 * @return 
	 * */
	@RequestMapping(value="/getCountForIndex",method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Integer> getCountForIndex() {
		int custCount = custSer.selectCount(null);
		int apprCount = apprSer.selectCount(null);
		int orderCount = orderSer.selectCount(null);
		int waresCount = releSer.selectCount(null);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("custCount", custCount);
		map.put("apprCount", apprCount);
		map.put("orderCount", orderCount);
		map.put("waresCount", waresCount);
		return map;
		
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
	 * 登录
	 * */
	@RequestMapping(value="/loginInto",method=RequestMethod.POST)
	public String loginInto(Admin admin,HttpServletRequest req,Model model) {
		EntityWrapper<Admin> wrapper = new EntityWrapper<>();
		wrapper.eq("admin_name", admin.getAdminName());
		wrapper.eq("admin_password", admin.getAdminPassword());
		Admin one = adminService.selectOne(wrapper);
		if(one==null) {
			model.addAttribute("msg", "用户名不存在或密码错误！");
			return  "forward:/pages/admin-login.jsp";
		}
		req.getSession().setAttribute("admin", one.getAdminName());
		req.getSession().setAttribute("adminId", one.getAdminId());
		return "/index";
	}
	
	//=======================
	//去往首页
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String toIndex() {
		return "index";
	}
	
}

