package com.liu.springbootvue.controller.admin;

import com.liu.springbootvue.entity.Result;
import com.liu.springbootvue.entity.User;
import com.liu.springbootvue.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Result login(@RequestParam("username") String username,
                        @RequestParam("password") String password){
        System.out.println("username:"+username+"---password:" +password);
        User user = userService.findByName(username);
        if (user != null){
            if (user.getPassword().equals(password)){
                ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
                attributes.getRequest().getSession().setAttribute("user",user);
                return new Result(true,user.getUsername());
            }
        }
        return  new Result(false,"登录失败");
    }

    /**
     * 注册
     * @return
     */
    @RequestMapping("/logout")
    public String logout(){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        attributes.getRequest().getSession().removeAttribute("user");
        return "home/login";
    }

    @ResponseBody
    @RequestMapping("/register")
    public Result register(@RequestParam("username") String username,@RequestParam("password")String password){
        try {
            userService.create(new User(username,password));
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            attributes.getRequest().getSession().setAttribute("user",new User(username,password));
            return new Result(true,username);
        }catch (Exception e){
            e.printStackTrace();
        }
        return new Result(false,"发生未知错误");
    }

    /**
     * 登录页
     * @return
     */
    @GetMapping("/login")
    public String login(){
        return "home/login";
    }

    /**
     * 注册页
     * @return
     */
    @GetMapping("/register")
    public String register(){
        return "home/register";
    }

}
