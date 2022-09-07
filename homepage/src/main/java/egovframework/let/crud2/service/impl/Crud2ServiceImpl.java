package egovframework.let.crud2.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import egovframework.let.crud2.service.Crud2Service;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("crud2Service")
public class Crud2ServiceImpl implements Crud2Service {
	
	@Resource(name="crud2Mapper")
	private Crud2Mapper crud2Mapper;
	
	@Resource(name = "egovCrudIdGnrService")
	private EgovIdGnrService idgenService;
	

	@Override
	public List<EgovMap> selectCrud2List(Crud2VO vo) throws Exception {
		return crud2Mapper.selectCrud2List(vo);
	}

	@Override
	public int selectCrud2ListCnt(Crud2VO vo) throws Exception {
		
		return crud2Mapper.selectCrud2ListCnt(vo);
	}

	@Override
	public Crud2VO selectCrud2(Crud2VO vo) throws Exception {
		
		return crud2Mapper.selectCrud2(vo);
	}

	@Override
	public String insertCrud2(Crud2VO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setCrudId(id);
		crud2Mapper.insertCrud2(vo);
		return id;
	}

	@Override
	public void updateCrud2(Crud2VO vo) throws Exception {
		
		crud2Mapper.updateCrud2(vo);
	}

	@Override
	public void deleteCrud2(Crud2VO vo) throws Exception {
		crud2Mapper.deleteCrud2(vo);
		
	}

}
