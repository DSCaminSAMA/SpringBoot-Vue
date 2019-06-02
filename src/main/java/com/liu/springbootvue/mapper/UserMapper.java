package com.liu.springbootvue.mapper;

import com.liu.springbootvue.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    List<User> findAll();

    List<User> findById(Long id);

    void create(User user);

    void delate(Long id);

    void update(User user);

    User findByName(String name);

}
