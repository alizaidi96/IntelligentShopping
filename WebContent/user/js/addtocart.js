function addCart(pid)
{	
    $.post(
        "addcart.jsp",
        {
            pid:pid 
        }
        ,
        function(data) {
             
            //if(data="success")
            //{
               // alert('success');
                  $('#showdata').html(data);
                  $('#showdata').delay(100).fadeIn(300).delay(100).fadeOut(6000);
                    
                    $.get(
                    "gettotalcart.jsp",
                    function(data) {
                           //alert('success');
                            $("#total").html(data);
                        }
                    );
            //}
        }
        );
}