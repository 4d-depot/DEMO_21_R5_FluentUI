// Search button - Execute search with current search text
var $event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		// Update visibility of clear button based on search text
		OBJECT SET VISIBLE:C603(*; "btnDel"; Form:C1466.search#"")
		
		$search:="@"+Form:C1466.search+"@"
		// Execute the search immediately
		QUERY:C277([Project:3]; [Project:3]name:2=$search; *)
		QUERY:C277([Project:3];  | ; [Project:3]manager:3=$search; *)
		QUERY:C277([Project:3];  | ; [Project:3]status:4=$search)
		
End case 
