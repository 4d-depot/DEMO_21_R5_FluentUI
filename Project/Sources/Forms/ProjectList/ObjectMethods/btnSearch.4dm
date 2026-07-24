// Search button - Execute search with current search text
var $event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		// Update visibility of clear button based on search text
		OBJECT SET VISIBLE:C603(*; "btnDel"; Form:C1466.search#"")
		
		// Execute the search immediately
		Form:C1466.loadProjects()
		
End case 
