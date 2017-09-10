<%@page import="database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Smart Shopping an E-commerce Online Shopping</title>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style --> 
<link href="css/ken-burns.css" rel="stylesheet" type="text/css" media="all" /> <!-- banner slider --> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js --> 
<!-- web-fonts -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Offside' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<!-- web-fonts --> 
<script src="js/owl.carousel.js"></script>  
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({ 
	  autoPlay: 3000, //Set AutoPlay to 3 seconds 
	  items :4,
	  itemsDesktop : [640,5],
	  itemsDesktopSmall : [480,2],
	  navigation : true
 
	}); 
}); 
</script>
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();  
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function(i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10, 
                zIndex: 999
            });
        });
    });
</script>
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
<script src="js/bootstrap.js"></script>	
<script type="text/javascript">
	function gotoproducts(str,str1)
	{
		//alert(str1);
		location="products.jsp?cat="+str+"&subcat="+str1;
	}
	function viewcart()
	{
		var e = document.getElementById("PPsbmincart");
        if(e.style.display == 'none')
             $('#PPsbmincart').delay(100).fadeIn(300);
             //e.style.display = '';
        else
             //e.style.display = 'none';
             $('#PPsbmincart').delay(100).fadeOut(300);
	}
	function viewcart1()
	{
		var e = document.getElementById("PPsbmincart");
        if(e.style.display == 'block')
             $('#PPsbmincart').delay(100).fadeOut(300);
             //e.style.display = '';
	}
</script>
<script src="js/addtocart.js" type="text/javascript"></script>
<script src="js/runthread.js" type="text/javascript"></script>
<script src="js/reload.js" type="text/javascript"></script>
<script src="js/rate.js" type="text/javascript"></script>
<script src="js/removecart.js" type="text/javascript"></script>
</head>
<body onclick="viewcart1()">
	<!-- header -->
	<div class="header">
		<div class="w3ls-header"><!--header-one--> 
			<div class="w3ls-header-left">
				<p><a href="#">USE SMART SHOPPING SYSTEM AND GET BEST PRODUCTS BEST DEALS WITH SPECIAL OFFERS AND DISCOUNT</a></p>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i> My Account<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="checkout.jsp">My Orders </a></li> 
							<li><a href="myhistory.jsp">My History</a></li> 
						</ul> 
					</li> 
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-percent" aria-hidden="true"></i> Today's Deals<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.jsp">Best Products</a></li> 
							<li><a href="offers.jsp">Product Discounts</a></li>
							<li><a href="offers.jsp">Special Offers</a></li> 
						</ul> 
					</li>  
					<li class="dropdown head-dpdn">
						<a href="help.jsp" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.jsp"><span>S</span>mart <i>Shopping</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
				<div class="header-search">
					<form action="../search" method="post">
						<input type="search" name="Search" placeholder="Search for a Product..." required="">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart"> 
					<div class="my-account">
						<a href="contact.jsp"><i class="fa fa-map-marker" style="padding-left:30px;" aria-hidden="true"></i>CONTACT US</a>						
					</div>
					<div class="my-account">
						<a href="../logout"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a>						
					</div>
					<div class="cart"> 
						<form action="checkout.jsp" method="post" class="last"  id="total">
<%
							DatabaseConnection db = new DatabaseConnection();
							db.dbconnection();
							ResultSet res = null;
							String uid=(String) session.getAttribute("uid");
							int total=0;						
								String sql11="SELECT count(uid) as total FROM cart WHERE uid='"+uid+"'";
								res=db.getResultSet(sql11);
																	
								if(res.next())
								{
									String gettotal = res.getString("total");
									total=Integer.parseInt(gettotal);
									if(total > 0)
									{
%>
									<button  class="w3view-cart" type="submit" name="submit">
										<i class="fa fa-cart-arrow-down" aria-hidden="true"><span style="font-size:20px;">-<%=total%></span></i>
									</button>
<%
									}
									else
									{
%>
									<button class="w3view-cart" type="submit" name="submit">
										<i class="fa fa-cart-arrow-down" aria-hidden="true">-0</i>
									</button>
<%
									}
								}
%>
						</form>  
					</div>
					<div class="clearfix"> </div> 
				</div> 
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">Store Categories</a>
						<nav class="cd-dropdown"> 
							<a href="#0" class="cd-close">Close</a>
							<ul class="cd-dropdown-content"> 
								<li><a href="offers.jsp">Today's Offers</a></li>
									
								<%
											ResultSet rs = null;
											
												String sql="Select * from cat";
												rs=db.getResultSet(sql);
												
												while(rs.next())
												{
													String id = rs.getString("id");
													String cname = rs.getString("cname");
								%>
								<li class="has-children">
									<a href="#"><%=cname%></a>   
										<ul class="cd-secondary-dropdown is-hidden"> 
											
								<%							
												String sql1="Select * from subcat Where cid='"+id+"'";
												ResultSet rs1=db.getResultSet(sql1);
													while(rs1.next())
													{
														String sid = rs1.getString("id");
														String scname = rs1.getString("subname");
														String image = rs1.getString("image");
								%> 
												<li style="cursor:pointer" onclick="gotoproducts('<%=id%>','<%=sid%>')">
													<a href="products.jsp?cat=<%=id%>&subcat=<%=sid%>"><%=scname%></a> 
													<img src="../navbarimg/<%=image%>" width="150px" height="100px;">
											
								<%
													}
								%>
										</li>
									</ul>
								</li> 
								<%
												}
								%>						 
								<li><a href="sitemap.jsp">Full Site Directory </a></li>  
							</ul> <!-- .cd-dropdown-content -->
						</nav> <!-- .cd-dropdown -->
					</div> <!-- .cd-dropdown-wrapper -->	 
				</div>
				<div class="move-text">
					<div class="marquee"><a href="offers.jsp"> New collections are available here...... <span>Get everything | no extra taxes, view best products as per users tweets, reveiws and rating </span> <span> Get Unlimited offers on diffrent products</span></a></div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
					<script>
					  $('.marquee').marquee({ pauseOnHover: true });
					  //@ sourceURL=pen.js
					</script>
				</div>
			</div>
		</div>
	</div>
<!-- //header -->
	<!-- countdown.js -->	
	<script src="js/jquery.knob.js"></script>
	<script src="js/jquery.throttle.js"></script>
	<script src="js/jquery.classycountdown.js"></script>
		<script>
			$(document).ready(function() {
				$('#countdown1').ClassyCountdown({
					end: '1388268325',
					now: '1387999995',
					labels: true,
					style: {
						element: "",
						textResponsive: .5,
						days: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#1abc9c",
								lineCap: 'round'
							},
							textCSS: 'font-weight:300; color:#fff;'
						},
						hours: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#05BEF6",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						minutes: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#8e44ad",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						seconds: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#f39c12",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						}

					},
					onEndCallback: function() {
						console.log("Time out!");
					}
				});
			});
		</script>
	<!-- //countdown.js -->
<div id="showdata" style="display:none;">
         
</div>