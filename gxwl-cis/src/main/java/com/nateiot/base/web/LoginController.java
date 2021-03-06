package com.nateiot.base.web;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nateiot.base.common.SessionUtil;

/**
 * @author Will WM. Zhang
 * 
 */
@Controller
@RequestMapping
public class LoginController {
	
//	@Autowired
//	private CisEsIntegalDetailService cisEsIntegalDetailService;
	
//	@RequestMapping(value = "/index")
//	public String index() {
//		return "base/index";
//	}
	
	@RequestMapping(value = "/index")
	public String index() {
		score();
		return "base/index";
	}
	
	@RequestMapping(value = "/sys")
	public String sys() {
		return "base/sys";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String fail(@RequestParam("username") String username, Model model) {
		return "base/login";
	}
	
	private void score(){
		Integer userId = SessionUtil.getCurrentUser().getUserId();
//		cisEsIntegalDetailService.scoreDetail(userId, "loginScore", 
//				new Date(), null, null, null);
	}
}
