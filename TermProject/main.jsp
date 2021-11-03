<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<style type="text/css">
	ul {
    list-style-type: none; 
    margin: 0;
    padding: 0;
    background-color: #333;
	}
	ul:after{
    content:'';
    display: block;
    clear:both;
	}	
	li {
	    float: left;
	}
	li a {
	    display: block;
	    color: white;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	li a:hover:not(.active) {
	    background-color: #111;
	}
	.active {
	    background-color: #4CAF50;
	}
	.main{
    padding: 0;
    margin: 0;
    width:1500px;
    height:912px;
    background-image: url('../images/울산대학교 표지.jpg');
    background-repeat:no-repeat;
    text-align: center;
	}
	.logo{
	    margin-top:20px;
	}
	.sub_main{
	    position:relative;
	    width:750px;
	    height:670px;
	    background-color: rgba(255,255,255,0.7);
	    border-radius: 10px;
	    margin:0 auto;
	    margin-top:50px;
	}
	.copyright{
	    color:darkgrey;
	}
	.sub_left{
	    position :absolute;
	    left:0;
	    width:375px;
	    height:670px;
	    border-right:1px solid rgba(255,255,255,0.7);
	    line-height: 10px;
	}
	.sub_right{
	    position :absolute;
	    right:0;
	    width:375px;
	    height:670px;
	}
	.sub_left_title{
	    color: #4CAF50;
	    font-weight: 1000;
	    font-size:40px;
	    letter-spacing: -0.1em;
	}
	.sub_category{
	    color:black;
	    font-weight:700;
	    font-size:25px;
	    text-align: left;
	    margin-left: 20px;
	    margin-top:1px;
	}
	.sub_text{
	    color:dark;
	    text-align: left;
	    font-size:20px;
	    margin-left :40px;
	}
	.sub_text1{
	    color:dark;
	    text-align: left;
	    font-size:20px;
	    margin-left :10px;
	}
	.sub_text2{
	    color:dark;
	    text-align: left;
	    font-size:18px;
	    margin-left :10px;
	}
	.sub_corona{
	    color:blue;
	    font-weight:700;
	    font-size:25px;
	    text-align: left;
	    word-break:break-all;
	    line-height: 25px;
	}
	.sub_chongjang{
	    color:dark;
	    text-align: center;
	    font-size:20px;
	}
	.sub_right_button{
	    margin:0 auto;
	    color:white;
	    border : 1px solid #333;
	    background-color: #333;
	    text-align: center;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    width:300px;
	    transition: 0.2s;
	    border-radius: 10px;
	    margin-top:10px;
	    margin-bottom:50px;
	}
</style>
<title>JSP Mid-Term 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<div class="header">
		<div class="header-left">
			<ul>
		      <li><a class="active" href="main.jsp">JSP 홈페이지</a></li>
		      <li><a href="main.jsp">메인</a></li>
		      <li><a href="notice.jsp">게시판</a></li>
  		<%
  			if(userID == null){
  		%>
		      <li style="float:right;"><a href="login.jsp">로그인</a></li>
		      <li style="float:right;"><a href="join.jsp">회원가입</a></li>
		    </ul>
  		</div>
  		<%
  			}else{
  		%>
		      <li style="float:right;"><a onclick="return confirm('정말로 로그아웃 하시겠습니까?')" href="logoutAction.jsp">로그아웃</a></li>
		    </ul>
  		</div>
  		<%
  			}
  		%>
  	</div>
  	<div class="main">
  		<img class="logo" src="../images/로고.jpg" alt = "University Of Ulsan">
        <div class = "sub_main">
            <div class="sub_left">
                <div>
                    <p class="sub_left_title">울산대학교</p>
                    <p class="sub_left_title">공지사항 안내</p>
                </div><br/>
                <div>
                    <a href="popup1.html" onclick="window.open(this.href, '대면수업 취소' , 'width=1000px, height=500px'); return false;" target="_blank"><p class="sub_category">·1학기 대면수업 전면 취소</p></a>
                    <p class="sub_text">- 소수이론 강좌 대면수업 취소</p>
                </div><br/>
                <div>
                     <a href="popup2.html" onclick="window.open(this.href, '대면수업 취소' , 'width=1000px, height=500px'); return false;" target="_blank"><p class="sub_category">·2학기 국가장학금 신청기간</p></a>
                    <p class="sub_text">- 일자 : 05.20(수) ~ 06.18(수) 18시</p>
                </div><br/>
                <div>
                    <p class="sub_category">·여름 계절학기 수강신청</p>
                    <p class="sub_text">- 일자 : 05.18(월) ~ 05.20(수)</p>
                </div><br/>
                <div>
                    <p class="sub_category">·여름 계절학기 수강정정</p>
                    <p class="sub_text">- 일자 : 06.01(월) ~ 06.02(화)</p>
                </div><br/>
                <div>
                    <p class="sub_category">·1학기 기말고사</p>
                    <p class="sub_text">- 일자 : 06.22(월) ~ 06.26(금)</p>
                </div><br/>
                <div>
                    <p class="sub_category">·문의사항</p>
                    <p class="sub_text">- 개발자 : 이승준(010-7516-2595)</p>
                </div><br/>
            </div>
            <div class = "sub_right">
                <iframe width="375" height="210" src="https://www.youtube.com/embed/n0vEt6fEmxA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                <a href = "https://www.ulsan.ac.kr/main/" target="_blank"><div class="sub_right_button">울산대학교 홈페이지</div></a>
                <a href = "https://uwins.ulsan.ac.kr/Default.aspx" target="_blank"><div class="sub_right_button">울산대학교 UWINS</div></a>
                <a href = "http://dormitory.ulsan.ac.kr/main.do" target="_blank"><div class="sub_right_button">울산대학교 기숙사</div></a>
                <a href = "https://ulms.ulsan.ac.kr/login.php" target="_blank"><div class="sub_right_button">울산대학교 ULMS</div></a>
            </div>
        </div>
        <p class="copyright">Copyright ⓒ University of Ulsan. All Rights Reserved.</p>
  	</div>
</body>
</html>