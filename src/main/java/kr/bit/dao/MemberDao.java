package kr.bit.dao;

import kr.bit.bean.Member;
import kr.bit.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

    @Autowired
    private MemberMapper memberMapper;

    public Member getLogin(Member loginProcBean) {
        return memberMapper.getLogin(loginProcBean);
    }

    public void signUpMember(Member signUpProcBean) {
        memberMapper.signUpMember(signUpProcBean);
    }

    public String isExistId(String id){
        return memberMapper.isExistId(id);
    }

    public void modifyMember(Member modifyProcBean) {
        memberMapper.modifyMember(modifyProcBean);
    }

    public void deleteAccount(String id) {
        memberMapper.deleteAccount(id);
    }
}
