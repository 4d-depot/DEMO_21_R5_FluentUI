// Input field - Handle search text change with delayed search
var $event:=FORM Event:C1606

Case of 
	: ($event.code=On After Keystroke:K2:26)
		
		Form:C1466.search:=Get edited text:C655
		
		// Update visibility of clear button based on search text
		OBJECT SET VISIBLE:C603(*; "btnDel"; Form:C1466.search#"")
		
End case 
