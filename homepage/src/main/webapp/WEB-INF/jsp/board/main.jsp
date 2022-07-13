<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<title>요리?조리!</title>
<link href="/asset/front/css/style.css" rel="stylesheet" />
<link href="/asset/style.css?afte" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }        
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    
    function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > x.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    x[index-1].style.display = "block";  //해당 인덱스는 block으로
    setTimeout(slideShow, 4000);   //함수를 4초마다 호출
 
}
</script>
</head>
<body>
<header id="header">
    <h1 class="logo1"><img src="/asset/logo5.png" alt="SMARTSOFEWARE" width="70px" height="70px"></h1>
    <h1 class="webname">  요리?조리!</h1>
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
</header>
<section class="slider">
 		<img class="slide1" src="/asset/newIndex4.png" >
        <img class="slide1" src="/asset/newIndex5.png">
        <img class="slide1" src="/asset/newIndex6.png">
</section>

<footer>
    <p>Copyright(c) 2022 Smartsoftware. All rights reserved</p>
</footer>
<div class="dim"></div>
<!-- 로그인 -->
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
</body>
</html>