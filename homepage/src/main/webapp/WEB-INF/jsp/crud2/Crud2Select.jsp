<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
table { 
	border : 1px solid #000;
	width : 600px;
	border-collapse : collapse;
	}
td {
	border : 1px solid #000;
	height : 25px;
}
.left {
	text-align : center;
	width : 80px;
	background : lightgray;
}
#right {
	height : 400px;
}
.content {
	margin-left : 2px;
	text-indent : 2px;
}
</style>

</head>
<body>

	<table>
		<tbody>
			<tr>
				<td class="left">제목</td>
				<td class="content">${result.crudSj}</td>
			</tr>
			<tr>
				<td class="left">작성자</td>
				<td class="content">${result.userNm}</td>
			</tr>
			<tr>
				<td class="left">작성일</td>
				<td class="content"><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td id="right" class="content">${result.crudCn}</td>
			</tr>
		
		</tbody>
	</table>
	
	
	
	<div class="box-btn">
	<c:url var="uptUrl" value="/crud2/crud2Regist.do">
		<c:param name="crudId" value="${result.crudId}"/>
		</c:url>
		<a href="${uptUrl}">수정</a>
		
	<c:url var="delUrl" value="/crud2/delete.do">
		<c:param name="crudId" value="${result.crudId}"/>
		</c:url>
		<a href="${delUrl}" class="btn-del">삭제</a>
		
		<a href="/crud2/selectList.do">목록</a>	
		
	</div>
	
	<script>
	$(document).ready(function(){
		$(".btn-del").click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
		});
	});
	</script>
</body>
</html>