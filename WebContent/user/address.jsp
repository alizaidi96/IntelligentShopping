<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
<!-- //header -->> 	
	<!-- login-page -->
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">Shipping Address details</h3>  
			<div class="login-body">
				<form action="../address" method="post">
<%
				DatabaseConnection db = new DatabaseConnection();
				db.dbconnection();
				ResultSet rs = null;
				String uid=(String) session.getAttribute("uid");

				String query="Select * from user Where id='"+uid+"'";
				rs=db.getResultSet(query);
											
				if(rs.next())
				{							
					String name = rs.getString("name");
					String address = rs.getString("address");
					String email = rs.getString("email");
					String mobile = rs.getString("mobile");
					
					String query1="Select * from deliverdata Where uid='"+uid+"'";
					rs=db.getResultSet(query1);
					String pin ="";
					if(rs.next())
					{	
						email = rs.getString("email");
						address = rs.getString("address");
						pin = rs.getString("pin");
					}
%>
					<input type="text" class="user" name="name" value="<%=name%>" placeholder="Enter your Name" required>
					<input type="text" class="user" name="mobile" value="<%=mobile%>" id="mobile" placeholder="Enter your mobile" required>
					<input type="email" class="user" name="email" value="<%=email%>" id="email" placeholder="Enter your email" required>
					<textarea rows="5" cols="68" name="address" placeholder="Enter your address."><%=address%></textarea>
					<a id="item2" style="cursor:pointer;float:left">If you want delivery on new address you can change this address</a>
					<input type="text" class="user" name="pincode" value="<%=pin%>" placeholder="Enter your postal pin code." required>
					<input type="submit" value="Proceed to payment">
<%
				}
%>
				</form>
			</div>
		</div>
	</div>
	<!-- //login-page --> 
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>