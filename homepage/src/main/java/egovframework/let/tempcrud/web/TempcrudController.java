package egovframework.let.tempcrud.web;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;

import egovframework.let.tempcrud.service.TempcrudVO;
import egovframework.let.tempcrud.service.TempcrudService;
import egovframework.let.utl.fcc.service.EgovStringUtil;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;


@Controller
public class TempcrudController {
	@Resource(name = "tempcrudService") //상속을 여러개 받을때 @Resource를 사용한다. 이 tempService 이름은 serviceimpl에서 선언된 service명과 같아야한다.
	private TempcrudService tempcrudService;
	
	//임시데이터 가져오기
	@RequestMapping(value="/tempcrud/select.do")
	public String select(@ModelAttribute("searchVO") TempcrudVO searchVO,
			HttpServletRequest request, ModelMap model) throws Exception{
		
		TempcrudVO result = tempcrudService.selectTemp(searchVO);
		model.addAttribute("result", result);
		return "tempcrud/TempSelect";
	}
	//임시데이터 목록 가져오기
	@RequestMapping(value="/tempcrud/selectList.do")
	public String selectList(@ModelAttribute("searchVO") TempcrudVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = tempcrudService.selectTempListCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<EgovMap> resultList = tempcrudService.selectTempList(searchVO);
		model.addAttribute("resultList", resultList);
		
		
		
		return "tempcrud/TempSelectList";
	}
	
	//임시데이터 등록/수정
	@RequestMapping(value = "/tempcrud/tempRegist.do")
	public String tempRegist(@ModelAttribute("searchVO") TempcrudVO tempVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		TempcrudVO result = new TempcrudVO();
		if(!EgovStringUtil.isEmpty(tempVO.getCrudId())) {
			result = tempcrudService.selectTemp(tempVO);
			}
		model.addAttribute("result",result);
			
		return "tempcrud/TempRegist";
	}
	
	//임시데이터 등록하기
	@RequestMapping(value = "/tempcrud/insert.do")
	public String insert(@ModelAttribute("searchVO") TempcrudVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		tempcrudService.insertTemp(searchVO);
		return "forward:/tempcrud/selectList.do";
	}
	
	//임시데이터 수정하기
	@RequestMapping(value = "/tempcrud/update.do")
	public String update(@ModelAttribute("searchVO") TempcrudVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		tempcrudService.updateTemp(searchVO);
		return "forward:/tempcrud/selectList.do";
	}
	
	//임시데이터 삭제하기
	@RequestMapping(value = "/tempcrud/delete.do")
	public String delete(@ModelAttribute("searchVO") TempcrudVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		tempcrudService.deleteTemp(searchVO);
		return "forward:/tempcrud/selectList.do";
	}
	


}
