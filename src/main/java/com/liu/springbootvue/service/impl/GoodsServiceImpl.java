package com.liu.springbootvue.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liu.springbootvue.entity.Goods;
import com.liu.springbootvue.entity.PageBean;
import com.liu.springbootvue.mapper.GoodsMapper;
import com.liu.springbootvue.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public PageBean findByPage(Goods goods, int pageCode, int pageSize) {

        PageHelper.startPage(pageCode,pageSize);

        Page<Goods> page = goodsMapper.findByPage(goods);

        return new PageBean(page.getTotal(),page.getResult());
    }

    @Override
    public List<Goods> findAll() {
        return null;
    }

    @Override
    public List<Goods> findById(Long id) {
        return goodsMapper.findById(id);
    }

    @Override
    public void create(Goods goods) {
        goodsMapper.create(goods);
    }

    @Override
    public void delete(Long... ids) {
        for (Long id : ids){
            goodsMapper.delete(id);
        }
    }

    @Override
    public void update(Goods goods) {
        goodsMapper.update(goods);
    }
}
