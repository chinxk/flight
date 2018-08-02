package com.chinxk.flight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinxk.flight.bean.InterMessageBean;
import com.chinxk.flight.service.InterReturnService;

@Controller
public class FlightController {

	@Autowired
	InterReturnService interReturnServiceImpl;
	
	@RequestMapping("/list")
	public String list(Model model) {
		String testMsg = "Id:id" + ",ToCityName:新加坡" + ",ToCityCode:SIN" + ",FromCityName:成都" + ",FromCityCode:CTU"
				+ ",StartDate:2018-12-15" + ",EndDate:2018-12-19" + ",MailAdd:107214108@qq.com" + ",TargetPrice:2000"
				+ ",QunarPrice:99" + ",FliggyPrice:98" + ",CtripPrice:97" + ",SkyPrice:96" + ",CreateDate:2018-07-27"
				+ ",Status:1";
		
		InterMessageBean bean = interReturnServiceImpl.convertFromStr(testMsg);
		model.addAttribute("bean", bean);
		
		return "list";
	}
	
	@RequestMapping("/init")
	public String init(Model model) {
		return "init";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		//String[] airportData = interReturnServiceImpl.loadAirports();
		String[] airportData = {"长沙,CSX,黄花机场","成都,CTU,双流机场"};
		model.addAttribute("airportData", airportData);
		return "add";
	}
}
