package egovframework.let.crud2.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.board.service.BoardVO;
import egovframework.let.crud2.service.Crud2Service;
import egovframework.let.crud2.service.Crud2VO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.fcc.service.FileMngUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Crud2Controller {
	@Resource(name = "crud2Service")
	private Crud2Service crud2Service;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "fileMngUtil")
	private FileMngUtil fileUtil;
	
	@RequestMapping(value="/crud2/selectList.do")
	public String selectList(@ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = crud2Service.selectCrud2ListCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<EgovMap> resultList = crud2Service.selectCrud2List(searchVO);
		model.addAttribute("resultList", resultList);
		
		
		return "crud2/Crud2SelectList";
	}
	
	
	@RequestMapping(value="/crud2/select.do")
	public String select(@ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		
		
		Crud2VO result = crud2Service.selectCrud2(searchVO);
		model.addAttribute("result", result);
		
		
		return "crud2/Crud2Select";
	}
	
	@RequestMapping(value="/crud2/crud2Regist.do")
	public String crud2Regist(@ModelAttribute("searchVO") Crud2VO Crud2VO, HttpServletRequest request, ModelMap model) throws Exception{
		
		
		
		Crud2VO result = new Crud2VO();
		if(!EgovStringUtil.isEmpty(Crud2VO.getCrudId())) {
			
			result = crud2Service.selectCrud2(Crud2VO);
		}
		model.addAttribute("result", result);
		
		request.getSession().removeAttribute("sessionBoard");	//insert하면 생기는 sessionBoard를 삭제해준다. 이유:세션이 남아있으면 등록이 불가능하니까.
		
		return "crud2/Crud2Regist";
	}
	
	@RequestMapping(value = "/crud2/insert.do")
	public String insert(@ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
	
		crud2Service.insertCrud2(searchVO);
		
		return "forward:/crud2/selectList.do";
	}
	
	@RequestMapping(value = "/crud2/update.do")
	public String update(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		//이중 서브밋 방지
		if(request.getSession().getAttribute("sessionBoard") != null) {
			return "forward:/crud2/selectList.do";
		}
		
		
		
		
		
		
		crud2Service.updateCrud2(searchVO);
		//이중 서브밋 방지
		request.getSession().setAttribute("sessionBoard", searchVO);
		return "forward:/crud2/selectList.do";
	}
	
	@RequestMapping(value = "/crud2/delete.do")
	public String delete(@ModelAttribute("searchVO") Crud2VO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		
		
		crud2Service.deleteCrud2(searchVO);
		
		return "forward:/crud2/selectList.do";
	}
	
}
