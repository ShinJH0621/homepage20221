package egovframework.let.tempcrud.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;

import egovframework.let.temp2.service.Temp2Service;
import egovframework.let.temp2.service.Temp2VO;
import egovframework.let.tempcrud.service.TempcrudService;
import egovframework.let.tempcrud.service.TempcrudVO;
import egovframework.let.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("tempcrudService")
public class TempcrudServiceImpl extends EgovAbstractServiceImpl implements TempcrudService {

	@Resource(name="tempcrudMapper")
	private TempcrudMapper tempcrudMapper;
	
	@Resource(name = "egovCrudIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Override
	//임시데이터 가져오기
	public TempcrudVO selectTemp(TempcrudVO vo) throws Exception{
		return tempcrudMapper.selectTemp(vo);
	}
	
	//임시데이터 목록 가져오기
	public List<EgovMap> selectTempList(TempcrudVO vo) throws Exception{
		return tempcrudMapper.selectTempList(vo);
	}
	
	//임시데이터 등록하기
	public String insertTemp(TempcrudVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setCrudId(id);
		tempcrudMapper.insertTemp(vo);
		return id;
	}
	
	//임시데이터 수정하기
	public void updateTemp(TempcrudVO vo) throws Exception{
		tempcrudMapper.updateTemp(vo);
	}
	
	//임시데이터 삭제하기
	public void deleteTemp(TempcrudVO vo) throws Exception{
		tempcrudMapper.deleteTemp(vo);
	}

	public int selectTempListCnt(TempcrudVO vo) throws Exception{
		return tempcrudMapper.selectTempListCnt(vo);
	}

	
	
	
	//임시데이터 목록 수
	
	
	
	/*@Override
	public TempVO selectTemp(TempVO vo) throws Exception{
		return tempDAO.selectTemp(vo); */
	}
   

