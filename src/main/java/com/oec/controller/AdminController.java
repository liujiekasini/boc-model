/*
 * 

 * 
 */
package com.oec.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oec.base.BaseController;
import com.oec.demo.service.UserService;
import com.oec.model.Paging;

/**
 * 用来调试controller
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午5:37:14
 */
@Controller
public class AdminController extends BaseController {

	@Autowired
	private UserService service;

	/**
	 * 支付操作
	 * 
	 * @author liujie
	 * @version 1.0
	 * @since 2017年2月7日 下午5:39:00
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/alipay", method = RequestMethod.POST)
	public String insertword(@RequestParam(value = "mon", defaultValue = "0", required = false) int mon,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		return service.alioay(mon);
	}
	/**
	 * 监控页面查询
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/searchmonitor", method = RequestMethod.POST)
	public Paging searchCompany(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int rows,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging message = service.searchmonitor(page, rows);
		return message;
	}
}