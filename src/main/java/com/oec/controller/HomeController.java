package com.oec.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oec.base.BaseController;
import com.oec.demo.service.UserService;
import com.oec.model.User;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017楠烇拷2閺堬拷7閺冿拷 娑撳宕�4:28:58
 */
@Controller
public class HomeController extends BaseController {
	@Autowired
	private UserService serve;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("user", new User());
		return "/login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		SecurityUtils.getSubject().logout();
		return "redirect:/login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, BindingResult bindingResult, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		String ipstr="";
		try {
//			 ipstr=getIpAddr(request);
			 ipstr=request.getRemoteAddr();
			 if("0:0:0:0:0:0:0:1".equals(ipstr)){
				 ipstr="127.0.0.1";
			 }
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (bindingResult.hasErrors()) {
			return "/login";
		}
		// 閸掓稑缂撻悽銊﹀煕閸氬秴鎷扮�靛棛鐖滈惃鍕姢閻楋拷
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
		// 鐠佹澘缍嶇拠銉ゆ姢閻楀矉绱濇俊鍌涚亯娑撳秷顔囪ぐ鏇炲灟缁鎶�鐠愵厾澧挎潪锕�濮涢懗鎴掔瑝閼虫垝濞囬悽銊ｏ拷锟�
		token.setRememberMe(true);
		// subject閻炲棜袙閹存劖娼堥梽鎰嚠鐠灺帮拷鍌滆娴肩磫ser
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
		} catch (UnknownAccountException ex) {// 閻€劍鍩涢崥宥嗙梾閺堝澹橀崚鑸拷锟�
			redirectAttributes.addFlashAttribute("message", "閻€劍鍩涢崥宥嗘弓閹垫儳鍩�");
			return "redirect:/login";
		} catch (IncorrectCredentialsException ex) {// 閻€劍鍩涢崥宥呯槕閻椒绗夐崠褰掑帳閵嗭拷
			redirectAttributes.addFlashAttribute("message", "閻€劍鍩涢崥宥嗗灗鐎靛棛鐖滈柨娆掝嚖");
			return "redirect:/login";
		} catch (AuthenticationException e) {// 閸忔湹绮惃鍕瑜版洟鏁婄拠锟�
			redirectAttributes.addFlashAttribute("message", "閸忔湹绮鍌氱埗闁挎瑨顕�");
			return "redirect:/login";
		}
		// 妤犲矁鐦夐弰顖氭儊閹存劕濮涢惂璇茬秿閻ㄥ嫭鏌熷▔锟�
		if (subject.isAuthenticated()) {
			serve.insertJK(user,ipstr);
			return "redirect:/home";
		}
		return null;
	}


	@RequestMapping("/403")
	public String unauthorizedRole() {
		return "/403";
	}

	// 妫ｆ牠銆�
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/home";
	}

	// 閸忣剙寰�
	@RequestMapping(value = "/enterprise", method = RequestMethod.GET)
	public String test(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/enterprise";
	}

	// 鐞涘奔绗�
	@RequestMapping(value = "/industry", method = RequestMethod.GET)
	public String homeRiskDetail(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/industry";
	}

	// 閸忓疇浠�
	@RequestMapping(value = "/relation", method = RequestMethod.GET)
	public String homerelation(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/relation";
	}
	// 閸忓疇浠�
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/upload";
	}
	//注册
	@RequestMapping(value = "/zhuce", method = RequestMethod.GET)
	public String zhuce(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/zhuce";
	}
	//评论
	@RequestMapping(value = "/pinglun", method = RequestMethod.GET)
	public String pinglun(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/pinglun";
	}
	@RequestMapping(value = "/jiankong", method = RequestMethod.GET)
	public String jiankong(HttpServletRequest request, Map<String, String> map, HttpServletResponse response,
			HttpSession session) {
		return "/user/jiankong";
	}

}