<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<jsp:include page="header.jsp"></jsp:include>
<link href="checkjs/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="checkjs/jquery.min.js"></script>
<!-- //js -->
<!-- //header -->
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Checkout Page</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- checkout -->
	<div class="checkout" id="checkdata">
		<div class="container">
			<h3 class="animated wow slideInLeft" data-wow-delay=".5s">Your shopping cart contains <span>Products Details</span></h3>
			<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>SL No.</th>	
							<th>Product</th>
							<th>Quantity</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Remove</th>
						</tr>
					</thead>
					<tr class="rem1">
<%
				DatabaseConnection db = new DatabaseConnection();
				db.dbconnection();
				ResultSet rs = null;
				String uid=(String) session.getAttribute("uid");
				int total=0;
				String query="Select * from cart Where uid='"+uid+"'";
				ResultSet res=db.getResultSet(query);
											
				if(res.next())
				{		
					String sql="Select * from cart Where uid='"+uid+"'";
					rs=db.getResultSet(sql);
												
					while(rs.next())
					{
						String id = rs.getString("id");
						String pid = rs.getString("pid");
						String sql1="Select * from products Where id='"+pid+"'";
						ResultSet rs1=db.getResultSet(sql1);
													
						if(rs1.next())
						{
							String pname = rs1.getString("pname");
							String image1 = rs1.getString("image1");
							String image2 = rs1.getString("image2");
							String image3 = rs1.getString("image3");
							String pprice = rs1.getString("pprice");
							int getprice=Integer.parseInt(pprice);
							total=total+getprice;
							String pstock = rs1.getString("pstock");
							int stock = Integer.parseInt(pstock);
							session.setAttribute("total", total);
%>
						<td class="invert"><%=id%></td>
						<td class="invert-image" style="width:250px;"><a href="single.html"><img src="../admin/product/<%=image1%>" alt=" " class="img-responsive" /></a></td>
						<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value"><span>1</span></div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>
						<td class="invert"><%=pname%></td>
						<td class="invert"><%=pprice%></td>
						<td class="invert">
							<div class="rem">
								<a onclick="removecart(<%=id%>)"><div class="close1"></div></a>
							</div>
						</td>
					</tr>
<%
						}
					}
				}
				else
				{
%>
					<tr><td colspan="6"><b style="font-size:20px;">Your Cart is Empty</b></td></tr>
<%
				}
%>
								<!--quantity-->
									<script>
									$('.value-plus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
										divUpd.text(newVal);
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
										if(newVal>=1) divUpd.text(newVal);
									});
									</script>
								<!--quantity-->
				</table>
			</div>
			<div class="checkout-left">	
				<div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
					<h4>Your basket total</h4>
					<ul>
						<%
							if(total >= 1000)
							{
								total=total+0;
							}
							else if(total > 0)
							{
						%>
							<li>Total Service Charges <i>-</i> <span>50.00 Rs.</span></li>
						<%
								total=total+0;
							}
						    String stringtotal=String.valueOf(total);
							session.setAttribute("total", stringtotal);
						%>
						
						<li><b>Total Amount for Pay<i>-</i> <span><%=total%> Rs.</span></b></li>
					</ul>
				</div>
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					<a href="products.jsp?cat=1&subcat=1"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
				</div>
				<div class="checkout-right-basket1 animated wow slideInRight" data-wow-delay=".5s">
					<a href="address.jsp">Checkout<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //checkout -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>