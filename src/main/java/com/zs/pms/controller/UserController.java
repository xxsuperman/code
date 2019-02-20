package com.zs.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class UserController {
@Autowired 
UserService us;
@RequestMapping("/user/list.do")
public String list(String page,QueryUser query,ModelMap model) {
	if(page==null) {
		page="1";
	}
	
	
	return null;
	
}





}
