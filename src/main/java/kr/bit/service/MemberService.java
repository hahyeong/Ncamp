package kr.bit.service;

import kr.bit.bean.Member;
import kr.bit.dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    public Member getLogin(Member loginProcBean) {

        Member dbMember = memberDao.getLogin(loginProcBean);

        if (memberDao.getLogin(loginProcBean) != null) {
            dbMember.setMemberLogin(true);
        }
        return dbMember;
    }

    public void signUpMember(Member signUpProcBean) {
        memberDao.signUpMember(signUpProcBean);
    }

    public boolean isExistId(String id) {
        String name = memberDao.isExistId(id);

        if(name == null) {
            return true;
        } else return false;
    }

    public void modifyMember(Member modifyProcBean) {
        memberDao.modifyMember(modifyProcBean);
    }

    public void deleteAccount(String id) {
        memberDao.deleteAccount(id);
    }
}
