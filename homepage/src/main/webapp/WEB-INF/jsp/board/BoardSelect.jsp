<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<title>요리?조리! 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet"/>
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<style>
.btn-cont {
	position: relative;
}
#rcmd {
	position: absolute;
	top: 42px;
	left: 0px;
}
#like {
	position: absolute;
	top: 42px;
	left: 100px;

}

</style>
</head>
<body>
<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
	<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
	<c:if test="${not empty searchVO.searchCondition}">
		<c:param name="searchCondition" value="${searchVO.searchCondition}"/>
	</c:if>
	<c:if test="${not empty searchVO.searchKeyword}">
		<c:param name="searchKeyword" value="${searchVO.searchKeyword}"/>
	</c:if>
</c:url>



<div class="container">
	
	<div id="contents">
		<div id="bbs_wrap">
			<div class="board_view">
				<dl class="tit_view">
					<dt>제목</dt>
					<dd><c:out value="${result.boardSj}"/></dd>
				</dl>
				<dl class="info_view2">
					<dt>작성자ID</dt>
					<dd><c:out value="${result.frstRegisterId}"/></dd>
					<dt>작성일</dt>
					<dd><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></dd>
					<dt>조회수</dt>
					<dd><c:out value="${result.inqireCo}"/></dd>
					<dt>추천수</dt>
					<dd id="divReloadLayer"><c:out value="${result.rcmdCo}"/></dd>
				</dl>
				<dl class="tit_view">
					<dt>첨부파일목록</dt>
					<dd>
						<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							<c:param name="param_atchFileId" value="${result.atchFileId}"/>
						</c:import>
					</dd>
				</dl>
				
				
				<div class="view_cont">
					<c:out value="${result.boardCn}" escapeXml="false"/>
				</div>
			</div>
			
			<div class="btn-cont ar">
				<form action="/board/recommend.do" method="post">
					<input type="hidden" name="boardId" value="${result.boardId}"/>
					<input type="button" value="추천" id="rcmd" class="btn btn-light"/>
				</form>
			

					<form action="/board/likeadd.do" method="post">
					<input type="hidden" name="boardLikeUser" value="${USER_INFO.id}"/>
					<input type="hidden" name="boardLikeCno" value="${result.boardId}"/>
					<input type="button" value="찜" id="like" class="btn btn-light"/>
					</form>
					
						
				
				<script type="text/javascript">
					$('#like').on('click', function() {
						
						$.ajax({
						  url: "/board/likeadd.do", //요청주소
						  method: "POST",	//요청방식
						  data: { boardLikeUser : $('[name="boardLikeUser"]').val(), boardLikeCno : $('[name="boardLikeCno"]').val()}, //파라미터
						  dataType: "text"	//요청의 결과(서버의 응답)으로 받을 데이터의 형식
						}).done(function( msg ) { //요청에 대한 응답을 성공적으로 받았을때 실행할 함수
						  //서버로부터 받은 응답이 인자로 전달된다
							alert("찜하셨습니다.");
						}).fail(function( jqXHR, textStatus ) { //요청이 실패한 경우 실행할 함수
						  alert( "Request failed: " + textStatus );
						});
						
					})
					
				</script>
				<c:choose>
					<c:when test="${not empty searchVO.boardId}">
						<c:url var="uptUrl" value="/board/boardRegist.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}"/>
						</c:url>
						<a href="${uptUrl}" class="btn">수정</a>
						<c:url var="delUrl" value="/board/delete.do${_BASE_PARAM}">
							<c:param name="boardId" value="${result.boardId}"/>
						</c:url>
						<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i> 삭제</a>
					</c:when>
					<c:otherwise>
						<a href="#none" id="btn-reg" class="btn spot">등록</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${param.recommend eq 'Y'}">
				<c:url var="listUrl" value="/board/recommendList.do${_BASE_PARAM}"/>
				</c:when>
				<c:when test="${param.like eq 'Y' }">
				<c:url var="listUrl" value="/board/likeList.do${_BASE_PARAM}"/>
				</c:when>
				<c:otherwise>
				<c:url var="listUrl" value="/board/selectList.do${_BASE_PARAM}"/>
				</c:otherwise>
				</c:choose>
				<a href="${listUrl}" class="btn">목록</a>
			</div>
	
		</div>
		
<%--  		<div>
			<form>
			<textarea rows="10" cols="30" name="replyCn" ></textarea>
			<input type="hidden" name="replyBoardId" value="${result.boardId}"/>
			<input type="hidden" name="replyEmplyrId" value="${USER_INFO.id}"/>
			<input type="button" value="등록" id="saveBtn"/>
		
		</form>
		
			
 <script type="text/javascript">
$('#saveBtn').on('click', function() {
	/* var menuId = $( "ul.nav" ).first().attr( "id" ); */
	var request = $.ajax({
	  url: "/reply/add.do", //요청주소
	  method: "POST",	//요청방식
	  data: { replyCn : $('[name="replyCn"]').val(), replyBoardId : $('[name="replyBoardId"]').val(), replyEmplyrId : $('[name="replyEmplyrId"]').val()}, //파라미터
	  dataType: "text"	//요청의 결과(서버의 응답)으로 받을 데이터의 형식
	});
	 
	request.done(function( msg ) { //요청에 대한 응답을 성공적으로 받았을때 실행할 함수
	  //서버로부터 받은 응답이 인자로 전달된다
		alert(msg);
	});
	 
	request.fail(function( jqXHR, textStatus ) { //요청이 실패한 경우 실행할 함수
	  alert( "Request failed: " + textStatus );
	});
	
})

</script>
	
		</div> --%>
	
	</div>
</div>
<script type="text/javascript">
$('#rcmd').on('click', function() {
	
	var request = $.ajax({
	  url: "/board/recommend.do", //요청주소
	  method: "POST",	//요청방식
	  data: { boardId : $('[name="boardId"]').val()}, //파라미터
	  dataType: "text",	//요청의 결과(서버의 응답)으로 받을 데이터의 형식
	  contentType: "application/x-www-form-urlencoded; charset=UTF-8"
			 

	});
	 
	request.done(function( msg ) { //요청에 대한 응답을 성공적으로 받았을때 실행할 함수
	  //서버로부터 받은 응답이 인자로 전달된다
	  	reloadDivArea(); //함수 실행
 
		function reloadDivArea() {
    	$('#divReloadLayer').load(location.href+' #divReloadLayer');
		}
		
	});
	 
	request.fail(function( jqXHR, textStatus ) { //요청이 실패한 경우 실행할 함수
	  alert( "Request failed: " + textStatus );
	});
	
})

</script>


<script>
<c:if test="${not empty message}">
alert("${message}");
</c:if>



$(document).ready(function(){
	//게시 글 삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});
</script>

</body>
</html>