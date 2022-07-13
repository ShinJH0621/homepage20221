<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}"/>
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}"/>
	</c:if>
	<c:param name="recommend" value="Y"/>
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 메뉴 추천</title>
<link href="/asset/front/css/style.css" rel="stylesheet" />

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="/asset/rcmdstyle.css?after" rel="stylesheet"/>
<script LANGUAGE="JavaScript">
        
        function formatDate(date) {
               var mymonth = date.getMonth()+1;
               var myweekday = date.getDate();
               return (mymonth + "월" + myweekday + "일");
        }
        
        function printWeek() {
               var now = new Date();
               var nowDayOfWeek = now.getDay();
               var nowDay = now.getDate();
               var nowMonth = now.getMonth();
               var nowYear = now.getYear();
               nowYear += (nowYear < 2000) ? 1900 : 0;
               var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
               var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
               document.write(formatDate(weekStartDate) + " - " + formatDate(weekEndDate));
        }
        
</script>
<style>
.logo1 {
	text-align: center;
}
.list_wrap .item .image .noimage {
text-align: center;
padding-top: 100px;
width: 100%;
}
.menu .gnb a:hover {
	color: #bbb;
}
.cont p{
	padding-top: 5px;
}
footer {
	
    text-align: center;
    
}
footer p {
	padding: 10px 0;
}


</style>


</head>
<body>
<div class="wrap">
        
 	<%@include file="/WEB-INF/jsp/main/inc/Header.jsp" %>
        <div class="logo1">
            <img src="/asset/whattoeat.png" alt="" id="lg" width="310px;" height="245px;">
        </div>
        <div class="thisweek">
            <h1><script>
                printWeek();
                </script> | 이번주 추천메뉴</h1>
        </div>
</div>

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
					<img src="${thumbUrl}" alt="" width="100%;" height="200px"/>
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
			<div id="paging">
				<c:url var="pageUrl" value="/board/recommendList.do${_BASE_PARAM}"/>
				<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>
	<%@include file="/WEB-INF/jsp/main/inc/Footer.jsp"%>			
			


</body>
</html>