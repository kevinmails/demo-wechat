package com.imcbb.wechat.demowechat;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value ="/wechatservice", method = RequestMethod.GET)
public class WechatService {


    @GetMapping(value ="receive")
    public String receive(@RequestParam Map<String, Object> params){
        System.out.println(params);
        return "Hello," + params.get("name").toString();
    }

    @GetMapping(value ="tokens")
    public String tokens(@RequestParam Map<String, Object> params){
        System.out.println(params);
        return params.get("echostr").toString();
    }
    
}
