<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
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
	a:link {text-decoration: none; color: white;}
	a:visited {text-decoration: none; color: white;}
	a:active {text-decoration: none; color: white;}
	a:hover {text-decoration: underline; color: blue;}
</style>
<title>JSP Mid-Term 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요!!')");
			script.println("location.href = 'login.jsp' ");
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글!!')");
			script.println("location.href = 'notice.jsp' ");
			script.println("</script>");
		}
		Notice bbs = new NoticeDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다!!')");
			script.println("location.href = 'notice.jsp' ");
			script.println("</script>");
		}
	%>
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
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>" style="margin-left:auto; margin-right:auto;width:500px;">
				<h3 style="text-align:center;color:white;background-color:#4CAF50;height:50px;line-height:50px;">게시판 글 수정</h3>
				<table border="1" cellspacing="0" cellpadding="0" style="text-align:center;width:500px;border:1px solid #333;">
					<tr>
						<td style="background-color:#333;color:white;">글 제목</td>
						<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" style="width:100%;"></td>
					</tr>
					<tr>
						<td style="background-color:#333;color:white;">글 내용</td>
						<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;width:100%;"><%= bbs.getBbsContent() %></textarea></td>
					</tr>
				</table>
				<input type="submit" value="수정" style="width:70px;height:30px;background-color:#333;color:white;float:right;">
			</form>
		</center>
	</div>
</body>
</html>