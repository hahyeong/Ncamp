package kr.bit.bean;

import javax.validation.constraints.NotBlank;

public class Member {
    @NotBlank
    private String id;
    @NotBlank
    private String password;
    @NotBlank
    private String password_chk;
    @NotBlank
    private String name;
    @NotBlank
    private String gender;
    private String email_name;
    private String email_site;
    @NotBlank
    private String birth_date;
    private String zip_code;
    private String address1;
    private String address2;
    private String hobby;
    private String job;
    private boolean memberLogin;
    private boolean existID;

    public Member() {
        this.memberLogin = false;
        this.existID = false;
    }

    public Member(String id, String password, String password_chk, String name, String gender, String email, String birth_date, String zip_code, String address1, String address2, String hobby, String job, boolean memberLogin, boolean existID) {
        this.id = id;
        this.password = password;
        this.password_chk = password_chk;
        this.name = name;
        this.gender = gender;
        this.email_name = email_name;
        this.email_site = email_site;
        this.birth_date = birth_date;
        this.zip_code = zip_code;
        this.address1 = address1;
        this.address2 = address2;
        this.hobby = hobby;
        this.job = job;
        this.memberLogin = false;
        this.existID = false;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword_chk() {
        return password_chk;
    }

    public void setPassword_chk(String password_chk) {
        this.password_chk = password_chk;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail_name() {
        return email_name;
    }

    public void setEmail_name(String email_name) {
        this.email_name = email_name;
    }

    public String getEmail_site() {
        return email_site;
    }

    public void setEmail_site(String email_site) {
        this.email_site = email_site;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public boolean isMemberLogin() {
        return memberLogin;
    }

    public void setMemberLogin(boolean memberLogin) {
        this.memberLogin = memberLogin;
    }

    public boolean isExistID() {
        return existID;
    }

    public void setExistID(boolean existID) {
        this.existID = existID;
    }
}
