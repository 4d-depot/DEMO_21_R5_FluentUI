var $left; $top; $right; $bottom; $windowWidth; $windowHeight; $buttonWidth; $buttonHeight : Integer

Case of
		
	: (Form event code:C388=On Resize:K2:27)
		
		GET WINDOW RECT:C443($left; $top; $right; $bottom; Current form window)
		
		$windowWidth:=$right-$left
		$windowHeight:=$bottom-$top
		$buttonWidth:=($windowWidth-60)/2
		$buttonHeight:=($windowHeight-120)/2
		
		OBJECT SET COORDINATES:C1248(*; "project_btn"; 20; 80; 20+$buttonWidth; 80+$buttonHeight)
		OBJECT SET COORDINATES:C1248(*; "list_btn"; 40+$buttonWidth; 80; $windowWidth-20; 80+$buttonHeight)
		OBJECT SET COORDINATES:C1248(*; "Button"; 20; 100+$buttonHeight; $windowWidth-20; $windowHeight-20)
		
End case