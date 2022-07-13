package egovframework.let.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.board.service.BoardVO;
import egovframework.let.board.service.LikeService;
import egovframework.let.board.service.LikeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("likeService")
public class LikeServiceImpl implements LikeService {

	@Resource(name="likeMapper")
	private LikeMapper likeMapper;
	
	@Override
	public int likeadd(LikeVO vo) throws Exception {
		
		return likeMapper.likeadd(vo);
	}

	@Override
	public void likedel(LikeVO vo) throws Exception {
		
		likeMapper.likedel(vo);
		
	}

}
