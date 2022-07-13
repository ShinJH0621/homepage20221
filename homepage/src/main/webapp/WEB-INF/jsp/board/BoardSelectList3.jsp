<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}"/>
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}"/>
	</c:if>
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<title>요리?조리!</title>
<link href="/asset/front/css/style.css" rel="stylesheet" />
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>
<link href="/asset/rcmdstyle.css?after" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        body {
            font-family: 'Noto Sans KR', sans-serif;
           
        }
        .list_wrap .item .image .noimage {
text-align: center;
padding-top: 100px;
width: 100%;
}
.ar{
	width: 1200px;
}
.menu .gnb a:hover {
	color: #bbb;
}
footer {
	
    text-align: center;
    
}
footer p {
	padding: 10px 0;
}
#bbs_search {
	width: 1200px;
	margin: 5px auto;
}
</style>
</head>
<body>
   <div class="wrap">
        
      <%@include file="/WEB-INF/jsp/main/inc/Header.jsp" %>
        <div class="logo1">
            <img src="/asset/yori.png" alt="" id="lg" width="310px;" height="245px;">
        </div>
        <div class="thisweek">
            <h1>나만의 <span style="color:red;">비밀</span> 레시피 공유</h1>
        </div>
</div>
		<div id="bbs_search">
			<form name="frm" method="post" action="/board/selectList.do">
				<fieldset>
					<legend>검색조건입력폼</legend>
					<label for="ftext" class="hdn">검색분류선택</label>
					<select name="searchCondition" id="ftext">
						<option value="0" <c:if test="${searchVO.searchCondition eq '0'}">selected="selected"</c:if>>제목</option>
						<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>>내용</option>
						<option value="2" <c:if test="${searchVO.searchCondition eq '2'}">selected="selected"</c:if>>작성자</option>
					</select>
					<label for="inp_text" class="hdn">검색어입력</label>
					<input name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>" type="text" class="inp_s" id="inp_text" />
					<span class="bbtn_s"><input type="submit" value="검색" title="검색(수업용 게시판 게시물 내)" />
					</span>
				</fieldset>
			</form>
		</div>
    <section>
    <div class="list_wrap">
        <ul>
        	<c:forEach var="result" items="${resultList}" varStatus="status">
            <li class="item">
                <div class="image">
                <c:choose>
                <c:when test="${not empty result.atchFileNm}">
					<c:url var="thumbUrl" value="/cmm/fms/getThumbImage.do">
							<c:param name="thumbYn" value="Y"/>
							<c:param name="atchFileNm" value="${result.atchFileNm}"/>
					</c:url>
					<img src="${thumbUrl}" alt="" width="100%" height="200px"/>
				</c:when>
				<c:otherwise>
					<p class="noimage">이미지가 없습니다.</p>
				</c:otherwise>
				</c:choose>
                </div>
                <div class="cont">
                        <c:url var="viewUrl" value="/board/select.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}"/>
							<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
						</c:url>
                    <a href="${viewUrl}"><strong>${result.boardSj}</strong></a>
                   <p>작성일 : <fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></p> 	
                </div>
            </li>
           </c:forEach>
        </ul>
    </div>
    </section>
    		<div id="paging">
				<c:url var="pageUrl" value="/board/selectList.do${_BASE_PARAM}"/>
				<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>
		
		<div class="btn-cont ar">
			<a href="/board/boardRegist.do" class="btn spot">
				<i class="ico-check-spot"></i> 글쓰기			
			</a>
		</div>
<%@include file="/WEB-INF/jsp/main/inc/Footer.jsp"%>		
</body>
</html>