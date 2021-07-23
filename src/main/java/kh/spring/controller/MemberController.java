package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	public HttpSession session;
	
	@RequestMapping("signup")
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping("signupProc")
	public String signupProc(MemberDTO dto) {
		dao.insert(dto);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck", produces="text/html;charset=utf8")
	public String idDupleChk(String id) {
		int result = dao.idDupleChk(id);
		return String.valueOf(result);
	}
	
	@RequestMapping("loginProc")
	public String loginProc(String id, String pw) {
		int result = dao.login(id, pw);
		if(result>0) {
			session.setAttribute("loginID", id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("loginID");
		return "redirect:/";
	}

}
