<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<option>Select sub-category</option>
<%
DatabaseConnection db = new DatabaseConnection();
db.dbconnection();

String id=request.getParameter("cat");

	String sql1="Select * from subcat Where cid='"+id+"'";
	ResultSet rs1=db.getResultSet(sql1);
		while(rs1.next())
		{
			String sid = rs1.getString("id");
			String subcname = rs1.getString("subname");
%>
			<option value="<%=sid%>"><%=subcname%></option>
<%
		}
%>