<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>데이터 가져오기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
table { 
	border : 1px solid #ccc;
	width : 600px;
	}
th {
	border : 1px solid #ccc;
	height : 40px;
	border-bottom : 2px solid #000;
	}
td {
	border : 1px solid #ccc;
	height : 25px;
}
.del {
	text-align : center;
}
.date {
	text-align : center;
}
a {
	text-decoration : none;
}
</style>
</head>
<body>
게시물 총 수 : <c:out value="${paginationInfo.totalRecordCount}"/>건
<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>관리</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}"> 
			<tr>
				<td><c:out value="${result.crudId}"/></td>
				<td>
				<c:url var="viewUrl" value="/tempcrud/select.do">
					<c:param name="crudId" value="${result.crudId}"/>
				</c:url>
				<a href="${viewUrl}"><c:out value="${result.crudSj}"/></a>
				</td>
				<td><c:out value="${result.userNm}"/></td>
				<td class="date"><c:out value="${result.date}"/></td>
				
				<td class="del">
				<c:url var="delUrl" value="/tempcrud/delete.do">
		<c:param name="crudId" value="${result.crudId}"/>
		</c:url>
		<a href="${delUrl}" class="btn-del">삭제</a>
				</td>
					
			</tr>
		</c:forEach>
			<script>
	$(document).ready(function(){
		$(".btn-del").click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
		});
	});
	</script>
	</tbody>
</table>

<div id="paging_div">
	<ul class="paging_align">
		<c:url var="pageUrl" value="/tempcrud/selectList.do?"/>
		<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
	</ul>
</div>

<a href="/tempcrud/tempRegist.do">등록하기</a>
</body>
</html>