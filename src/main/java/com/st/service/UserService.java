package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.Util.Md5;
import com.st.Util.ParamsUtil;
import com.st.dao.UserDao;
@Service
public class UserService {
	@Autowired
	UserDao user_dao;
	
	public void test() {
		List list=user_dao.test();
		for(Object obj:list) {
			System.out.println(obj);
		}
	}
	
	public List user_list(Map params) {
		ParamsUtil.page(params);
		return user_dao.user_list(params);
	}

	public int getuserCount(Map params) {
		// TODO Auto-generated method stub
		return user_dao.getuserCount(params);
	}

	public void user_del(Map params) {
		user_dao.user_del(params);
	}
	public String user_save(Map params) {
		ParamsUtil.uuid(params);
		String initpassString = ParamsUtil.initpass(params,params.get("uuid").toString());
		user_dao.user_save(params);
		return initpassString;
	}
	public void user_del_more(Map params) {
		// TODO Auto-generated method stub
		//将userids={1,2,}改成userids={'1','2'}
		ParamsUtil.arr_str(params,"userids");
		user_dao.user_del_more(params);
		
	}
	public void user_update(Map params) {
		user_dao.user_update(params);
	}

	public boolean login(Map params,HttpSession session) {
		// TODO Auto-generated method stub
		//根据用户名查询,是否有该用户的信心
		List list = user_dao.user_login(params);
		if(list!=null&&list.size()==1) {
			Map user=(Map)list.get(0);
			String user_salt_iString=user.get("User_id").toString();
			//System.out.println(user_salt_iString);
			int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
			//有:查询密码是否正确
			String md5pass = Md5.md5(params.get("login_pass").toString(), user_salt_iString, hashint);
			if(md5pass.equals(user.get("User_loginpass"))) {
				session.setAttribute("loginuser", user);
				session.setAttribute("loginuserid", user.get("User_id"));
				return true;
			}
			//没有,密码错误:登陆失败
		}
		return false;
	}
	public void editpass(Map params,HttpSession session) {
		Map user=(Map)session.getAttribute("loginuser");
		String user_salt_iString=user.get("User_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(params.get("user_newpass").toString(), user_salt_iString, hashint);
		params.put("newpass", md5pass);
		params.put("User_id",user_salt_iString);
		user_dao.editpass(params);	
	}

	public boolean confirmpass(Map params, HttpSession session) {
		String pass = params.get("oldpass")+"";
		Map user=(Map)session.getAttribute("loginuser");
		String user_salt_iString=user.get("User_id").toString();
		int hashint=Integer.parseInt(user_salt_iString.substring(user_salt_iString.length()-4));
		String md5pass = Md5.md5(pass, user_salt_iString, hashint);
		return md5pass.equals(user.get("User_loginpass"));
	}

	public boolean confirmusername(Map params) {
		// TODO Auto-generated method stub
		int count = user_dao.confirmusername(params);
		if(count==0) return true;
		return false;
	}
}