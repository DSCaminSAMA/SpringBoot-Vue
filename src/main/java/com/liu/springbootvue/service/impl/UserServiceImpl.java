package com.liu.springbootvue.service.impl;

import com.liu.springbootvue.entity.User;
import com.liu.springbootvue.mapper.UserMapper;
import com.liu.springbootvue.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByName(String name) {
        return userMapper.findByName(name);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public List<User> findById(Long id) {
        return userMapper.findById(id);
    }

    @Override
    public void create(User user) {
        userMapper.create(user);
    }

    @Override
    public void delete(Long... ids) {
        for (Long id:ids) {
            userMapper.delate(id);
        }
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }
}
