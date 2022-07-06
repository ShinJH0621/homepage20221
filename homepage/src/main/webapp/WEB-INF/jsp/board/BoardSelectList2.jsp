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
<title>수업용 게시판</title>
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>
<link href="/asset/rcmdstyle.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        body {
            font-family: 'Noto Sans KR', sans-serif;
            padding-top: 150px;
        }
        header {
            width: 100%;
            height: 150px;
            top:0;
            position: fixed;
            background-color: white;

        }
        header h1 {
            text-align: center;
            padding-top: 50px;
            font-size: 50px;
            margin-bottom: 20px;
        }
        section {
            float: left;
            width: 100%;
        }

        footer {
            clear: both;
            height: 100px;
            text-align: center;
        }
        footer p {
            font-size: 40px;
        }
        nav ul li{
            display: inline-block;
            font-size: 25px;
            margin-right: 30px;
            text-align: center;
            margin-top: 10px;
           
        }

        nav {
            background: #fabe7b;
            width: 1200px;
            height: 50px;
            margin: 0 auto;
        }
        #nav_li {
            margin-left: 30px;
        }
        .cont > p {
        overflow: hidden;
        text-overflow: ellipsis;
        
        }
		.ar {
		width: 1015px;
		}
		.list_wrap .item .image .noimage {
		text-align: center;
		padding-top: 100px;
		width: 100%;
		}
		.list_wrap .item .image {
   
    	border-bottom: 1px solid #ccc;
   
		}
</style>
</head>
<body>
   <header>
   
        <h1>요리?조리!</h1>
        <nav>
            <ul>
                <a href="/board/main.do"><li id="nav_li">메인</li></a>
                <li>오늘뭐먹지?</li>
                
            </ul>
        </nav>
    </header>
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
					<img src="${thumbUrl}" alt="" width="100%;" height="200px"/>
				</c:when>
				<c:otherwise>
					<p class="noimage">이미지가 없습니다.</p>
				</c:otherwise>
				</c:choose>
                </div>
                <div class="cont">
                    <strong>${result.boardSj}</strong>
                    	
                 		<c:url var="viewUrl" value="/board/select.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}"/>
							<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
						</c:url>
                    <a href="${viewUrl}">바로가기</a>
                </div>
            </li>
           </c:forEach>
        </ul>
    </div>
    </section>
    <footer>

    
    
    
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
        
        
    </footer>

<script>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
</script>





</body>
</html>