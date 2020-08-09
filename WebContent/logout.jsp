
<%@page pageEncoding="UTF-8"%>

<body>
	<%
		//request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		request.logout();
		response.sendRedirect("Accueil");
		
	%>
	

</body>

</html>