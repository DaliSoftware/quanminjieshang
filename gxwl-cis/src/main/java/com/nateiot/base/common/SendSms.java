package com.nateiot.base.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import com.nateiot.base.domain.RegisterRecord;

public class SendSms {
	
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	public static void sendRegisterSecurityCode(RegisterRecord record) {
		int mobile_code = (int)((Math.random()*9+1)*100000);
		record.setPhoneVerifyCode(mobile_code);
		
		//有模板格式的限定  乱改可能导致发送失败
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		HttpClient client = HttpClients.createDefault(); 
		HttpPost post = new HttpPost(Url);
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account", "C22927390")); //查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
		params.add(new BasicNameValuePair("password", "e30b80585188f9d92e098570a1edfce2"));  //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
	    //params.add(new BasicNameValuePair("password", util.StringUtil.MD5Encode("密码"));
		params.add(new BasicNameValuePair("mobile", record.getRegisterPhone()));
		params.add(new BasicNameValuePair("content", content));
		
    	try {
    		UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(params, "UTF-8");
			post.setEntity(formEntity);
			
			//TODO 完善后再发送真正的短信验证
			/*HttpResponse response = client.execute(post);
			System.out.println("发送短信验证码的情况： "+response.getStatusLine().getStatusCode());
			if(response.getStatusLine().getStatusCode() == 200){
				record.setPhoneVerifyCode(mobile_code);
			}else{
				record.setPhoneVerifyCode(null);
			}*/
			
			{//TODO 用正式环境发送短信验证码时删除此块代码
				record.setPhoneVerifyCode(8888);
			}
			
			record.setCreateTime(new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}