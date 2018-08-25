package com.chinxk.flight.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinxk.flight.bean.InterMessageBean;
import com.chinxk.flight.service.InterReturnService;

import io.netty.util.internal.StringUtil;
import redis.clients.jedis.Jedis;

@Controller
public class FlightController {

	@Autowired
	InterReturnService interReturnServiceImpl;

	@Autowired
	private HttpSession session;

	private static final Logger logger = LogManager.getLogger(FlightController.class.getName());

	@RequestMapping("/list")
	public String list(Model model) {

		logger.info("Function list START");
		String uid = (String) session.getAttribute("uid");
		logger.info("uid:" + uid);

//		String testMsg = "Id:id" + ",ToCityName:新加坡" + ",ToCityCode:SIN" + ",FromCityName:成都" + ",FromCityCode:CTU"
//				+ ",StartDate:2018-12-15" + ",EndDate:2018-12-19" + ",MailAdd:107214108@qq.com" + ",TargetPrice:2000"
//				+ ",QunarPrice:99" + ",FliggyPrice:98" + ",CtripPrice:97" + ",SkyPrice:96" + ",CreateDate:2018-07-27"
//				+ ",Status:1";

		logger.info("search data from reris.");
		Jedis jedis = new Jedis("127.0.0.1", 6379);
		Set<String> keys = jedis.keys(uid + "*");
		Iterator<String> it = keys.iterator();
		ArrayList<InterMessageBean> list = new ArrayList<>();
		while (it.hasNext()) {
			String key = it.next();
			System.out.println("key:" + key);
			String value = jedis.get(key);
			InterMessageBean bean = interReturnServiceImpl.convertFromStr(value);
			list.add(bean);
		}
		logger.info("search result size:" + list.size());

		jedis.close();
		model.addAttribute("list", list);
		logger.info("Function list END");
		return "list";
	}

	@RequestMapping("/init")
	public String init(Model model) {
		return "init";
	}

	@RequestMapping("/login")
	public String login(@RequestParam String mailAddress) {

		logger.info("Function login START");
		logger.info("mailAddress:" + mailAddress);

		if (!StringUtil.isNullOrEmpty(mailAddress)) {

			session.setAttribute("uid", mailAddress);
			logger.info("Function login END");
			return "redirect:/list";

		} else {
			logger.error("mailAddress is empty");
			return "err";
		}
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam String key, Model model) {

		logger.info("Function detail START");
		logger.info("key:" + key);
		if (!StringUtil.isNullOrEmpty(key)) {

			Jedis jedis = new Jedis("127.0.0.1", 6379);
			String value = jedis.get(key);
			InterMessageBean bean = interReturnServiceImpl.convertFromStr(value);
			model.addAttribute("bean", bean);
			jedis.close();

			logger.info("Function detail END");
			return "detail";

		} else {
			logger.error("key is empty");
			return "err";
		}
	}

	@RequestMapping("/add")
	public String add(Model model) {
		return "add";
	}

	@RequestMapping(value = "/dealAddedInfo", method = RequestMethod.POST)
	public String dealAddedInfo(InterMessageBean bean) {

		logger.info("Function detail START");
		String uid = (String) session.getAttribute("uid");
		logger.info("uid :" + uid);

		bean.setMailAdd(uid);
		bean.setToCityCode(bean.getToCityName().split(",")[1]);
		bean.setToCityName(bean.getToCityName().split(",")[0]);
		bean.setFromCityCode(bean.getFromCityName().split(",")[1]);
		bean.setFromCityName(bean.getFromCityName().split(",")[0]);

		String id = uid + bean.getFromCityCode() + bean.getToCityCode() + bean.getStartDate() + bean.getEndDate();

		bean.setId(id);

		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		bean.setCreateDate(df.format(dt));
		bean.setStatus("1");

		Jedis jedis = new Jedis("127.0.0.1", 6379);
		logger.info("connect to redis.");
		jedis.set(id, bean.toString());
		logger.info("data saved.key:" + id + "value:" + bean.toString());
		jedis.close();

		logger.info("Function detail END");
		return "redirect:/list";
	}

};