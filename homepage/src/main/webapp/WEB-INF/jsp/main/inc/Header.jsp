<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="menu">
            <nav class="gnb">
                <ul>
                    <a href="/board/main.do"><li>메인</li></a>
                    <a href="/board/selectList.do"><li>게시판</li></a>
                    <a href="/board/recommendList.do"><li>오늘뭐먹지?</li></a>
                    <c:if test="${not empty USER_INFO.id}">
		            <a href="/board/likeList.do"><li>찜</li></a>
		            </c:if>
                    <li>
            		<c:choose>
						<c:when test="${empty USER_INFO.id}">
						<a href="/login/actionLogin.do" class="login">로그인</a>
						</c:when>
						<c:otherwise>
						<a href="/login/actionLogout.do"><c:out value="${USER_INFO.name}"/>님 로그아웃</a>
						</c:otherwise>
					</c:choose>
            		</li>
                </ul>
            </nav>

</div>

<div class="dim"></div>
<div class="layer-popup layer-login" style="display:none;">
	<header class="layer-header">
		<span class="logo">
			<span class="img-logo">한국폴리텍대학 대전캠퍼스 스마트소프트웨어학과</span>
		</span>
		<button type="button" class="layer-close"><span>팝업 닫기</span></button>
	</header>
	<div class="layer-body">
		<form action="/login/actionLogin.do" id="frmLogin" name="frmLogin" method="post" onsubmit="return vali()">
		<input type="hidden" name="userSe" value="USR"/>
		<fieldset>
			<legend>로그인을 위한 아이디/비밀번호 입력</legend>
			<div class="ipt-row">
				<input type="text" id="loginId" name="id" placeholder="아이디" required="required">
			</div>
			<div class="ipt-row">
				<input type="password" id="loginPw" name="password" placeholder="비밀번호" required="required">
			</div>
			<button type="submit" class="btn-login"><span>로그인</span></button>
		</fieldset>
		</form>
	</div>
</div>
<script>
$(document).ready(function(){
	//로그인
	$(".login").click(function(){
		$(".dim, .layer-login").fadeIn();
		return false;
	});
	//레이어 닫기
	$(".layer-close").click(function(){
		$(".dim, .layer-login").fadeOut();
		return false;
	});
	
});

function vali(){
	if(!$("#loginId").val()){
		alert("아이디을 입력해주세요.");
		$("loginId").focus();
		return false;
	}
	
	if(!$("#loginPw").val()){
		alert("비밀번호를 입력해주세요.");
		$("#loginPw").focus();
		return false;
	}
}
<c:if test="${not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

</script>