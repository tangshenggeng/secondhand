package com.xyl.cust.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.DateUtils;
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
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.code.beans.RegiterCode;
import com.xyl.code.service.RegiterCodeService;
import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.integral.beans.RechargeCust;
import com.xyl.integral.service.RechargeCustService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
import com.xyl.utils.ConstantUtils;
import com.xyl.utils.EmailUntils;
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
	 * 根据id查询客户
	 * */
	@RequestMapping(value="/getById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id")Integer id) {
		Cust cust = custSer.selectById(id);
		return Msg.success().add("cust", cust);
	}
	
	/**
	 *	添加用户 
	 * */
	@RequestMapping(value="/addCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg addCust(@RequestBody Map map) {
		String name = (String) map.get("custName");
		String email = (String) map.get("custEmail");
		String sort = (String) map.get("sort");
		
		String integral = (String) map.get("integral");
		float inte = Float.parseFloat(integral);
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(name,email);
		if(orNot) {
			return Msg.fail().add("msg","邮箱或用户名已经被注册！");
		}
		Cust entity = new Cust();
		entity.setCustEmail(email);
		entity.setCustName(name);
		if(sort.equals("0")||sort.equals("普通")) {
			entity.setCustState(sort);
		}else {
			Date data = new Date();
			Date afterMonth = getAfterMonth();
			entity.setVipStart(data);
			entity.setVipEnd(afterMonth);
			entity.setCustState(sort);
		}
		entity.setCustIntegral(inte);
		entity.setCustHeader("/file/header/2.jpg");
		entity.setCustNick("新用户_"+name);
		entity.setCustPassword("ynsh123456");
		boolean b = custSer.insert(entity);
		EmailUntils untils = new EmailUntils();
		untils.addCustByAdmin(map);
		if(!b) {
			return Msg.fail().add("msg","添加失败！");
		}
		return Msg.success().add("msg", "添加成功");
	}
	
	
	/**
	 * 异常
	 * */
	@RequestMapping(value="/exception/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg exception(@PathVariable("id") Integer id) {
		Cust cust = custSer.selectById(id);
		cust.setCustState("异常");
		boolean b = custSer.updateById(cust);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = custSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 批量拉黑
	 * */
	@RequestMapping(value="/exceptionCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg exceptionCustByIds(@RequestBody ArrayList<Integer> list) {
		List<Cust> selectBatchIds = custSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		selectBatchIds.forEach(cust -> cust.setCustState("异常"));
		boolean b = custSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量恢复
	 * */
	@RequestMapping(value="/recoveryCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg recoveryCustByIds(@RequestBody ArrayList<Integer> list) {
		List<Cust> selectBatchIds = custSer.selectBatchIds(list);
		Long date = new Date().getTime();
		
		for (Cust cust : selectBatchIds) {
			if(cust.getVipEnd()!=null) {
				if(cust.getVipEnd().getTime()>date) {
					cust.setCustState("会员");
				}else {
					cust.setCustState("普通");
				}
			}else {
				cust.setCustState("普通");
			}
		}
		boolean b = custSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量到期
	 * */
	@RequestMapping(value="/endVipCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg endVipCustByIds(@RequestBody ArrayList<Integer> list) {
		List<Cust> selectBatchIds = custSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		Date date = new Date();
		Long time = date.getTime();
		for (Cust cust2 : selectBatchIds) {
			if(cust2.getVipEnd().getTime()>time) {
				return Msg.fail().add("msg","有客户的会员还未到期！不可强制提前到期！");
			}
		}
		selectBatchIds.forEach(cust -> cust.setCustState("普通"));
		String[] email = new String[selectBatchIds.size()];
		for (int i = 0; i < selectBatchIds.size(); i++) {
			email[i]=selectBatchIds.get(i).getCustEmail();
		}
		EmailUntils untils = new EmailUntils();
		untils.expireOrder(email);
		boolean b = custSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量升级
	 * */
	@RequestMapping(value="/upgradeCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg upgradeCustByIds(@RequestBody ArrayList<Integer> list) {
		List<Cust> selectBatchIds = custSer.selectBatchIds(list);
		Date vipEnd = getAfterMonth();
		Date vipStart = new Date();
		for (Cust cust : selectBatchIds) {
			cust.setCustState("会员");
			cust.setVipEnd(vipEnd);
			cust.setVipStart(vipStart);
		}
		boolean b = custSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	
	/**
	 * 得到所有的客户(普通)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getMemberCustList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCustList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("cust_name", formCode).or().like("cust_nick", formCode)
					.or().like("cust_email", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		wrapper.eq("cust_state","普通");
		Page<Map<String, Object>> mapsPage = custSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有客户");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的客户(vip)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getVIPCustList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getVIPCustList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("cust_name", formCode).or().like("cust_nick", formCode)
			.or().like("cust_email", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("vip_end", startDate, endDate).andNew();
		}
		wrapper.eq("cust_state","会员");
		Page<Map<String, Object>> mapsPage = custSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有VIP");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 得到所有的客户(异常)
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getExceptionCustList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExceptionCustList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String formCode = (String) afterMap.get("formCode");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!formCode.equals("")) {
			wrapper.like("cust_name", formCode).or().like("cust_nick", formCode)
			.or().like("cust_email", formCode).andNew();
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate).andNew();
		}
		wrapper.eq("cust_state","异常");
		Page<Map<String, Object>> mapsPage = custSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有异常");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 升级为会员
	 * 
	 * */
	@RequestMapping(value="/upgradeVIP/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg upgradeVIP(@PathVariable("id")Integer custId,HttpServletRequest req) {
		Cust cust = custSer.selectById(custId);
		Float old = cust.getCustIntegral();
		if(old<100f) {
			return Msg.fail().add("msg","对不起！您的积分不足！请先充值！");
		}
		if(cust.getCustState().equals("会员")) {
			return Msg.fail().add("msg","您已经时会员啦！");
		}
		cust.setCustIntegral(old-100);
		cust.setCustState("会员");
		RechargeCust recharge = new RechargeCust();
		recharge.setRechargeCustId(custId);
		recharge.setRechargeState("100");
		recharge.setOldIntegral(old);
		recharge.setRechargeSort("消费");
		recharge.setRechargeIntegral(100.0f);
		recharge.setNewIntegral(old-100);
		recharge.setRechargeMoney(10f);
		rechargeSer.insert(recharge);		//充值记录
		Date date = new Date();
		cust.setVipStart(date);
		cust.setVipEnd(getAfterMonth());
		boolean b = custSer.updateById(cust);
		EmailUntils utils = new EmailUntils();
		utils.addOrder(cust.getCustEmail(), "充值会员", 100f, old-100);
		if(!b) {
			return Msg.fail().add("msg","升级失败！");
		}
		req.getSession().setAttribute("state", "会员");
		return Msg.success().add("msg", "升级成功！");
	}
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
		recharge.setRechargeSort("充值");
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
	public String getCustInfo(@PathVariable Integer id,@PathVariable String name,Model model
			) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", id).eq("cust_name", name);
		Cust cust = custSer.selectOne(wrapper);
		if(cust == null) {
			model.addAttribute("findInfoError", "未查询到客户信息！");
			return "forward:/pages/cust/cust-info.jsp";
		}
		model.addAttribute("cust", cust);
		if(cust.getCustState().equals("会员")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String end = sdf.format(cust.getVipEnd());
			model.addAttribute("end", end);
		}else {
			model.addAttribute("end", "非会员，加入会员的商品可以有限展示哦~");
		}
		
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
		.eq("cust_name",  cust.getFormCode()).ne("cust_state","异常");
		Cust one = custSer.selectOne(wrapper);
		if(one==null) {
			model.addAttribute("nameError", "用户名或密码错误");
			return "forward:/pages/cust/login.jsp";
		}
		req.getSession().setAttribute("nick", one.getCustNick());
		req.getSession().setAttribute("id", one.getCustId());
		req.getSession().setAttribute("header", one.getCustHeader());
		req.getSession().setAttribute("name", one.getCustName());
		req.getSession().setAttribute("state", one.getCustState());
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
		entity.setCustState("普通");
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
	//获取当前时间一个月后的时间
	private Date getAfterMonth() {
		Date now = new Date();
		Date startDate = DateUtils.addDays(now, +30);
		return startDate;
	}
	
	@RequestMapping(value="/toListMemberPage",method=RequestMethod.GET)
	public String toListCustPage() {
		return "/custs/list-member";
	}
	//去往发布商品页面
	@RequestMapping(value="/toReleaseWarePage/{id}/{name}",method=RequestMethod.GET)
	public String toReleaseWarePage(@PathVariable("id")Integer id
			,@PathVariable("name")String name,Model model) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", id).eq("cust_name", name);
		Cust cust = custSer.selectOne(wrapper);
		if(cust == null) {
			model.addAttribute("findInfoError", "未查询到客户信息！");
			return "forward:/pages/cust/release-ware.jsp";
		}
		model.addAttribute("cust", cust);
		return "forward:/pages/cust/release-ware.jsp";
	}
	
	@RequestMapping(value="/toListVIPPage",method=RequestMethod.GET)
	public String toListVIPPage() {
		return "/custs/list-vip";
	}
	@RequestMapping(value="/toListExceptionPage",method=RequestMethod.GET)
	public String toListExceptionPage() {
		return "/custs/list-exception";
	}
	@RequestMapping(value="/toAddCustPage",method=RequestMethod.GET)
	public String toAddCustPage() {
		return "/custs/add-cust";
	}
}

