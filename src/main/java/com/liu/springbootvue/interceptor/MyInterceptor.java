package com.liu.springbootvue.interceptor;


import com.liu.springbootvue.entity.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 自定义拦截器
 */

@Component
@Aspect
public class MyInterceptor {

    @Pointcut("within (com.liu.springbootvue.controller..*) && !within(com.liu.springbootvue.controller.admin.LoginController)")
    public void pointCut(){

    }

    @Around("pointCut()")
    public Object trackInfo(ProceedingJoinPoint joinPoint) throws Throwable {

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        User user = (User) request.getSession().getAttribute("user");

        if (user == null){
            System.out.println("==========用户未登录==========");
            attributes.getResponse().sendRedirect("/login");
        }
        System.out.println("==========用户已登录===========");

        //一定要用Object返回值，若AOP拦截的Controller return了一个视图地址
        //本来 Controller应该跳转到这个视图地址，但是被AOP拦截了，原来的controller仍然会执行return，但是视图地址会显示404
        //切记一定要执行proceed方法，他执行被通知的方法，如果不调用将会阻止被通知的方法的调用，导致return会404

        return joinPoint.proceed();
    }

}
