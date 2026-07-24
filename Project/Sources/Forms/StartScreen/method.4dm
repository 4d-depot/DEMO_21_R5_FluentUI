Case of 
		
	: (Form event code:C388=On Resize:K2:27)
		
		OBJECT GET COORDINATES:C663(*; "ref"; $left; $top; $right; $bottom)
		
		$width:=($right-$left-20)/2
		$height:=($bottom-80)/2
		
		OBJECT SET COORDINATES:C1248(*; "project_text"; 20; 80; 20+$width; 80+$height)
		OBJECT SET COORDINATES:C1248(*; "project_btn"; 20; 80; 20+$width; 80+$height)
		OBJECT SET COORDINATES:C1248(*; "list_text"; $width+40; 80; $width+40+$width; 80+$height)
		OBJECT SET COORDINATES:C1248(*; "list_btn"; $width+40; 80; $width+40+$width; 80+$height)
		
		OBJECT SET COORDINATES:C1248(*; "data_text"; 20; 100+$height; $width+40+$width; 80+$height+$height)
		OBJECT SET COORDINATES:C1248(*; "data_btn"; 20; 100+$height; $width+40+$width; 80+$height+$height)
		
End case 