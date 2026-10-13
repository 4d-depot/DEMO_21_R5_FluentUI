Case of 
	: (Form event code:C388=On Load:K2:1)
		SET WINDOW TITLE:C213("List of projects")
		ALL RECORDS:C47([Project:3])
		Form:C1466.search:=""
		Form:C1466.delaySearch:=100
		OBJECT SET VISIBLE:C603(*; "btnDel"; Form:C1466.search#"")
		
	: (Form event code:C388=On Close Detail:K2:24)
		SET WINDOW TITLE:C213("List of projects")
		
End case 