package com.xyl.brandAndSort.controller;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.brandAndSort.beans.Brand;
import com.xyl.brandAndSort.service.BrandService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
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
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/brand")
public class BrandController {

	@Autowired
	private BrandService brandSer;
	
	/**
	 *得到所有的展示品牌（前台展示）
	 * @return 
	 * */
	@RequestMapping(value="/getBrandsByShow",method=RequestMethod.GET)
	@ResponseBody
	public List<Brand> getBrandsByShow() {
		return brandSer.selectList(new EntityWrapper<Brand>().eq("is_show", "展示").orderBy("brand_weight", false));
	}
	
	/**
	 * 批量展示
	 * */
	@RequestMapping(value="/showBrandsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg showBrandsByIds(@RequestBody ArrayList<Integer> list) {
		List<Brand> selectBatchIds = brandSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		selectBatchIds.forEach(brand -> brand.setIsShow("展示"));
		boolean b = brandSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量隐藏
	 * */
	@RequestMapping(value="/hideBrandsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg notShowBrandsByIds(@RequestBody ArrayList<Integer> list) {
		List<Brand> selectBatchIds = brandSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		selectBatchIds.forEach(brand -> brand.setIsShow("隐藏"));
		boolean b = brandSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delBrandsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delBrandsByIds(@RequestBody ArrayList<Integer> list) {
		
		boolean b = brandSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 得到所有的品牌
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getBrandList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCustList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String isShow = (String) afterMap.get("isShow");
		String kwWords = (String) afterMap.get("kwWords");
		EntityWrapper<Brand> wrapper = new EntityWrapper<>();
		if(!isShow.equals("0")) {
			wrapper.eq("is_show",isShow);
		}
		if(!kwWords.equals("")) {
			wrapper.like("brand_number", kwWords).or().like("brand_name", kwWords)
			.or().like("brand_introduce",kwWords);
		}
		wrapper.orderBy("brand_weight", false);
		Page<Map<String, Object>> mapsPage = brandSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有品牌");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 添加品牌
	 * */
	@RequestMapping(value="/addBrand",method=RequestMethod.POST)
	@ResponseBody
	public Msg addBrand(@RequestBody Map map) {
		String brandName = (String) map.get("brandName");
		int count = brandSer.selectCount(new EntityWrapper<Brand>().eq("brand_name", brandName));
		if(count!=0) {
			return Msg.fail().add("msg","该品牌已经存在！");
		}
		String isShow = (String) map.get("isShow");
		String brandLogo = (String) map.get("brandLogo");
		String brandIntroduce = (String) map.get("brandIntroduce");
		String brandWeight = (String) map.get("brandWeight");
		int weight = Integer.parseInt(brandWeight);
		Brand brand = new Brand();
		brand.setBrandIntroduce(brandIntroduce);
		brand.setBrandWeight(weight);
		brand.setBrandLogo(brandLogo);
		brand.setBrandName(brandName);
		if(map.get("isShow")!=null) {
			brand.setIsShow(isShow);
		}else {
			brand.setIsShow("隐藏");
		}
		brand.setBrandNumber(UUIDUtil.createUUID());
		boolean b = brandSer.insert(brand);
		if(!b) {
			return Msg.fail().add("msg","添加失败！");
		}
		return Msg.success().add("msg", "添加成功");
	}
	/**
	 * 修改品牌
	 * */
	@RequestMapping(value="/editBrand",method=RequestMethod.POST)
	@ResponseBody
	public Msg editBrand(@RequestBody Map map) {
		String brandName = (String) map.get("brandName");
		String brandId = (String) map.get("brandId");
		int brId = Integer.parseInt(brandId);
		int count = brandSer.selectCount(new EntityWrapper<Brand>().eq("brand_name", brandName)
				.ne("brand_id", brId));
		if(count!=0) {
			return Msg.fail().add("msg","该品牌已经存在！");
		}
		String brandLogo = (String) map.get("brandLogo");
		String brandIntroduce = (String) map.get("brandIntroduce");
		String brandWeight = (String) map.get("brandWeight");
		
		int weight = Integer.parseInt(brandWeight);
		
		Brand brand = new Brand();
		brand.setBrandId(brId);
		brand.setBrandIntroduce(brandIntroduce);
		brand.setBrandWeight(weight);
		brand.setBrandLogo(brandLogo);
		brand.setBrandName(brandName);
		boolean b = brandSer.updateById(brand);
		if(!b) {
			return Msg.fail().add("msg","修改失败！");
		}
		return Msg.success().add("msg", "修改成功");
	}
	/**
	 * 上传品牌LOGO
	 * @return 
	 * */
	@RequestMapping(value="/uploadBrandImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadNewFoodImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, ConstantUtils.BRAND_IMG);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String img = "/file/logo/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", img);
		return resultMap;
	}
	//===========页面跳转==================
	@RequestMapping(value="/toAddBrandPage",method=RequestMethod.GET)
	public String toAddBrandPage() {
		return "/brand_sort/add-brand";
	}
	@RequestMapping(value="/toBrandListPage",method=RequestMethod.GET)
	public String toBrandListPage() {
		return "/brand_sort/list-brand";
	}
}

