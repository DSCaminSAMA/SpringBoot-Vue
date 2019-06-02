package com.liu.springbootvue.service;

import com.liu.springbootvue.entity.User;

public interface UserService extends BaseService<User>{

    User findByName(String name);

}
