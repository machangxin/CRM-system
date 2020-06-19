package com.st.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.ParamsUtil;
import com.st.dao.VisitDao;

@Service
public class VisitService {
	@Autowired
	VisitDao visit_dao;

	public void customer_visit(Map params, HttpSession session) {
		ParamsUtil.uuid(params);
		ParamsUtil.loginuserId(params, session);
		ParamsUtil.payment(params);
		visit_dao.customer_visit(params);
	}

	public List visitlog_list(Map params) {
		return visit_dao.visitlog_list(params);
	}

	public Map total_sales() {
		// TODO Auto-generated method stub
		List list = visit_dao.total_sales();
		// System.out.println(list);
		Map map = new HashMap();
		List username_List = new ArrayList();
		List money_List = new ArrayList();
		Map temp = null;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			username_List.add(temp.get("User_realname"));
			money_List.add(temp.get("money"));
		}
		map.put("name", username_List);
		map.put("money", money_List);
		// System.out.println(map);
		return map;
	}

	public Map cust_total_sales() {
		// TODO Auto-generated method stub
		List list = visit_dao.cust_total_sales();
		// System.out.println(list);
		Map map = new HashMap();
		List username_List = new ArrayList();
		Map temp = null;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			username_List.add(temp.get("name"));
		}
		map.put("name", username_List);
		map.put("zong", list);
		// System.out.println(map);
		return map;
	}

	public Map total_count() {
		// TODO Auto-generated method stub
		List list = visit_dao.total_count();
		// System.out.println(list);
		Map map = new HashMap();
		List username_List = new ArrayList();
		Map temp = null;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			username_List.add(temp.get("name"));
		}
		map.put("name", username_List);
		map.put("count", list);
		// System.out.println(map);
		return map;
	}

	public Map month_sales() {
		// TODO Auto-generated method stub
		List list = visit_dao.month_sales();
		System.out.println(list);
		Map map = new HashMap();
		List month_sales_List = new ArrayList();
		List month_List = new ArrayList();
		Map temp = null;
		int f = 1;
		for (int i = 0; i < list.size(); i++) {
			temp = (Map) list.get(i);
			month_List.add(temp.get("month"));
			month_sales_List.add(temp.get("buy"));
		}
		map.put("month", month_List);
		map.put("month_sales", month_sales_List);
		System.out.println(map);
		return map;
	}

}
