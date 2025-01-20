package kr.bit.validator;

import kr.bit.bean.Member;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Member.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Member member = (Member) target;

        // error문을 한 번에 한 개씩만 띄우고 싶은 마음에 다소 더러운 코드가 되어벌임,, 에잉 몰라

        // id
        String id = member.getId();
        if(!id.isBlank()) {
            if(!id.matches("^[a-zA-Z0-9]+$")) {
                errors.rejectValue("id", "wrong_id_pattern");
            }
            else if(id.length() < 4 || id.length() > 20) {
                errors.rejectValue("id", "wrong_id_length");
            } else if(errors.getObjectName().equals("signUpProcBean") && member.isExistID() == false) {
                errors.rejectValue("id", "id_not_double_checked");
            }
        }

        // password
        String password = member.getPassword();
        if(!password.isBlank()) {
            if(!password.matches("^[a-zA-Z0-9]+$")) {
                errors.rejectValue("password", "wrong_password_pattern");
            }
            else if(password.length() < 4 || password.length() > 20) {
                errors.rejectValue("password", "wrong_password_length");
            }
        }

        // password_chk
        String password_chk = member.getPassword_chk();
        if(!password_chk.isBlank()) {
            if(!password_chk.matches("^[a-zA-Z0-9]+$")) {
                errors.rejectValue("password_chk", "wrong_password_chk_pattern");
            }
            else if(password_chk.length() < 4 || password_chk.length() > 20) {
                errors.rejectValue("password_chk", "wrong_password_chk_length");
            } else if(!password_chk.equals(password)) {
                errors.rejectValue("password_chk", "wrong_password_chk");
            }
        }

        // name
        String name = member.getName();
        if(!name.isBlank() && name.length() > 10) {
            errors.rejectValue("name", "wrong_name_length");
        }

        // birth_date
        String birth_date = member.getBirth_date();
        if(!birth_date.isBlank() && !birth_date.matches("[0-9]{8}")) {
            errors.rejectValue("birth_date", "wrong_birth_date");
        }

        //email
        String email_name = member.getEmail_name();
        String email_site = member.getEmail_site();
        if(email_name.isBlank() || email_site.isBlank()) {
            errors.rejectValue("email_name", "blank_email");
        }
    }
}
