package egovframework.let.tempcrud.service.impl;
import java.util.Iterator;
import java.util.List;

import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.tempcrud.service.TempcrudVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import org.springframework.stereotype.Repository;


@Mapper("tempcrudMapper")
public interface TempcrudMapper {
	
	
    TempcrudVO selectTemp(TempcrudVO vo) throws Exception;
    
    
    List<EgovMap> selectTempList(TempcrudVO vo) throws Exception;	//List형식으로 받아옴
    
    
    void insertTemp(TempcrudVO vo) throws Exception; //return 값이 없기 때문에 void
    
    
    void updateTemp(TempcrudVO vo) throws Exception; 
    
    
    void deleteTemp(TempcrudVO vo) throws Exception;
    
    
    int selectTempListCnt(TempcrudVO vo) throws Exception;
}
