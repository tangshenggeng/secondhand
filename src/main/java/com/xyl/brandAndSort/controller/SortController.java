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
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xyl.brandAndSort.beans.Brand;
import com.xyl.brandAndSort.beans.Sort;
import com.xyl.brandAndSort.service.SortService;
import com.xyl.utils.AnalysisKeyWordsListUtils;
import com.xyl.utils.Msg;
import com.xyl.utils.UUIDUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 项育林帅哥
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/sort")
public class SortController {

	@Autowired
	private SortService sortSer;
	
	
	
	/**
	 * 添加品牌
	 * */
	@RequestMapping(value="/addSort",method=RequestMethod.POST)
	@ResponseBody
	public Msg addSort(@RequestBody Map map) {
		String sortName = (String) map.get("sortName");
		int count = sortSer.selectCount(new EntityWrapper<Sort>().eq("sort_name", sortName));
		if(count!=0) {
			return Msg.fail().add("msg","该分类已经存在！");
		}
		String isShow = (String) map.get("isShow");
		String sortWeight = (String) map.get("sortWeight");
		int weight = Integer.parseInt(sortWeight);
		Sort sort = new Sort();
		sort.setSortWeight(weight);
		sort.setSortName(sortName);
		if(map.get("isShow")!=null) {
			sort.setIsShow(isShow);
		}else {
			sort.setIsShow("隐藏");
		}
		boolean b = sortSer.insert(sort);
		if(!b) {
			return Msg.fail().add("msg","添加失败！");
		}
		return Msg.success().add("msg", "添加成功");
	}
	
	/**
	 * 批量展示
	 * */
	@RequestMapping(value="/showSortsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg showSortsByIds(@RequestBody ArrayList<Integer> list) {
		List<Sort> selectBatchIds = sortSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		selectBatchIds.forEach(brand -> brand.setIsShow("展示"));
		boolean b = sortSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量隐藏
	 * */
	@RequestMapping(value="/hideSortsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg hideSortsByIds(@RequestBody ArrayList<Integer> list) {
		List<Sort> selectBatchIds = sortSer.selectBatchIds(list);
		//Java 8 新特性+Lambda表达式
		selectBatchIds.forEach(brand -> brand.setIsShow("隐藏"));
		boolean b = sortSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delSortsByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delSortsByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = sortSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	/**
	 * 得到所有的分类
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getSortsList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSortsList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String isShow = (String) afterMap.get("isShow");
		String kwWords = (String) afterMap.get("kwWords");
		EntityWrapper<Sort> wrapper = new EntityWrapper<>();
		if(!isShow.equals("0")) {
			wrapper.eq("is_show",isShow);
		}
		if(!kwWords.equals("")) {
			wrapper.like("sort_name", kwWords);
		}
		wrapper.orderBy("sort_weight", false);
		Page<Map<String, Object>> mapsPage = sortSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有分类");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	//==========页面跳转================
	@RequestMapping(value="/toSortListPage",method=RequestMethod.GET)
	public String toSortListPage() {
		return "/brand_sort/list-sort";
	}
	
}

