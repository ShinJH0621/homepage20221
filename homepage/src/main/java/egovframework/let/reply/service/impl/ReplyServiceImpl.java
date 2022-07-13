package egovframework.let.reply.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.reply.service.ReplyService;
import egovframework.let.reply.service.ReplyVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Resource(name="replyMapper")
	private ReplyMapper replyMapper;
	
	@Resource(name = "egovReplyIdGnrService")
	private EgovIdGnrService idgenService;
	
	
	@Override
	public int addReply(ReplyVO vo) throws Exception {
		
		String id = idgenService.getNextStringId();
		vo.setReplyId(id);
		
		return replyMapper.addReply(vo);
	}

}
