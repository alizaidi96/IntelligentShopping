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
			<h3 class="animated wow slideInLeft" data-wow-delay=".5s">Your Products <span>purchasing history</span></h3>
			<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>SL No.</th>	
							<th>Product</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Action</th>
						</tr>
					</thead>
					<tr class="rem1">
<%
				DatabaseConnection db = new DatabaseConnection();
				db.dbconnection();
				ResultSet rs = null;
				int k=1;
				String uid=(String) session.getAttribute("uid");
				
				String query="Select * from transaction Where uid='"+uid+"'";
				ResultSet res=db.getResultSet(query);
				res.last();
			if(res.getRow() > 0)
			{
				res.beforeFirst();
				while(res.next())
				{		
					String productid = res.getString("totalpid");
					String[] splitid = productid.split(",");
					
					for(int i=0; i < splitid.length; i++)
					{
						String sql="Select * from products Where id='"+splitid[i]+"'";
						rs=db.getResultSet(sql);
													
						if(rs.next())
						{
							String pname = rs.getString("pname");
							String image1 = rs.getString("image1");
							String pprice = rs.getString("pprice");
%>
						<td class="invert"><%=k%></td>
						<td class="invert-image" style="width:250px;"><a href="single.html"><img src="../admin/product/<%=image1%>" alt=" " class="img-responsive" /></a></td>
						<td class="invert"><%=pname%></td>
						<td class="invert"><%=pprice%></td>
						<td class="invert">
							<div class="rem">
								<form action="#" method="post">
									<button type="button" onclick="addCart(<%=productid%>)" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>
						</td>
					</tr>
<%
							k++;
						}
					}
				}
			}
			else
			{
%>
					<tr><td colspan="6"><b style="font-size:20px;">Your Order History is Empty</b></td></tr>
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
		</div>
	</div>
<!-- //checkout -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>