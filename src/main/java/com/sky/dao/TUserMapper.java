package com.sky.dao;

import com.sky.entity.TUser;
import org.springframework.stereotype.Repository;

//@Repository
//@Mapper
public interface TUserMapper {
	TUser getById(Integer id);
}
