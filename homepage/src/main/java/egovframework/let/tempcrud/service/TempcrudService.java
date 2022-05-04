package egovframework.let.tempcrud.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;


public interface TempcrudService {
	//임시데이터 가져오기
	public TempcrudVO selectTemp(TempcrudVO vo) throws Exception;
	
	//임시데이터 목록 가져오기
	public List<EgovMap> selectTempList(TempcrudVO vo) throws Exception;
	
	//임시데이터 등록하기
	public String insertTemp(TempcrudVO vo) throws Exception;
	
	//임시데이터 수정하기
	public void updateTemp(TempcrudVO vo) throws Exception;
	
	//임시데이터 삭제하기
	public void deleteTemp(TempcrudVO vo) throws Exception;
	
	//임시데이터 목록 수
	public int selectTempListCnt(TempcrudVO vo) throws Exception;
}