package com.liu.springbootvue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    /**
     * 系统首页
     * @return
     */
    @GetMapping(value = {"/","/index"})
    public String index(){
        return "home/index";
    }

    @GetMapping(value = {"/goods"})
    public String user(){
        return "site/goods";
    }

}
