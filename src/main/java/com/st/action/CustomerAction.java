package com.st.action;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.TableJson;
import com.st.service.CustomerService;
import com.st.service.UserService;

@Controller
@RequestMapping("/sys")
public class CustomerAction {
	@Autowired
	CustomerService cust_ser;

	@RequestMapping("/customer_page")
	public String customer_page() {
		cust_ser.test();
		return "customerPage";
	}
	@RequestMapping("/publiccustomer_page")
	public String publiccustomer_page() {
		cust_ser.test();
		return "publicCustomer";
	}
	@RequestMapping("/privatecustomer_page")
	public String privatecustomer_page() {
		cust_ser.test();
		return "privateCustomer";
	}
	@RequestMapping("customer_list")
	@ResponseBody
	public TableJson customer_list(@RequestParam Map params) {
		int count = cust_ser.getCustomerCount(params);
		return new TableJson(count,cust_ser.customer_list(params));
	}
	/**
	 * @author Auk
	 *点击公海客户时,显示的内容
	 */
	@RequestMapping("publiccustomer_list")
	@ResponseBody
	public TableJson publiccustomer_list(@RequestParam Map params) {
		int count = cust_ser.getpublicCustomerCount(params);
		return new TableJson(count,cust_ser.publiccustomer_list(params));
	}
	@RequestMapping("privatecustomer_list")
	@ResponseBody
	public TableJson privatecustomer_list(@RequestParam Map params,HttpSession session) {
		int count = cust_ser.getprivateCustomerCount(params,session);
		return new TableJson(count,cust_ser.privatecustomer_list(params,session));
	}
	@RequestMapping("customer_del")
	@ResponseBody
	public void customer_del(@RequestParam Map params) {
		//删除用户信息
		cust_ser.customer_del(params);
	}
	@RequestMapping("customer_update")
	@ResponseBody
	public void user_update(@RequestParam Map params) {
		cust_ser.customer_update(params);
	}
	@RequestMapping("cust_del_more")
	@ResponseBody
	public void cust_del_more(@RequestParam Map params) {
		//删除用户信息
		cust_ser.cust_del_more(params);
	}
	
	@RequestMapping("customer_save")
	@ResponseBody
	public void customer_save(@RequestParam Map params,HttpSession session) {
		cust_ser.customer_save(params,session);
	}
	@RequestMapping("customer_track")
	@ResponseBody
	public void customer_track(@RequestParam Map params,HttpSession session) {
		cust_ser.customer_track(params,session);
	}
	@RequestMapping("customer_quit")
	@ResponseBody
	public void customer_quit(@RequestParam Map params) {
		cust_ser.customer_quit(params);
	}
}
