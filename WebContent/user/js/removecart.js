function removecart(id)
{
	//alert(id);
    $.post(
        "removecart.jsp",
        {
            id:id        
        }
        ,
        function(data) {
             
            if(data="success")
            {
                //alert('success');
                //$('cartdetail').click;
                //document.getElementById('cartdata').click();
                $.get(
                    "getcartdata.jsp",
                    function(data) {
                         
                           // alert('success');
                            $("#checkdata").html(data)

                            $.get(
                            "gettotalcart.jsp",
                            function(data) {
                                 
                                  // alert('success');
                                    $("#total").html(data)
                                }
                            );
                        }
                    );
            }
        }
        );
}