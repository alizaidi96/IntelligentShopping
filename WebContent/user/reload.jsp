<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<!-- recommendations -->
			<div class="recommend">
				<h3 class="w3ls-title">Our Recommendations Using Reviews </h3> 
				<script>
					$(document).ready(function() { 
						$("#owl-demo5").owlCarousel({
					 
						  autoPlay: 3000, //Set AutoPlay to 3 seconds
					 
						  items :4,
						  itemsDesktop : [640,5],
						  itemsDesktopSmall : [414,4],
						  navigation : true
					 
						});
						
					}); 
				</script>
				<div id="owl-demo5" class="owl-carousel">
		<%
		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();
			String sql1="Select * from commentsrate ORDER BY positiveper ASC";
			ResultSet rs1=db.getResultSet(sql1);
										
			while(rs1.next())
			{
				String pid1 = rs1.getString("pid");
				String positiveper = rs1.getString("positiveper");
				
				String sql2="Select * from products Where id='"+pid1+"'";
				ResultSet rs2=db.getResultSet(sql2);		
				if(rs2.next())
				{
					String pname2 = rs2.getString("pname");
					String str2 = pname2.substring(0, 10)+"...";
					String image12 = rs2.getString("image1");
					String pprice2 = rs2.getString("pprice");
		 %>
					<div class="item" id="reviewdiv">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>Sale</h6></div>
							<a href="products1.jsp"><img src="../admin/product/<%=image12%>" alt="img" style="height:300px;"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.jsp"><%=str2%></a></h4>
								<p>Positive Reviews Percentage:-<%=positiveper%></p>
								<h5><%=pprice2%></h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
									<input type="hidden" name="amount" value="20.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div>
		<%
				}
			}
		%>
				</div>    
			</div>
			<!-- //Reviews recommendations -->
					
		<div class="clearfix"> </div>
			<!-- recommendations -->
			<div class="recommend">
				<h3 class="w3ls-title">Our Recommendations Using Twits Analysis </h3> 
				<script>
					$(document).ready(function() { 
						$("#owl-demo6").owlCarousel({
					 
						  autoPlay: 3000, //Set AutoPlay to 3 seconds
					 
						  items :4,
						  itemsDesktop : [640,5],
						  itemsDesktopSmall : [414,4],
						  navigation : true
					 
						});
						
					}); 
				</script>
				<div id="owl-demo6" class="owl-carousel">
		<%
			String sql3="Select * from twitsrate ORDER BY postiverate ASC";
			ResultSet rs3=db.getResultSet(sql3);
										
			while(rs3.next())
			{
				String pid3 = rs3.getString("pid");
				String positiveper3 = rs3.getString("postiverate");
				
				String sql4="Select * from products Where twits='"+pid3+"'";
				ResultSet rs4=db.getResultSet(sql4);		
				if(rs4.next())
				{
					String pname4 = rs4.getString("pname");
					String str4 = pname4.substring(0, 10)+"...";
					String image14 = rs4.getString("image1");
					String pprice4 = rs4.getString("pprice");
		 %>
					<div class="item" id="commentdiv">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>Sale</h6></div>
							<a href="products1.jsp"><img src="../admin/product/<%=image14%>" alt="img" style="height:300px;"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.jsp"><%=str4%></a></h4>
								<p>Positive Reviews Percentage:-<%=positiveper3%></p>
								<h5><%=pprice4%></h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
									<input type="hidden" name="amount" value="20.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div>
		<%
				}
			}
		%>
				</div>    
			</div>
			<!-- //twits recommendations -->s