<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>
<%@ page import="java.util.ArrayList" %>
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
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="header" style="background-color:black;">
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
	<div class="container">
		<center>
			<div class="row">
				<table style="width:1024px;text-align:center; border:1px solid #dddddd;"><!-- striped 속성은 게시판에서 홀수와 짝수번째  글들의 색깔을 다르게 줌으로써 구별이 편하게 해준다. -->
					<thead>
						<tr>
							<th style="background-color:#4CAF50; text-align:center; height:50px;">번호</th>
							<th style="background-color:#4CAF50; text-align:center; height:50px;">제목</th>
							<th style="background-color:#4CAF50; text-align:center; height:50px;">작성자</th>
							<th style="background-color:#4CAF50; text-align:center; height:50px;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							NoticeDAO bbsDAO = new NoticeDAO();
															ArrayList<Notice> list = bbsDAO.getList(pageNumber);
															for(int i=0; i < list.size(); i++){
						%>
						<tr style="background-color:#333;">
							<td style="color:white;"><%= list.get(i).getBbsID() %></td>
							<td style="color:white;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle() %></a></td>
							<td style="color:white;"><%= list.get(i).getUserID() %></td>
							<td style="color:white;"><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<%
					if(pageNumber != 1){
				%>
					<button style="background-color:#333;color:white;float:left;"><a href="notice.jsp?pageNumber=<%=pageNumber - 1 %>">이전</a></button>
				<%
					}if(bbsDAO.nextPage(pageNumber + 1)){
				%>
					<button style="background-color:#333;color:white;float:left;"><a href="notice.jsp?pageNumber=<%=pageNumber + 1 %>">다음</a></button>
				<%
					}
				%>
			</div>
			<button style="width:70px;height:30px;background-color:#333;float:right;margin-right:250px; margin-top:20px;"><a href="write.jsp" class="btn btn-primary float-right">글쓰기</a></button>
		</center>
	</div>
</body>
</html>