package com.xyl.ask.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.xyl.ask.beans.AskAppraisal;
import com.xyl.ask.service.AskAppraisalService;
import com.xyl.cust.beans.Cust;
import com.xyl.cust.service.CustService;
import com.xyl.utils.ConstantUtils;
import com.xyl.utils.Msg;
import com.xyl.utils.UUIDUtil;
import com.xyl.utils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-07
 */
@Controller
@RequestMapping("/askAppraisal")
public class AskAppraisalController {
	
	@Autowired
	private AskAppraisalService askApprSer;
	
	@Autowired
	private CustService custSer;
	
	/**
	 * 通过鉴定码查询
	 * */
	@RequestMapping(value="/findWaresByIdent/{ident}",method=RequestMethod.GET)
	@ResponseBody
	public Msg findWaresByIdent(@PathVariable("ident")String ident) {
		AskAppraisal one = askApprSer.selectOne(new EntityWrapper<AskAppraisal>().eq("ask_ident", ident));
		if(one==null) {
			return Msg.fail().add("msg", "为查询到该商品！");
		}
		return Msg.success().add("appr", one);
	}
	
	/**
	 * 请求鉴定
	 * */
	@RequestMapping(value="/askApprByCust",method=RequestMethod.POST)
	@ResponseBody
	private Msg	askApprByCust(AskAppraisal askAppr) {
		askAppr.setAskIdent(UUIDUtil.createUUID());
		askAppr.setAskState("鉴定中");
		Cust before = custSer.selectById(askAppr.getCustId());
		Float newIntegral = before.getCustIntegral()-askAppr.getApprPrice();
		if(newIntegral<0) {
			return Msg.fail().add("msg", "您的积分不足！请充值！");
		}
		before.setCustIntegral(newIntegral);
		boolean c = custSer.updateById(before);
		boolean b = askApprSer.insert(askAppr);
		if(b&&c) {
			return Msg.success().add("msg", "申请鉴定成功！请耐心等待！");
		}
		return Msg.fail().add("msg", "申请鉴定失败！");
	}
	
	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadAskImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> askAppraisal(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, ConstantUtils.ASK_WARE_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String url = "/file/ask/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", url);
		return resultMap;
	}
}

