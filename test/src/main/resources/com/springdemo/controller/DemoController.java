package com.springdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @RequestMapping("/index")
    public String index(){
        return "view/demo";
    }
    @RequestMapping("/list")
    public String list(){
        return "demo/list";
    }
}