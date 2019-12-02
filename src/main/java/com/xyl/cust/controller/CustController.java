package com.xyl.cust.controller;


import java.util.HashMap;
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
import com.xyl.code.beans.RegiterCode;
import com.xyl.code.service.RegiterCodeService;
import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.integral.beans.RechargeCust;
import com.xyl.integral.service.RechargeCustService;
import com.xyl.utils.ConstantUtils;
import com.xyl.utils.ExamineChinese;
import com.xyl.utils.Msg;
import com.xyl.utils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-02
 */
@Controller
@RequestMapping("/cust")
public class CustController {
	
	@Autowired
	private RegiterCodeService regiterCodeSer;	//验证码

	@Autowired
	private RechargeCustService rechargeSer;	//充值
	
	@Autowired
	private CustService custSer;		//客户
	
	/**
	 * 充值
	 * */
	@RequestMapping(value="/recharge",method=RequestMethod.GET)
	@ResponseBody
	public Msg recharge(@RequestParam("id")Integer id,@RequestParam("integral")Float integral
			,@RequestParam("money")Float money) {
		Cust cust = custSer.selectById(id);
		Float old = cust.getCustIntegral();
		Cust entity = new Cust();
		entity.setCustId(id);
		entity.setCustIntegral(old+integral);
		RechargeCust recharge = new RechargeCust();
		recharge.setRechargeCustId(id);
		recharge.setRechargeState("100");
		recharge.setOldIntegral(old);
		recharge.setRechargeIntegral(integral);
		recharge.setNewIntegral(old+integral);
		recharge.setRechargeMoney(money);
		rechargeSer.insert(recharge);		//充值记录
		boolean b = custSer.updateById(entity);
		if(!b) {
			return Msg.fail().add("msg","充值失败！");
		}
		return Msg.success().add("msg", "充值成功！");
	}
	
	/**
	 * 修改资料
	 * */
	@RequestMapping(value="/changeCustInfo",method=RequestMethod.POST)
	public String changeCustInfo(Cust cust,Model model) {
		//验证两次输入的密码
		if(!cust.getFormPwd1().equals(cust.getFormPwd2())) {
			model.addAttribute("custError", "两次密码不一致！");
			return "forward:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", cust.getCustEmail())
					.eq("code", cust.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			model.addAttribute("codeError", "验证码有误！");
			return "forward:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		Cust entity = new Cust();
		if(!cust.getFormPwd2().equals("")) {
			entity.setCustPassword(cust.getFormPwd2());
		}
		entity.setCustId(cust.getCustId());
		entity.setCustHeader(cust.getCustHeader());;
		if(!cust.getCustNick().equals("")) {
			entity.setCustNick(cust.getCustNick());
		}
		boolean b = custSer.updateById(entity);
		if(b) {
			return "redirect:/cust/loginOut";
		}else {
			model.addAttribute("editError", "修改失败！");
			return "forward:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
	}
	
	/**
	 * 修改资料前的回显
	 * */
	@RequestMapping(value="/getCustInfo/{id}/{name}",method=RequestMethod.GET)
	public String getCustInfo(@PathVariable Integer id,@PathVariable String name,Model model) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", id).eq("cust_name", name);
		Cust cust = custSer.selectOne(wrapper);
		if(cust == null) {
			model.addAttribute("findInfoError", "未查询到客户信息！");
			return "forward:/pages/cust/cust-info.jsp";
		}
		model.addAttribute("cust", cust);
		return "forward:/pages/cust/cust-info.jsp";
	}
	
	
	/**
	 * 忘记密码
	 * */
	@RequestMapping(value="/forgetPwd",method=RequestMethod.POST)
	@ResponseBody
	public Msg forgetPwd(@RequestBody Map o) {
		String email = (String) o.get("email");
		String code = (String) o.get("code");
		String pwd = (String) o.get("changePwd");
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_email", email);
		int i = custSer.selectCount(wrapper);
		if(i==0) {
			return Msg.fail().add("msg","你还未注册！");
		}
		EntityWrapper<RegiterCode> codeWra = new EntityWrapper<>();
		codeWra.eq("regiter_email", email).eq("code", code);
		int count = regiterCodeSer.selectCount(codeWra);
		if(count == 0) {
			return Msg.fail().add("msg","验证码错误！");
		}
		regiterCodeSer.delete(codeWra);
		Cust entity = new Cust();
		entity.setCustPassword(pwd);
		
		
		boolean b = custSer.update(entity, wrapper);
		if(b) {
			return Msg.success().add("msg","修改成功！请登录！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	
	/**
	 * 登录
	 * */
	@RequestMapping(value="/loginInto",method=RequestMethod.POST)
	public String loginInto(Cust cust,HttpServletRequest req,Model model) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_password",cust.getCustPassword())
		.andNew()
		.eq("cust_email", cust.getFormCode())
		.or()
		.eq("cust_name",  cust.getFormCode());
		Cust one = custSer.selectOne(wrapper);
		if(one==null) {
			model.addAttribute("nameError", "用户名或密码错误");
			return "forward:/pages/cust/login.jsp";
		}
		req.getSession().setAttribute("nick", one.getCustNick());
		req.getSession().setAttribute("id", one.getCustId());
		req.getSession().setAttribute("header", one.getCustHeader());
		req.getSession().setAttribute("name", one.getCustName());
		req.getSession().setAttribute("flag", 1);
		return "redirect:/pages/index.jsp";
	}
	
	
	
	/**
	 * 用户注册
	 * */
	@RequestMapping(value="/regiterCust",method=RequestMethod.POST)
	public String regiterCust(Cust cust,Model model) {
		//验证两次输入的密码
		if(!cust.getFormPwd1().equals(cust.getFormPwd2())) {
			model.addAttribute("pwdError", "两次密码不一致！");
			return "forward:/pages/cust/login.jsp";
		}
		boolean chinese = ExamineChinese.isContainChinese(cust.getCustName());
		if(chinese) {
			model.addAttribute("nameError", "用户名包含中文！");
			return "forward:/pages/cust/login.jsp";
		}
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(cust.getCustName(),cust.getCustEmail());
		if(orNot) {
			model.addAttribute("custError", "您已经注册过了！");
			return "forward:/pages/cust/login.jsp";
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", cust.getCustEmail())
					.eq("code", cust.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			model.addAttribute("codeError", "验证码有误！");
			return "forward:/pages/cust/login.jsp";
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		//注册
		Cust entity = new Cust();
		entity.setCustPassword(cust.getFormPwd2());
		entity.setCustHeader(cust.getCustHeader());
		entity.setCustName(cust.getCustName());
		entity.setCustEmail(cust.getCustEmail());
		entity.setCustIntegral((float) 0.00);
		entity.setCustNick(cust.getCustNick());
		boolean b = custSer.insert(entity);
		if(b) {
			return "forward:/pages/cust/login.jsp";
		}else {
			model.addAttribute("regiterError", "注册失败！");
			return "forward:/pages/cust/login.jsp";
		}
	}
	/**
	 * 上传图片
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
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/pages/index.jsp";
	}

	/**
	 * 抽取方法，验证用户名和邮箱是否存在
	 * true 存在
	 * false 不存在	
	 * @return 
	 */
	public boolean repeatOrNot(String name,String email) {
		EntityWrapper<Cust> getCustWrapper = new EntityWrapper<>();
		getCustWrapper.eq("cust_email", email).orNew()
						.eq("cust_name", name);
		int count2 = custSer.selectCount(getCustWrapper);
		if(count2 != 0) {
			return true;
		}
		return false;
	}
	
}

