package com.chinxk.flight.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinxk.flight.bean.InterMessageBean;
import com.chinxk.flight.service.InterReturnService;

import io.netty.util.internal.StringUtil;

@Controller
public class FlightController {

	private static final int MAX_PRICE = 99999;
	@Autowired
	InterReturnService interReturnServiceImpl;

	@Autowired
	private HttpSession session;

	@RequestMapping("/list")
	public String list(Model model) {
		
		System.out.println(session.getAttribute("uid"));
		
		String testMsg = "Id:id" + ",ToCityName:新加坡" + ",ToCityCode:SIN" + ",FromCityName:成都" + ",FromCityCode:CTU"
				+ ",StartDate:2018-12-15" + ",EndDate:2018-12-19" + ",MailAdd:107214108@qq.com" + ",TargetPrice:2000"
				+ ",QunarPrice:99" + ",FliggyPrice:98" + ",CtripPrice:97" + ",SkyPrice:96" + ",CreateDate:2018-07-27"
				+ ",Status:1";

		testMsg = (String)session.getAttribute("testMsg");
		InterMessageBean bean = interReturnServiceImpl.convertFromStr(testMsg);
		ArrayList<InterMessageBean> list = new ArrayList<>();
		list.add(bean);
		list.add(bean);
		list.add(bean);
		
		model.addAttribute("list", list);

		return "list";
	}

	@RequestMapping("/init")
	public String init(Model model) {
		return "init";
	}

	@RequestMapping("/login")
	public String login(@RequestParam String mailAddress) {
		
		if (!StringUtil.isNullOrEmpty(mailAddress)) {
			
			session.setAttribute("uid", mailAddress);
			return "redirect:/list";
			
		} else {
			
			return "err";
		}
	}

	@RequestMapping("/add")
	public String add(Model model) {
		return "add";
	}
	
	@RequestMapping(value = "/dealAddedInfo", method = RequestMethod.POST)
    public String dealAddedInfo(InterMessageBean bean){
		
		bean.setMailAdd((String)session.getAttribute("uid"));
		bean.setToCityCode(bean.getToCityName().split(",")[1]);
		bean.setToCityName(bean.getToCityName().split(",")[0]);
		bean.setFromCityCode(bean.getFromCityName().split(",")[1]);
		bean.setFromCityName(bean.getFromCityName().split(",")[0]);
		
		Date dt=new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        bean.setQunarPrice(MAX_PRICE);
        bean.setCtripPrice(MAX_PRICE);
        bean.setFliggyPrice(MAX_PRICE);
        bean.setSkyPrice(MAX_PRICE);
       
		bean.setCreateDate(df.format(dt));
		bean.setStatus(1);
		
		//TODO add to message list
		session.setAttribute("testMsg", bean.toString());
		
        return "redirect:/list";
    }

}
;