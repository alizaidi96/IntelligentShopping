<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%
		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();
		ResultSet rs = null;
		String pid=request.getParameter("pid");
		String uid=(String) session.getAttribute("uid");
		String qty="1";
		String amt="";
		String pname="";
		String total="";						
			String sql="SELECT * FROM products WHERE id='"+pid+"'";
			rs=db.getResultSet(sql);
												
			if(rs.next())
			{
				pname = rs.getString("pname");
				amt = rs.getString("pprice");
			}
			
			String sql1="INSERT INTO cart(pid,uid,qty,amt) VALUES('"+pid+"','"+uid+"','"+qty+"','"+amt+"')";
			db.getUpdate(sql1);
%>
	<div>Successfully Added</div>
	<div><%=pname%></div>
	<div>Qty:1</div><div>Cost:<%=amt%></div>
