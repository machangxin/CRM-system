package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.service.UserService;

//在没有登录时就可以访问的路径
@Controller
public class CommonAction {
	@Autowired
	UserService user_ser;
	//跳转到登陆界面
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	@RequestMapping("loginaction")
	//点击登录--登录操作
	public String loginaction(@RequestParam Map params,HttpSession session) {
		boolean b = user_ser.login(params,session);
		if(b) {
			return "system";
		}
		else {
			return "login";
		}
	}
}
