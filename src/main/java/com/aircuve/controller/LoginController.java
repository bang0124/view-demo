package com.aircuve.controller;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aircuve.bean.Config;
import com.aircuve.bean.HttpsConnection;


@RestController
@RequestMapping("/login")
public class LoginController {
	
	

	@RequestMapping(value="/request", method=RequestMethod.POST) 
	public String login(@RequestParam String userId,
			@RequestParam String userPwd) {
		
		
		JSONObject resultJson = new JSONObject();
		JSONObject requestJson = new JSONObject();
		System.out.println(userId);
		System.out.println(userPwd);
		
		requestJson.put("userId", userId);
		requestJson.put("userPwd", userPwd);
		
		
		
		resultJson = new JSONObject(HttpsConnection.doPost(Config.api_url+"/login/request", requestJson));
		//resultJson.put("success", "true");
		
		System.out.println("resultJson : "+resultJson.toString());
		
		return resultJson.toString();
	}
	
}
