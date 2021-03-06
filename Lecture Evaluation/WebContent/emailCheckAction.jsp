<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "util.SHA256" %>
<%@ page import = "java.io.PrintStream" %>

<%
	/* 사용자로 부터 입력받은 정보는 UTF-8 인코딩으로 처리 */
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if (request.getParameter("code") != null) {
		code = (String) request.getParameter("code");
	}
	
	String userID = null;

	UserDAO userDAO = new UserDAO();

	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");		
	}
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.print("location.href = userLogin.jsp;");		
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDAO.getUserEmail(userID);
	boolean isRight = new SHA256().getSHA256(userEmail).equals(code) ? true : false;
 	if (isRight) {
 		userDAO.setUserEmailChecked(userID);
 		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.print("location.href = 'index.jsp';");		
		script.println("</script>");
		script.close();
		return;
 	} else {
 		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 페이지입니다.');");
		script.print("location.href = 'index.jsp';");		
		script.println("</script>");
		script.close();
		return;
 	}
 %>