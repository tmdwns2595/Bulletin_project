<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<style type="text/css">
	.container{
    padding: 0;
    margin: 0;
    width:1500px;
    height:912px;
    background-image: url('../images/울산대학교 표지.jpg');
    background-repeat:no-repeat;
    text-align: center;
	}
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
</style>
<title>JSP Mid-Term 게시판</title>
</head>
<body>
	<div class="header" style="background-color:black;">
		<div class="header-left">
			<ul>
		      <li><a class="active" href="main.jsp">JSP 게시판</a></li>
		      <li><a href="main.jsp">메인</a></li>
		      <li><a href="notice.jsp">게시판</a></li>
		      <li style="float:right;"><a href="login.jsp">로그인</a></li>
		      <li style="float:right;"><a href="join.jsp">회원가입</a></li>
		    </ul>
  		</div>
  	</div>
	<div class="container" style="text-align: center;">
		<center>
			<form method="post" action="joinAction.jsp" style="width:300px;height:300px;background-color:#333;">
				<h3 style="text-align:center;color:white;background-color:#4CAF50;height:50px;line-height:50px;">회원가입</h3>
				<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #333;margin-top:30px;">
					<tr>
						<td style="color:white;" style="width:70px;">성명</td>
						<td><input type="text" id="InpurName" placeholder="홍 길 동" name="userName" maxlength="20"></td>
					</tr>
					<tr>
						<td style="color:white;" style="width:70px;">아이디</td>
						<td><input type="text" id="InputId" placeholder="name@example.com" name="userID" maxlength="20"></td>
					</tr>
					<tr>
						<td style="color:white;" style="width:70px;">비밀번호</td>
						<td><input type="password" id="InputPassword" placeholder="비밀번호" name="userPassword" maxlength="20"></td>
					</tr>
					<tr>
						<td style="color:white;" style="width:70px;">거주지</td>
						<td><select id="InputResidence" placeholder="거주지" name="userResidence">
							  <option>서울</option>
							  <option>부산</option>
							  <option>대구</option>
							  <option>대전</option>
							  <option>인천</option>
							  <option>울산</option>
							  <option>광주</option>
							  <option>제주</option>
							  <option>경상도</option>
							  <option>전라도</option>
							  <option>강원도</option>
							  <option>충청도</option>
							  <option>경기도</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="color:white;" style="width:70px;">성별</td>
						<td><button class="active"><input type="radio" name="userGender" autocomplete="off" value="남자" checked>남</button>
							<button class="active"><input type="radio" name="userGender" autocomplete="off" value="여자">여</button>
						</td>
					</tr>
				</table>
				<input type="submit" value="회원가입" style="margin-top:30px;">
			</form>
		</center>
	</div>
</body>
</html>