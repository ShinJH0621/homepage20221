package egovframework.let.crud.service.impl;
import java.util.Iterator;
import java.util.List;

import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.crud.service.CrudVO;
import egovframework.let.tempcrud.service.TempcrudVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import org.springframework.stereotype.Repository;


@Mapper("crudMapper")
public interface CrudMapper {
	
	
    CrudVO selectCrud(CrudVO vo) throws Exception;
    
    
    List<EgovMap> selectCrudList(CrudVO vo) throws Exception;	//List형식으로 받아옴
    
    
    void insertCrud(CrudVO vo) throws Exception; //return 값이 없기 때문에 void
    
    
    void updateCrud(CrudVO vo) throws Exception; 
    
    
    void deleteCrud(CrudVO vo) throws Exception;
    
    
    int selectCrudListCnt(CrudVO vo) throws Exception;
}
