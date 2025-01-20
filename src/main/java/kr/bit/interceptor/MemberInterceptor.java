package kr.bit.interceptor;

import kr.bit.bean.Member;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInterceptor implements HandlerInterceptor {

    private Member loginBean;

    public MemberInterceptor(Member loginBean) {
        this.loginBean = loginBean;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(loginBean.isMemberLogin() == false) {
            String str = request.getContextPath();
            response.sendRedirect(str+"/login?not_login=true");
            return false;
        }
        return true;
    }
}
