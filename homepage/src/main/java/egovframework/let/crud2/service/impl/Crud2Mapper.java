package egovframework.let.crud2.service.impl;

import java.util.List;

import egovframework.let.crud2.service.Crud2VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("crud2Mapper")
public interface Crud2Mapper {

	List<EgovMap> selectCrud2List(Crud2VO vo);

	int selectCrud2ListCnt(Crud2VO vo);

	Crud2VO selectCrud2(Crud2VO vo);

	void insertCrud2(Crud2VO vo);

	void updateCrud2(Crud2VO vo);

	void deleteCrud2(Crud2VO vo);

}
