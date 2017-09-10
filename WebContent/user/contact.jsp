<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
<!-- //header --> 	 	
	<!-- contact-page -->
	<div class="contact">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">Contact Us</h3>   
			<div class="contact-form-row"> 
				<div class="col-md-7 contact-left">
					<form action="../send1" method="post">
						<input type="text" name="name" placeholder="Name" required>
						<input class="email" type="text" name="email" placeholder="Email" required>
						<textarea placeholder="Message" name="message" required></textarea>
						<input type="submit" value="SUBMIT">
					</form>
				</div> 
				<div class="col-md-4 contact-right">
					<div class="cnt-w3agile-row">
						<div class="col-md-3 contact-w3icon">
							<i class="fa fa-phone" aria-hidden="true"></i>
						</div>
						<div class="col-md-9 contact-w3text">
							<p>Address:-  
							<br>Phone:-  </p> 
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="cnt-w3agile-row cnt-w3agile-row-mdl">
						<div class="col-md-3 contact-w3icon">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</div>
						<div class="col-md-9 contact-w3text">
							<p>Email Address <br> @gmail.com</p> 
						</div>
						<div class="clearfix"> </div>
					</div>
					<!-- <div class="cnt-w3agile-row">
						<div class="col-md-3 contact-w3icon">
							<i class="fa fa-heart" aria-hidden="true"></i>
						</div>
						<div class="col-md-9 contact-w3text">
							<p>Requirements<br> With Wishlists, Reviews, Ratings</p> 
						</div>
						<div class="clearfix"> </div>
					</div> -->
				</div> 
				<div class="clearfix"> </div>	
			</div>
		</div>
	</div>
	<!-- //contact-page --> 
	<jsp:include page="footer.jsp"></jsp:include>