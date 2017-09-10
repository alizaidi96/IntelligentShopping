<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%
		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();
		ResultSet rs = null;
		String uid=(String) session.getAttribute("uid");
		int total=0;						
			String sql="SELECT count(uid) as total FROM cart WHERE uid='"+uid+"'";
			rs=db.getResultSet(sql);
												
			if(rs.next())
			{
				String gettotal = rs.getString("total");
				total=Integer.parseInt(gettotal);
%>
               <button class="w3view-cart" type="submit" name="submit" value="">
					<i class="fa fa-cart-arrow-down" aria-hidden="true"><span style="font-size:20px;">-<%=total%></span></i>
				</button>
<%
			}
%>