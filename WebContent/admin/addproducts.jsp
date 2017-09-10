<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
	function getsubcat(str)
	{
		if(window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  	xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
			xmlhttp.onreadystatechange=function()
		  {
		  if(xmlhttp.readyState==4 && xmlhttp.status==200)
		  {			  
		    document.getElementById("subcat").innerHTML=xmlhttp.responseText;
		  }
		  }
		xmlhttp.open("GET","getsubcat.jsp?cat="+str,true);
		xmlhttp.send();
	}
</script>
<!-- register -->
	<div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">Add Products</h3>
			<div class="login-form-grids">
				<h5 class="animated wow slideInUp" data-wow-delay=".5s">Product information</h5>
				<form action="../insertproduct" method="post" enctype="multipart/form-data" class="animated wow slideInUp" data-wow-delay=".5s">
					<select name="cat" onchange="getsubcat(this.value)">
						<option value="0">Select Category</option>
						<%
							DatabaseConnection db = new DatabaseConnection();
							db.dbconnection();
							ResultSet rs = null;
											
								String sql="Select * from cat";
								rs=db.getResultSet(sql);
								while(rs.next())
								{
									String id = rs.getString("id");
									String cname = rs.getString("cname");
						%>
							<option value="<%=id%>"><%=cname%></option>
						<%
								}
						%>
					</select>
					<select name="subcat" id="subcat">
						<option value="0">Select Sub-category</option>
					</select>
					<input type="text" name="pname" placeholder="Product Name..." required >
					<input type="text" name="pprice" placeholder="Product price..." required>
					<input type="text" name="pqty" placeholder="Product Quantity..." required>
					<input type="text" name="pstock" placeholder="Product Stock..." required >
					<input type="file" name="image1" placeholder="Product Image first" required >
					<input type="file" name="image2" placeholder="Product Image second" required>
					<input type="file" name="image3" placeholder="Product Image third" required><br>
					<textarea style="height:100px ; width:515px ; border-color: #000000"  name="description" placeholder="Product description..." required></textarea>
					<input type="text" name="twits" placeholder="Product Name for Twits Fetching" required>
					<input type="submit" value="Add Product">
				</form>
			</div>
		</div>
	</div>
<!-- //register -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".5s">
					<h3>About Us</h3>
					<p>Duis aute irure dolor in reprehenderit in voluptate velit esse.<span>Excepteur sint occaecat cupidatat 
						non proident, sunt in culpa qui officia deserunt mollit.</span></p>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".6s">
					<h3>Contact Info</h3>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234k Avenue, 4th block, <span>New York City.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".7s">
					<h3>Flickr Posts</h3>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/13.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/14.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/15.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/16.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/13.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/14.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/15.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/16.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/13.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/14.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/15.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.jsp"><img src="images/16.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".8s">
					<h3>Blog Posts</h3>
					<div class="footer-grid-sub-grids">
						<div class="footer-grid-sub-grid-left">
							<a href="single.jsp"><img src="images/9.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="footer-grid-sub-grid-right">
							<h4><a href="single.jsp">culpa qui officia deserunt</a></h4>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="footer-grid-sub-grids">
						<div class="footer-grid-sub-grid-left">
							<a href="single.jsp"><img src="images/10.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="footer-grid-sub-grid-right">
							<h4><a href="single.jsp">Quis autem vel eum iure</a></h4>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="footer-logo animated wow slideInUp" data-wow-delay=".5s">
				<h2><a href="index.jsp">Best Store <span>shop anywhere</span></a></h2>
			</div>
			<div class="copy-right animated wow slideInUp" data-wow-delay=".5s">
				<p> 2016 @ All rights reserved </p>
			</div>
		</div>
	</div>
<!-- //footer -->
</body>
</html>