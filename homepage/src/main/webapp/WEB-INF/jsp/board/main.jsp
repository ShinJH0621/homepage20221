<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }        
    .container {
        width: 1920px;
        height: 900px;
        margin: 0 auto;
        display: inline-block;
        overflow: hidden;
        box-sizing: border-box;
    }    
    #left {
        float: left;
        width: 33%;
        height: 100%;
        background-image: url("/asset/left.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
    #mid {
        float: left;
        width: 33%;
        height: 100%;
        background: rgb(230, 230, 230);
        background-image: url("/asset/icon1.png");
        background-size: contain;
        background-position: bottom ;
        background-repeat: no-repeat;
    }
    #right {
        float: left;
        width: 33%;
        height: 100%;
        background-image: url("/asset/right.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
    h1 {
        text-align: center;
        margin-top: 40%;
        font-weight: bold;
        font-size: 66px;
    }
    #intro {
        text-align: center;
        margin-top: 300px;
        font-size: 35px;
    }
    #board {
        text-align: center;
        margin-top: 10px;
        font-size: 35px;
    }
    a {
        text-decoration: none;
    }
    #panel a:hover{
        color: red;
    }
    a:visited {
        color: black;
    }
    a:link {
        color: black;
    }
    #panel {
        padding: 10px;
        display: none;
        background-color: #ccc;
        height: 120px;
        width: 100px; 
            }
    #menu {
        float: right;
        margin-top: 30px;
        margin-right: 30px;
    }
    #btn-menu {
        width: 40px;
        height: 40px;
    }
</style>
 <script  src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
         $(document).ready(function() {
             // timer변수를 만들어 약간의 딜레이를 줄건데 딜레이가 없으면 마우스가 지나갈 때마다
             // 메뉴바가 나오고 사라지고 해서 눈에 거슬림 
             var timer;
             $("#slide").mouseenter(function(){      //#slide에 mouseenter이벤트를 만듬
                  timer = setTimeout(function() {       //딜레이를 설정하면서 (0.1초) 해당 시간 후에 아래와 같은 동작을 함 
                     $("#panel").not(':animated')        //에니메이션이 Queue에 쌓이는 것을 방지하기 위해서  not(':animated')설정을 해준다.
                     .css({color: "black"})                //css수정
                     .slideDown(500)                     //display가 none에서 block으로 바뀌면서 슬라이드 효과가 생기면서 보여지게 됨
                  }, 100);           
             })
             $("#menu").mouseleave(function(){       //#menu에 mouseleave이벤트를 만듬
                  clearTimeout(timer);               //위에서 딜레이를 설정하고 그 시간 안에 mouseleave 이벤트가 일어나면 해당 timer변수가 사라져서
                  $("#panel")                        //mouseenter이벤트 시의 동작이 일어나지 않음
                  .css({color: "black"})              //css수정
                  .slideUp(500)                      //display가 none에서 block으로 바뀌면서 슬라이드 효과가 생기면서 보여지게 됨
             });
         });

         
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	 <div class="container">
        <div id="left">

        </div>
        <div id="mid">
            <div id="menu">
                <div id="slide">
                    <img src="/asset/menuicon.png" id="btn-menu">
                </div>
                <div id="panel">
                    <div id="ex1" class="modal">
							<form name="loginForm" method="post" action="/uat/uia/actionLogin.do">
                            <div class="user_login_ultop">
                                <ul>
                                    <li>
                                        <label for="id"><img alt="login" src="<c:url value='/'/>images/login/img_idtext.gif" /></label>
                                        <input type="text" class="input_style" title="아이디를 입력하세요." id="id" name="id" maxlength="10"/>
                                    </li>
                                    <li>
                                        <label for="password"><img alt="password" src="<c:url value='/'/>images/login/img_pwtext.gif" /></label>
                                        <input type="password" class="input_style" maxlength="25" title="비밀번호를 입력하세요." id="password" name="password" 
                                               onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
                                    </li>
                                    <li>
                                        <input type="checkbox" name="checkId" onclick="javascript:saveid(this.form);" id="checkId" /><label for="checkId">ID저장</label>
                                    </li>
                                </ul>
                                <input type="image" alt="로그인 버튼" class="btn_style" onclick="javascript:actionLogin()" src="<c:url value='/'/>images/login/btn_login.gif"  />
                            </div>
                            <input type="hidden" name="message" value="${message}" />
				            <input type="hidden" name="userSe"  value="USR"/>
				            <!-- <input type="hidden" name="j_username" />-->
				            <input type="submit" value="로그인">
                            </form>
                        <a href="#" rel="modal:close">닫기</a>
                    </div>
                    <a href="#ex1" rel="modal:open"><p>로그인</p></a> 
                    <a href="##"><p>회원가입</p></a>
                    <a href="###"><p>contact</p></a>
                </div>
            </div>
            <h1>요리? 조리!</h1>
            
        </div>
        <div id="right">
        </div>
    </div>

</body>
</html>