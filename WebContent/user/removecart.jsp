<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%
		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();

		String id=request.getParameter("id");	
		System.out.println(id);
		String sql="Delete From cart WHERE id='"+id+"'";
		int i=db.getUpdate(sql);

%>
