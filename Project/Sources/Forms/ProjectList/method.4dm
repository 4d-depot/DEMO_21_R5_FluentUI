
var $event:=FORM Event:C1606
Case of 
	: ($event.code=On Load:K2:1)
		
		SET WINDOW TITLE:C213("List of Projects")
		LISTBOX SELECT ROWS:C1715(*; "ListBox"; Form:C1466.projects.slice(0; 1); lk replace selection:K53:1)
		
		// Initialize clear button visibility based on search content
		OBJECT SET VISIBLE:C603(*; "btnDel"; Form:C1466.search#"")
		
	: ($event.code=On Double Clicked:K2:5)
		
		// Double-click on listbox
		If ($event.objectName="ListBox")
			// Call the onEditContact method of the contact detail form
			Form:C1466.onEditProject()
		End if 
		
	: ($event.code=On Clicked:K2:4)
		
		// Click on listbox
		If ($event.objectName="ListBox")
			If (Form:C1466.selectedProject=Null:C1517)
				OBJECT SET ENABLED:C1123(*; "bEdit"; False:C215)
				OBJECT SET ENABLED:C1123(*; "bDrop"; False:C215)
			Else 
				OBJECT SET ENABLED:C1123(*; "bEdit"; True:C214)
				OBJECT SET ENABLED:C1123(*; "bDrop"; True:C214)
			End if 
		End if 
		
		// Timer expired - user has stopped typing for delaySearch ms
	: ($event.code=On Timer:K2:25)
		// Stop the timer and execute the search with current search text
		SET TIMER:C645(0)
		Form:C1466.loadProjects()
		
End case 