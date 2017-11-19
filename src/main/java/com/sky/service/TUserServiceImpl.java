package com.sky.service;

import com.sky.entity.TUser;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.sky.dao.TUserMapper;
import com.sky.api.TUserService;

@Service //(value="tUserService")
public class TUserServiceImpl {// implements TUserService {

	@Autowired
	private TUserMapper tUserMapper;

	//@Override
	public TUser getTUserById(Integer id) {
		return tUserMapper.getById(id);
	}
}
