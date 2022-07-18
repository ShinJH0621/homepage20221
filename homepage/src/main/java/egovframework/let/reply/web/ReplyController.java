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
import egovframework.let.board.service.BoardVO;
import egovframework.let.reply.service.ReplyService;
import egovframework.let.reply.service.ReplyVO;


@Controller
public class ReplyController {
	
	ReplyService replyService;
	
	
	
	@RequestMapping(value="/reply/add.do")
	
	public String add(@ModelAttribute("ReplyVO") ReplyVO ReplyVO, HttpServletRequest request, ModelMap model, BoardVO boardVo) throws Exception {
		


		
		int num = replyService.addReply(ReplyVO);
		
		return num+"개의 댓글 작성";
		
	}
	
	
}
