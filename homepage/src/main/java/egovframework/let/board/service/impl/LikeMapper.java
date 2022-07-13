package egovframework.let.board.service.impl;

import egovframework.let.board.service.LikeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("likeMapper")
public interface LikeMapper {

	int likeadd(LikeVO vo) throws Exception;

	void likedel(LikeVO vo) throws Exception;
}
