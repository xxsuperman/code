package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Constants;
import com.zs.pms.po.Tpermission;
import com.zs.pms.po.Tuser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.MD5;
import com.zs.pms.vo.QueryLogin;
import com.zs.pms.vo.QueryUser;




@Controller
public class LoginController {
	@Autowired UserService us;
	
	
	
	@RequestMapping("/tologin.do")
	public String tologin() {
		
		return "login";
	}
	@RequestMapping("/login.do")
	public String login(QueryLogin login,HttpSession session,ModelMap model) {
		//验证码验证	
		String ocode=(String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if(!ocode.equals(login.getChkcode())) {
			model.addAttribute("MSG","验证码输入有误，请重新输入");
			return "login";
		}
		//验证账号和密码
		QueryUser user=new QueryUser();
		user.setLoginname(login.getLoginname());
		
		MD5 md5=new MD5();
		user.setPassword(md5.getMD5ofStr(login.getPassword()));
		user.setIsenable(1);
		//返回登录的用户
		List<Tuser>tusers=us.queryByCon(user);
		//登录失败
		if(tusers==null||tusers.size()!=1) {
			model.addAttribute("MSG","用户名或密码输入有误，请重新输入");
			return "login";
		}
		session.setAttribute("CUSER", tusers.get(0));
		return "main";
	}
	@RequestMapping("/top.do")
	public String top() {
		return "top";
		
	}
	@RequestMapping("/right.do")
	public String main() {
		return "right";
		
	}
	@RequestMapping("/left.do")
	public String menu(HttpSession session,ModelMap model) {
		Tuser tuser= (Tuser) session.getAttribute("CUSER");
		List<Tpermission>list1=  us.queryByUid(tuser.getId());
		model.addAttribute("MENU",us.getMenu(list1));
		
		
		return "left";
		
	}
	
	
	
	
}
