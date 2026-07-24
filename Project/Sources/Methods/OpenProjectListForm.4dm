//%attributes = {}


// Create a new instance of the ContactListForm class to hold the form data
var $formData:=cs:C1710.ProjectListForm.new()

// Open the ContactList form, passing the form data instance
//var $winRef:=Open form window("ProjectList"; Plain form window; Horizontally centered; Vertically centered; *)
DIALOG:C40("ProjectList"; $formData)
//CLOSE WINDOW($winRef)