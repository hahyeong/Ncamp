package kr.bit.mapper;

import kr.bit.bean.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberMapper {

    @Select("select * from member where id=#{id} and password=#{password}")
    Member getLogin(Member loginProcBean);

    @Insert("insert into member values(#{id}, #{password}, #{name}, #{gender}, #{email_name}, #{email_site}, #{birth_date}, #{zip_code}, #{address1}, #{address2}, #{hobby}, #{job})")
    void signUpMember(Member signUpProcBean);

    @Select("select name from member where id=#{id}")
    String isExistId(String id);

    @Update("update member " +
            "set password=#{password}, gender=#{gender}, birth_date=#{birth_date}, email_name=#{email_name}, email_site=#{email_site}, zip_code=#{zip_code}, address1=#{address1}, address2=#{address2}, hobby=#{hobby}, job=#{job} " +
            "where id=#{id}")
    void modifyMember(Member modifyProcBean);
}
