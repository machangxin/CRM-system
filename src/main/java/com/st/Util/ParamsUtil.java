package com.st.Util;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;


public class ParamsUtil {
	private static char[] cpass_arr= {'1','2','3', '4', '5', '6', '7', '8', '9', '0', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm', '-', '=', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M'};
	/*
	 * 计算出每页数据开始的下标,保存到params中
	 */
	public static void page(Map params) {
		int page =Integer.parseInt(params.get("page").toString()) ;
		int limit =Integer.parseInt(params.get("limit").toString()) ;
		int start =(page-1)*limit;
		params.put("start",start);
}
	/**向params中添加uuid,属性名为uuid
	 * @param params
	 */
	public static void uuid(Map params) {
		UUID uuid=UUID.randomUUID();
		params.put("uuid", uuid.toString());
	}
	/**添加默认密码,属性为User_loginpass
	 * @author Auk
	 *
	 */
	public static String initpass(Map params,String salt) {
		char  c_arr[] = new char[16];
		int index=0;
		for(int i =0;i<16;i++) {
			index = (int)(Math.random()*cpass_arr.length);
			c_arr[i]=cpass_arr[index];
		}
		String pass= new String(c_arr);
		int hashInt = (int)(Math.random()*1025+1024);
		salt+=hashInt;
		String md5pass=Md5.md5(pass, salt, hashInt);
		params.put("User_loginpass", md5pass);
		params.put("uuid", salt);
		return pass;
	}
	
	/**将数组字符的格式变成'a','b'的形式,方便SQL使用
	 * @param params
	 * @param key
	 */
	public static void arr_str(Map params,Object key) {
		String arr_str=params.get(key)+"";
		arr_str=arr_str.substring(0,arr_str.length()-1);
		arr_str=arr_str.replaceAll(",", "','");
		arr_str="'"+arr_str+"'";
		params.put(key,arr_str);
	}
	
	public static void state(Map params,int state) {
		params.put("Customer_state", state);
	}
	public static void loginuserId(Map params,HttpSession session) {
		params.put("loginuserId", session.getAttribute("loginuserid"));
	}
	public static void payment(Map params) {
		String payment=params.get("visit_payment")+"";
		params.put("visit_payment","on".equals(payment)? 1:0);
	}
}
