package egovframework.let.reply.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.reply.service.ReplyService;
import egovframework.let.reply.service.ReplyVO;


@Controller
public class ReplyController {
	
	ReplyService replyService;
	
	
	
	@RequestMapping(value="/reply/add.do")
	@ResponseBody
	public String add(@ModelAttribute("ReplyVO") ReplyVO ReplyVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user == null || user.getId() == null) {
			model.addAttribute("message", "로그인 후 사용가능합니다");
			return "forward:/board/main.do";
		}
		else {
			model.addAttribute("USER_INFO", user);
		}
		
		ReplyVO.setReplyEmplyrId(user.getId());
		
		replyService.addReply(ReplyVO);
		
		return "";
		
	}
	
	
}
