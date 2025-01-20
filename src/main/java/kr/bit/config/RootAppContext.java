package kr.bit.config;

import kr.bit.bean.Member;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

@Configuration
public class RootAppContext {

    @Bean("loginBean")
    @SessionScope
    public Member loginBean() {
        return new Member();
    }
}
