//%attributes = {}


WINDOW LIST:C442($win)
If (Size of array:C274($win)=0)
	$winRef:=Open form window:C675("StartScreen"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("StartScreen")
Else 
	DIALOG:C40("StartScreen")
End if 