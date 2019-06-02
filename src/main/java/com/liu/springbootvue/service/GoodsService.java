package com.liu.springbootvue.service;

import com.liu.springbootvue.entity.Goods;
import com.liu.springbootvue.entity.PageBean;

public interface GoodsService extends BaseService<Goods> {

    PageBean findByPage(Goods goods,int pageCode,int pageSize);

}
