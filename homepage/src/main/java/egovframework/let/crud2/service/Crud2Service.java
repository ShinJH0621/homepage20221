package egovframework.let.crud2.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface Crud2Service {

	List<EgovMap> selectCrud2List(Crud2VO vo) throws Exception;

	public int selectCrud2ListCnt(Crud2VO vo) throws Exception;

	public Crud2VO selectCrud2(Crud2VO vo) throws Exception;

	public String insertCrud2(Crud2VO vo) throws Exception;

	public void updateCrud2(Crud2VO vo) throws Exception;

	public void deleteCrud2(Crud2VO vo) throws Exception;

}
