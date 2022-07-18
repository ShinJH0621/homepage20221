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
	<c:param name="like" value="Y"/>
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 레시피</title>
<link href="/asset/front/css/style.css" rel="stylesheet" />

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="/asset/rcmdstyle.css" rel="stylesheet"/>

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
.cont {
	position: relative;
}
.cont p{
	padding-top: 5px;
	display: inline-block;
}
footer {
	
    text-align: center;
    
}
footer p {
	padding: 10px 0;
}
#likedelete {
	position: absolute;
	right: 10px;
	bottom: 10px;
	cursor: pointer;
	width: 24px;
	height: 24px;
}
#likedelete:hover{
	border: none;
	outline: none;
}
</style>


</head>
<body>
<div class="wrap">
        
  <%@include file="/WEB-INF/jsp/main/inc/Header.jsp" %>
        <div class="logo1">
            <img src="/asset/likelogo.png" alt="" id="lg" width="310px;" height="245px;">
        </div>
        <div class="thisweek">
            <h1>${USER_INFO.name}님이 찜한 레시피</h1>
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
                    <a href="${viewUrl}"><strong >${result.boardSj}</strong></a>
                    
					<br/>
              
                    <p>작성일 : <fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></p>
                    <form action="/board/likedel.do" method="post">
                   <!--  <img alt="찜삭제" src="/asset/ximage.png" class="likedelete" width="24px" height="24px"> -->
                    <input type="hidden" name="boardLikeUser" value="${USER_INFO.id}"/>
                    <input type="hidden" name="boardLikeCno" value="${result.boardId}"/>
                    <input type="image" name="btn-delete" id="likedelete" src="/asset/ximage.png" alt="찜삭제" title="찜삭제" />
                    </form>	
                    
                </div>
            </li>
           </c:forEach>
       		 </ul>
  		  </div>
			<div id="paging">
				<c:url var="pageUrl" value="/board/likeList.do${_BASE_PARAM}"/>
				<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
			</div>
<%@include file="/WEB-INF/jsp/main/inc/Footer.jsp"%>		
<!-- <script type="text/javascript">
			
					$('.likedelete').on('click', function() {
							

							$.ajax({
								  url: "/board/likedel.do", 
								  method: "POST",	
								  data: { boardLikeUser : $('[name="boardLikeUser"]').val(), boardLikeCno : $('[name="boardLikeCno"]').val()}, 
								  dataType: "text"	
								}).done(function( msg ) { 
									location.reload();
								}).fail(function( jqXHR, textStatus ) { 
								  alert( "Request failed: " + textStatus );
								});	
							
					})
				</script> -->
				<script type="text/javascript">
				$(document).ready(function(){
					$('#likedelete').tooltip();
				});
				
				
				
				</script>

</body>
</html>