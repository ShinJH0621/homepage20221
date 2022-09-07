<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>데이터 가져오기</title>
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
#crudSj {
	width : 480px;
	margin-left : 10px;
}
#userNm {
	width : 480px;
	margin-left : 10px;
}
#crudCn {
	width : 480px;
	margin-left : 10px;
	margin-top : 5px;
}

</style>
</head>
<body>

<c:choose>
	<c:when test="${not empty searchVO.crudId}">
		<c:set var="actionUrl" value="/crud2/update.do"/>
		</c:when>
		<c:otherwise>
			<c:set var="actionUrl" value="/crud2/insert.do"/>
		</c:otherwise>		
</c:choose>


<form action="${actionUrl}" method="post" name="crud2VO">
	<input type="hidden" name="crudId" value="${result.crudId}"/>
	<table>
		<tbody>
			<tr>
				<td class="left"><label for="crudSj">제목 </label></td>
				<td>
	<input type="text" id="crudSj" name="crudSj" value="${result.crudSj}"/></td>
			</tr>
			<tr>
				<td class="left"><label for="userNm">작성자</label></td>
				<td>
	<input type="text" id="userNm" name="userNm" value="${result.userNm}"/></td>
			</tr>
			<tr>
				<td class="left"><label for="crudCn">내용</label></td>
				<td id="right">	
	<textarea id="crudCn" name="crudCn" rows="30" cols="48" >${result.crudCn}</textarea></td>
			</tr>
		
		</tbody>
	</table>

	<br>
	



	
	<c:choose>
		<c:when test="${not empty searchVO.crudId}">
			<button type="submit">수정</button>
		</c:when>	
		<c:otherwise>
			<button type="submit">등록</button>
		</c:otherwise>
	</c:choose>
	<a href="/crud2/selectList.do"><input type="button" value="취소"/></a>	
	
</form>



</body>
</html>