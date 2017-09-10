function reloadpage()
{	
	//alert("hi");
    $.post(
        "reload.jsp",
        {
            
        }
        ,
        function(data) {
        	//alert("hi");
             $('#loaddata').html(data);  
        }
        );
}