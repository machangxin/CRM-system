package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.CustomerService;
import com.st.service.VisitService;

@Controller
public class VisitAction {
	@Autowired
	VisitService visit_ser;
	
	@RequestMapping("customer_visit")
	@ResponseBody
	public void customer_visit(@RequestParam Map params,HttpSession session) {
		visit_ser.customer_visit(params,session);
	}
	//跳转到回放记录界面
	@RequestMapping("visitlogPage")
	public String visitlogPage(@RequestParam Map params,HttpServletRequest request) {
		List loglist = visit_ser.visitlog_list(params);
		request.setAttribute("loglist", loglist);
		return "visitlogPage";
	}
	@RequestMapping("datatable_page")
	public String datatable_page() {
		return "datatablePage";
	}
	
	@RequestMapping("total_sales")
	@ResponseBody
	public Map total_sales() {
		return visit_ser.total_sales();
	}
	@RequestMapping("cust_total_sales")
	@ResponseBody
	public Map cust_total_sales() {
		return visit_ser.cust_total_sales();
	}
	@RequestMapping("total_count")
	@ResponseBody
	public Map total_count() {
		return visit_ser.total_count();
	}
	@RequestMapping("month_sales")
	@ResponseBody
	public Map month_sales() {
		Map map=visit_ser.month_sales();
		return map;
	}
}
