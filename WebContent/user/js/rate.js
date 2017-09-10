function rate(str,pid)
{	
	alert(str);
    $.post(
        "../ratesave",
        {
            str:str, 
            pid:pid
        }
        ,
        function(data) {
        	if(data=="Success")
        	{
                alert("Thanks for rating");
        	}
        	else
        	{
        		alert("Error Occured Please rate once again");
        	}
        }
        );
}