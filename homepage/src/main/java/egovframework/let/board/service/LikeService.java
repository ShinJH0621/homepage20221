package egovframework.let.board.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LikeService {
	
	public int likeadd(LikeVO vo) throws Exception;

	public void likedel(LikeVO vo) throws Exception;

}
