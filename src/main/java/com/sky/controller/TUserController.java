package com.sky.controller;

import com.sky.entity.TUser;
import com.sky.service.TUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sky.api.TUserService;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("TUser")
public class TUserController {

	@Autowired
	private TUserServiceImpl tUserService;


	@RequestMapping("/userList")
	public String getA(Model model){

		TUser u = tUserService.getTUserById(1);
		TUser tUser = new TUser();
		tUser.setName("json");
		tUser.setAge(29);
		model.addAttribute("user",tUser);
		return "user";
	}


}