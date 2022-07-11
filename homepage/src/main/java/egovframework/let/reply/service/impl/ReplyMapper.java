package egovframework.let.reply.service.impl;

import egovframework.let.reply.service.ReplyVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("replyMapper")
public interface ReplyMapper {

	void addReply(ReplyVO vo) throws Exception;

}
