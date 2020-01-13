<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 속성을 정의하는 라이브러리 패키지 -->
<%@ page import = "java.util.Properties" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "evaluation.EvaluationDAO" %>
<%@ page import = "likey.*" %>
<%@ page import="java.io.*"%>

<%!
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
%>

<%
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.write("<script>");
		script.write("alert('로그인을 해주세요.')");
		script.write("location.href = 'userLogin.jsp'");
		script.write("</script>");
	}
	
	request.setCharacterEncoding("UTF-8");
	String evaluationID = null;
	if (request.getParameter("evaluationID") != null) {
		evaluationID = request.getParameter("evaluationID");
	}
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	int result = likeyDAO.like(userID, evaluationID, getClientIP(request));
	if (result == 1) {
		result = evaluationDAO.like(evaluationID);
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.write("<script>");
			script.write("alert('추천이 완료되었습니다.');");
			script.write("location.href = 'index.jsp';");
			script.write("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.write("<script>");
			script.write("alert('데이터베이스 오류가 발생했습니다.');");
			script.write("history.back();");
			script.write("</script>");
			script.close();
			return;
		}
	} else {
		PrintWriter script = response.getWriter();
		script.write("<script>");
		script.write("alert('이미 추천을 누른 글입니다.');");
		script.write("history.back();");
		script.write("</script>");
		script.close();
		return;
	}
%>