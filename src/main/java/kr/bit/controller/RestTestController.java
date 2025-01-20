package kr.bit.controller;

import kr.bit.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestTestController {

    @Autowired
    private MemberService memberService;

    @GetMapping("chkExistId/{id}")
    public String chkExistId(@PathVariable String id) {
        boolean chk = memberService.isExistId(id);
        return chk ? "true" : "false";
    }
}
