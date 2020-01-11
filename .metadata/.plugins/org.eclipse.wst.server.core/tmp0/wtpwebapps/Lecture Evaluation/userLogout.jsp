<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	/* 모든 세션정보 파기 */
	session.invalidate();
%>

<script>
	location.href = 'index.jsp';
</script>