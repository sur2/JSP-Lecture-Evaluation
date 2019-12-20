<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <!-- java package import -->
<%@ page import="user.UserDTO"%>    
<%@ page import="user.UserDAO"%>
<!-- script 구문을 출력하기 위함 -->    
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
	}
	PrintWriter debug = response.getWriter();
	if(userID.equals("") || userPassword.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('항목을 전부 입력해 주십시오.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
 	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPassword);
	
	if(result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	} 
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>



</body>
</html>

