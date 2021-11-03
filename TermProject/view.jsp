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
	%>
	<div class="header" style="background-color:black;">
		<div class="header-left">
			<ul>
		      <li><a class="active" href="main.jsp">JSP 게시판</a></li>
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
  	<div class="container" style="text-align: center;">
		<center>
				<h3 style="text-align:center;color:white;background-color:#4CAF50;height:50px;line-height:50px;">게시판 글보기 양식</h3>
				<table border="1" cellspacing="0" cellpadding="0" style="text-align:center;width:500px;">
					<tr>
						<td style="background-color:#333;color:white;">글 제목</td>
						<td style="background-color:white;"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td style="background-color:#333;color:white;">작성자</td>
						<td style="background-color:white;"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td style="background-color:#333;color:white;">작성일자</td>
						<td style="background-color:white;"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<tr>
						<td style="background-color:#333;color:white;">내용</td>
						<td style="background-color:white;height:200px;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</table>
				<button style="background-color:#333;color:white;float:right;margin-right:500px;"><a href="notice.jsp">목록</a></button>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<button style="background-color:#333;color:white;float:right;"><a href="update.jsp?bbsID=<%= bbsID %>">수정</a></button>
					<button onclick = "return confirm('정말 삭제하시겠습니까?')" style="background-color:#333;color:white;float:right;"><a href="deleteAction.jsp?bbsID=<%= bbsID %>">삭제</a></button>
				<%
					}
				%>
		</center>
	</div>
</body>
</html>