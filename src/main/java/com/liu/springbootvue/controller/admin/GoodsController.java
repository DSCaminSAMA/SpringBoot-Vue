package com.liu.springbootvue.controller.admin;

import com.liu.springbootvue.entity.Goods;
import com.liu.springbootvue.entity.PageBean;
import com.liu.springbootvue.entity.Result;
import com.liu.springbootvue.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    /**
     * 分页查询
     * @param goods
     * @param pageCode
     * @param pageSize
     * @return
     */
    @RequestMapping("/findByPage")
    public PageBean findByPage (Goods goods,
                                @RequestParam(value = "pageCode",required = false)int pageCode,
                                @RequestParam(value = "pageSize",required = false)int pageSize){
        return goodsService.findByPage(goods,pageCode,pageSize);
    }

    /**
     * 新增商品
     * @param goods
     * @return
     */
    @RequestMapping("/create")
    public Result create(@RequestBody Goods goods){
        try {
            goodsService.create(goods);
            return new Result(true,"创建成功");
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"发生未知错误");
        }
    }

    /**
     * 更新商品
     * @param goods
     * @return
     */
    @RequestMapping("/update")
    public Result update(@RequestBody Goods goods){
        try {
            goodsService.update(goods);
            return new Result(true,"更新成功");
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"更新失败");
        }
    }

    /**
     * 删除方法
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    public Result delete(@RequestBody Long... ids) {
        try {
            goodsService.delete(ids);
            return new Result(true, "更新数据成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "发生未知错误");
        }
    }

    /**
     * 根据id查找
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    public List<Goods> findById(@RequestParam(value = "id",required = false)Long id){
        return goodsService.findById(id);
    }

}
