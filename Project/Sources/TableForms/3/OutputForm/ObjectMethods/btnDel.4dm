// Clear search button - Clear search text and reload all projects
var $event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		// Clear the search field
		Form:C1466.search:=""
		
		// Hide the clear button since search is now empty
		OBJECT SET VISIBLE:C603(*; "btnDel"; False:C215)
		
		// Reload projects with empty search
		ALL RECORDS:C47([Project:3])
		
End case 
