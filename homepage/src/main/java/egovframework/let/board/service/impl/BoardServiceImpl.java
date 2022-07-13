package egovframework.let.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.board.service.BoardService;
import egovframework.let.board.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;


import egovframework.let.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	@Resource(name="boardMapper")
	private BoardMapper boardMapper;
	
	@Resource(name = "egovBoardIdGnrService")
	private EgovIdGnrService idgenService;

	//게시물 목록 가져오기
	@Override
	public List<EgovMap> selectBoardList(BoardVO vo) throws Exception {
		return boardMapper.selectBoardList(vo);
	}
	
	//게시물 목록수
	@Override
	public int selectBoardListCnt(BoardVO vo) throws Exception {
		return boardMapper.selectBoardListCnt(vo);
	}
	
	//게시물 등록하기
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setBoardId(id);
		boardMapper.insertBoard(vo);
		
		return id;
	}

	//게시물 상세정보
	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		//조회수 업
		boardMapper.updateViewCnt(vo);
		
		return boardMapper.selectBoard(vo);
	}
	
	//게시물 수정하기
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		boardMapper.updateBoard(vo);
		
	}

	//게시물 삭제하기
	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		boardMapper.deleteBoard(vo);
		
	}
	
	//추천 게시글 목록 가져오기
	@Override
	public List<EgovMap> recommendList(BoardVO vo) throws Exception {
		
		return boardMapper.recommendList(vo);
	}

	@Override
	public int recommendListCnt(BoardVO vo) throws Exception {
		
		return boardMapper.recommendListCnt(vo);
	}

	@Override
	public void recommendUp(BoardVO vo) throws Exception {
		
		boardMapper.recommendUp(vo);
		
	}

	@Override
	public List<EgovMap> likeList(BoardVO vo) throws Exception {
		
		return boardMapper.likeList(vo);
	}

	@Override
	public int likeListCnt(BoardVO vo) throws Exception {
		
		return boardMapper.likeListCnt(vo);
	}

	
	

	}
   

