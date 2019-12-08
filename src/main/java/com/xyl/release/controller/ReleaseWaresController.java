package com.xyl.release.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.ask.beans.AskAppraisal;
import com.xyl.ask.service.AskAppraisalService;
import com.xyl.release.beans.ReleaseWares;
import com.xyl.release.beans.WareBrand;
import com.xyl.release.beans.WareSort;
import com.xyl.release.service.ReleaseWaresService;
import com.xyl.release.service.WareBrandService;
import com.xyl.release.service.WareSortService;
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
 * @since 2019-12-08
 */
@Controller
@RequestMapping("/releaseWares")
public class ReleaseWaresController {

	@Autowired
	private ReleaseWaresService releSer;		//发布商品
	
	@Autowired
	private WareBrandService brandSer;			//品牌中间表
	
	@Autowired
	private WareSortService sortSer;			//分类中间表
	
	@Autowired
	private AskAppraisalService askSer;			//鉴定码查询
	
	/**
	 * 首页展示8个通过鉴定的商品
	 * @return 
	 * */
	@RequestMapping(value="/getAftersIndex",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getAftersIndex() {
		Page<Map<String, Object>> selectMapsPage = releSer.selectMapsPage(new Page<>(1, 8), new EntityWrapper<ReleaseWares>().eq("is_appr", "是").eq("is_show", "展示"));
		return selectMapsPage.getRecords();
	}
	
	/**
	 * 首页展示8个未鉴定的商品
	 * @return 
	 * */
	@RequestMapping(value="/getBeforeIndex",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getBeforeIndex() {
		Page<Map<String, Object>> selectMapsPage = releSer.selectMapsPage(new Page<>(1, 8), new EntityWrapper<ReleaseWares>().eq("is_appr", "否").eq("is_show", "展示"));
		return selectMapsPage.getRecords();
	}
	
	/**
	 * 客户发布商品
	 * */
	@RequestMapping(value="/releaseWaresByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg releaseWaresByCust(ReleaseWares rew) {
		String apprIdent = rew.getApprIdent();
		if(rew.getIsAppr().equals("是")) {
			int selectCount = askSer.selectCount(new EntityWrapper<AskAppraisal>().eq("ask_ident", apprIdent).eq("ask_state", "真品"));
			if(selectCount==0) {
				return Msg.fail().add("msg", "商品鉴定为非真品或还在鉴定！");
			}
		}else {
			rew.setApprIdent("未鉴定");
		}
		List<Integer> brands = rew.getBrands();
		List<Integer> sorts = rew.getSorts();
		if(brands.isEmpty()||sorts.isEmpty()) {
			return Msg.fail().add("msg", "请选择品牌和分类！");
		}
		String ident = UUIDUtil.createUUID();
		rew.setWareIdent(ident);
		rew.setIsShow("展示");
		boolean b = releSer.insert(rew);
		if(b) {
			ArrayList<WareBrand> brandList = new ArrayList<>();
			for (Integer integer : brands) {
				WareBrand brand = new WareBrand();
				brand.setWareIdent(ident);
				brand.setBrandId(integer);
				brandList.add(brand);
			}
			brandSer.insertBatch(brandList);
			ArrayList<WareSort> sortList = new ArrayList<>();
			for (Integer integer : sorts) {
				WareSort sort = new WareSort();
				sort.setWareIdent(ident);
				sort.setSortId(integer);;
				sortList.add(sort);
			}
			sortSer.insertBatch(sortList);
			return Msg.success().add("msg", "发布成功！");
		}
		return Msg.fail().add("msg", "失败！");
	}
	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadWareImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> askAppraisal(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, ConstantUtils.CUST_WARE_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String url = "/file/wares/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", url);
		return resultMap;
	}
	
}

