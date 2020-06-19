package com.st.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.Util.ParamsUtil;
import com.st.dao.CustomerDao;
import com.st.dao.UserDao;

@Service
public class CustomerService {
	@Autowired
	CustomerDao cust_dao;
	
	public void test() {
		List list=cust_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	
	public List customer_list(Map params) {
		ParamsUtil.page(params);
		return cust_dao.customer_list(params);
	}

	public int getCustomerCount(Map params) {
		// TODO Auto-generated method stub
		return cust_dao.getCustomerCount(params);
	}

	public void customer_del(Map params) {
		// TODO Auto-generated method stub
		cust_dao.customer_del(params);
	}

	public void customer_update(Map params) {
		// TODO Auto-generated method stub
		cust_dao.customer_update(params);
	}

	public void cust_del_more(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.arr_str(params,"custids");
		cust_dao.cust_del_more(params);
	}

	public void customer_save(Map params,HttpSession session) {
		// TODO Auto-generated method stub
		ParamsUtil.uuid(params);
		String str = params.get("private")+"";
		if("null".equals(str)) {
			params.put("loginuserId", "");
			ParamsUtil.state(params, 0);
		}else {
			ParamsUtil.loginuserId(params, session);
			ParamsUtil.state(params, 1);
		}
		cust_dao.customer_save(params);
	}

	public void customer_track(Map params,HttpSession session) {
		ParamsUtil.state(params, 1);
		//当前登陆用户
		ParamsUtil.loginuserId(params, session);
		cust_dao.customer_track(params);
	}

	public List publiccustomer_list(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.page(params);
		return cust_dao.publiccustomer_list(params);
	}

	public int getpublicCustomerCount(Map params) {
		// TODO Auto-generated method stub
		return cust_dao.getpublicCustomerCount(params);
	}

	public int getprivateCustomerCount(Map params,HttpSession session) {
		// TODO Auto-generated method stub
		ParamsUtil.loginuserId(params, session);
		return cust_dao.getprivateCustomerCount(params);
	}

	public List privatecustomer_list(Map params,HttpSession session) {
		// TODO Auto-generated method stub
		//当前登陆用户
		ParamsUtil.page(params);
		ParamsUtil.loginuserId(params, session);
		return cust_dao.privatecustomer_list(params);
	}

	public void customer_quit(Map params) {
		// TODO Auto-generated method stub
		ParamsUtil.state(params, 0);
		cust_dao.customer_quit(params);
	}
}
