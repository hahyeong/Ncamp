package kr.bit.controller;

import kr.bit.bean.Member;
import kr.bit.service.MemberService;
import kr.bit.validator.MemberValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class MemberController {

    @Resource(name = "loginBean")
    private Member loginBean;

    @Autowired
    private MemberService memberService;

    @GetMapping("login")
    public String login(@ModelAttribute("loginProcBean") Member loginProcBean, Model model, @RequestParam(value="fail", defaultValue = "false") boolean fail, @RequestParam(value="not_login", defaultValue = "false") boolean not_login) {
        model.addAttribute("loginProcBean", loginProcBean);
        model.addAttribute("fail", fail);
        model.addAttribute("not_login", not_login);

        return "login";
    }

    @PostMapping("login_proc")
    public String loginProc(@ModelAttribute("loginProcBean") Member loginProcBean, HttpSession session) {
        Member loggedInMember = memberService.getLogin(loginProcBean); // 로그인 처리 후 객체 반환
        if (loggedInMember != null && loggedInMember.isMemberLogin()) {
            session.setAttribute("loginBean", loggedInMember);
            return "redirect:/main";
        } else {
            return "redirect:/login?fail=true";
        }
    }

    @GetMapping("main")
    public String main(Model model, HttpSession session) {
        Member user = (Member) session.getAttribute("loginBean");
        model.addAttribute("name", user.getName());
        return "main"; // main.jsp로 이동
    }

    @GetMapping("user_info")
    public String user_info() {
        return "user_info";
    }

    @GetMapping("sign_up")
    public String signUp(@ModelAttribute("signUpProcBean") Member signUpProcBean) {
        return "sign_up";
    }

    @PostMapping("sign_up_proc")
    public String sig_up_proc(@Valid @ModelAttribute("signUpProcBean") Member signUpProcBean, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "sign_up";
        }
        memberService.signUpMember(signUpProcBean);
        return "info_chk";
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        System.out.println(session.getAttribute("loginBean"));
        session.removeAttribute("loginBean");
        System.out.println(session.getAttribute("loginBean"));
        return "logout";
    }

    @GetMapping("chk_pwd")
    public String chk_pwd_modify(@ModelAttribute("chkPwdProcBean") Member chkPwdProcBean, Model model, @RequestParam(value="fail", defaultValue = "false") boolean fail) {
        model.addAttribute("chkPwdProcBean", chkPwdProcBean);
        model.addAttribute("fail", fail);

        return "chk_pwd";
    }

    @GetMapping("chk_pwd_delete")
    public String chk_pwd_delete(@ModelAttribute("chkPwdDeleteProcBean") Member chkPwdDeleteProcBean, Model model, @RequestParam(value="fail", defaultValue = "false") boolean fail) {
        model.addAttribute("chkPwdDeleteProcBean", chkPwdDeleteProcBean);
        model.addAttribute("fail", fail);

        return "chk_pwd_delete";
    }

    @PostMapping("chk_pwd_proc")
    public String chk_pwd_proc(@ModelAttribute("chkPwdProcBean") Member chkPwdProcBean, HttpSession session) {
        Member member = (Member) session.getAttribute("loginBean");
        String real_pwd = member.getPassword();
        String input_pwd = chkPwdProcBean.getPassword();
        System.out.println(real_pwd.equals(input_pwd));
        if(real_pwd.equals(input_pwd)) {
            return "redirect:/modify";
        } else {
            return "redirect:/chk_pwd?fail=true";
        }
    }

    @PostMapping("chk_pwd_delete_proc")
    public String chk_pwd_delete_proc(@ModelAttribute("chkPwdDeleteProcBean") Member chkPwdDeleteProcBean, HttpSession session) {
        Member member = (Member) session.getAttribute("loginBean");
        String real_pwd = member.getPassword();
        String input_pwd = chkPwdDeleteProcBean.getPassword();
        System.out.println(real_pwd.equals(input_pwd));
        if(real_pwd.equals(input_pwd)) {
            return "redirect:/delete";
        } else {
            return "redirect:/chk_pwd_delete?fail=true";
        }
    }

    @GetMapping("modify")
    public String modify(@ModelAttribute("modifyProcBean") Member modifyProcBean, Model model, HttpSession session) {
        modifyProcBean = (Member) session.getAttribute("loginBean");
        model.addAttribute("modifyProcBean", modifyProcBean);
        return "modify";
    }

    @PostMapping("modify_proc")
    public String modify_proc(@Valid @ModelAttribute("modifyProcBean") Member modifyProcBean, BindingResult bindingResult, HttpSession session) {
        if(bindingResult.hasErrors()) {
            return "modify";
        }
        memberService.modifyMember(modifyProcBean);
        session.removeAttribute("loginBean");
        session.setAttribute("loginBean", modifyProcBean);
        return "redirect:/modify";
    }

    @GetMapping("delete")
    public String delete() {
        return "delete";
    }

    @PostMapping("delete_proc")
    public String delete_proc(HttpSession session) {
        Member member =(Member) session.getAttribute("loginBean");
        memberService.deleteAccount(member.getId());
        return "redirect:/login";
    }

    @InitBinder
    //Validator 커스터마이징 과정 중 2. 컨트롤러에 인터페이스 등록
    public void initBinder(WebDataBinder binder) {
        MemberValidator memberValidator = new MemberValidator();
        binder.addValidators(memberValidator);
    }
}
