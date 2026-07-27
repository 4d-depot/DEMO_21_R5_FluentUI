//%attributes = {}
var $i; $j : Integer
var $project : cs:C1710.ProjectEntity
var $task : cs:C1710.TaskEntity
var $statuses; $managers : Collection
var $commentStarts; $commentRisks; $commentNextSteps : Collection
var $status : Text

// Clean existing data
ds:C1482.Task.all().drop()
ds:C1482.Project.all().drop()
SET DATABASE PARAMETER:C642([Project:3]; Table sequence number:K37:31; 0)
SET DATABASE PARAMETER:C642([Task:4]; Table sequence number:K37:31; 0)

// Base data
var $projectNames : Collection

$projectNames:=New collection:C1472(\
"Website Redesign"; \
"Mobile App Launch"; \
"Customer Portal Development"; \
"E-commerce Platform Upgrade"; \
"CRM System Implementation"; \
"Internal Dashboard Revamp"; \
"Cloud Migration Project"; \
"Data Analytics Platform"; \
"Marketing Automation Setup"; \
"Payment System Integration"; \
"Inventory Management System"; \
"HR Management Tool"; \
"Booking System Development"; \
"API Platform Modernization"; \
"Digital Transformation Initiative"\
)

$statuses:=New collection:C1472("To Do"; "Pending"; "In Progress"; "Completed")

$managers:=New collection:C1472(\
"Alice Martin"; \
"John Smith"; \
"Sophie Leroy"; \
"Mark Brown"; \
"Claire Wilson")

$commentStarts:=New collection:C1472(\
"Kickoff has been completed with client stakeholders, and the initial scope, success criteria, and governance model were reviewed in detail with all decision makers."; \
"A technical workshop was completed with the delivery team to confirm architecture assumptions, identify integration constraints, and validate delivery sequencing for the next milestones."; \
"The current sprint is focused on high-value user stories that drive immediate business outcomes while maintaining quality gates and cross-team alignment on delivery priorities."; \
"Dependencies were reviewed during the weekly steering meeting, with follow-up actions assigned to each stream lead and an updated timeline shared with the broader project team."; \
"Business priorities were aligned with product owners and operational stakeholders, with clear ownership, revised acceptance criteria, and a confirmed roadmap for the coming iteration."\
)

$commentRisks:=New collection:C1472(\
"Main risk: API response times are still unstable under peak load, which may impact user experience and could require additional optimization before release readiness is confirmed."; \
"Main risk: final design sign-off is pending from key stakeholders, creating uncertainty on implementation details and increasing the likelihood of late rework in the sprint."; \
"Main risk: data migration quality checks are behind plan, and additional validation cycles may be required to ensure consistency, completeness, and traceability before cutover."; \
"Main risk: vendor feedback is delayed this week, which could block critical decisions on integration parameters and compress the timeline for downstream test activities."; \
"Main risk: test environment availability is limited, reducing execution windows for QA and increasing coordination complexity across teams running concurrent validation."\
)

$commentNextSteps:=New collection:C1472(\
"Next step: finalize integration tests across critical workflows, document observed defects, and confirm remediation priorities with development and QA leads."; \
"Next step: prepare UAT with key users by validating scenarios, aligning business expectations, and scheduling structured feedback sessions with clear decision criteria."; \
"Next step: complete backlog refinement for phase 2, including effort reassessment, dependency mapping, and confirmation of delivery sequencing with all contributors."; \
"Next step: validate reporting metrics with finance to ensure data accuracy, KPI relevance, and consistency between operational reports and executive dashboards."; \
"Next step: schedule a go/no-go decision meeting with stakeholders, consolidating readiness evidence, residual risk analysis, and contingency actions for launch."\
)

var $taskNames : Collection

$taskNames:=New collection:C1472(\
"Define project scope"; \
"Gather requirements"; \
"Create wireframes"; \
"Design UI mockups"; \
"Setup project repository"; \
"Implement authentication"; \
"Develop core features"; \
"Integrate API services"; \
"Write unit tests"; \
"Perform code review"; \
"Fix bugs and issues"; \
"Prepare deployment"; \
"Deploy to staging"; \
"Client validation"; \
"Production release"\
)

For ($i; 1; 20)
	
	$project:=ds:C1482.Project.new()
	
	$project.name:=$projectNames[Random:C100%$projectNames.length]
	$project.manager:=$managers[Random:C100%$managers.length]
	
	$status:=$statuses[Random:C100%$statuses.length]
	$project.status:=$status
	
	$project.notificationsEnabled:=((Random:C100%2)=1)
	$project.clientValidationRequired:=((Random:C100%2)=1)
	
	Case of 
		: ($status="Completed")
			$project.progress:=100
		: ($status="To Do")
			$project.progress:=0
		Else 
			$project.progress:=Random:C100%90
	End case 
	
	$project.comments:=$commentStarts[Random:C100%$commentStarts.length]+" "+$commentNextSteps[Random:C100%$commentNextSteps.length]
	If ((Random:C100%3)=1)
		$project.comments:=$project.comments+" "+$commentRisks[Random:C100%$commentRisks.length]
	End if 
	Case of 
		: ($status="Completed")
			$project.comments:=$project.comments+" The project has been delivered, validated by the client, and formally accepted after completion of all mandatory quality and compliance checks."
		: ($status="In Progress")
			$project.comments:=$project.comments+" Execution is progressing according to plan, with active monitoring on scope, timeline, quality indicators, and escalation points."
		: ($status="Pending")
			$project.comments:=$project.comments+" The project is currently pending dependency clearance, and full execution will begin once external approvals and technical prerequisites are secured."
		: ($status="To Do")
			$project.comments:=$project.comments+" The initiative remains in planning mode, with preparation activities focused on scope stabilization, staffing alignment, and execution readiness."
	End case 
	
	$project.save()
	
	// Create tasks
	For ($j; 1; (Random:C100%5)+2)
		
		$task:=ds:C1482.Task.new()
		
		$task.title:=$taskNames[Random:C100%$taskNames.length]
		$task.assignee:=$managers[Random:C100%$managers.length]
		
		$status:=$statuses[Random:C100%$statuses.length]
		$task.status:=$status
		
		If ($status="Completed")
			$task.progress:=100
		Else 
			$task.progress:=Random:C100%100
		End if 
		
		$task.comments:=$commentStarts[Random:C100%$commentStarts.length]+" "+$commentNextSteps[Random:C100%$commentNextSteps.length]
		If ((Random:C100%4)=1)
			$task.comments:=$task.comments+" "+$commentRisks[Random:C100%$commentRisks.length]
		End if 
		Case of 
			: ($status="Completed")
				$task.comments:=$task.comments+" The task was completed successfully, reviewed by the responsible stakeholders, and documented with the expected deliverables and acceptance evidence."
			: ($status="In Progress")
				$task.comments:=$task.comments+" Work is actively in progress with regular updates shared during team checkpoints, including progress tracking and issue visibility."
			: ($status="Pending")
				$task.comments:=$task.comments+" Execution is pending prerequisite inputs and confirmations, and the team is ready to proceed once blockers are cleared."
			: ($status="To Do")
				$task.comments:=$task.comments+" The task is planned, estimated, and prioritized, with all required context available for an efficient start in the next execution window."
		End case 
		
		// relation
		$task.IDproject:=$project.ID
		
		$task.save()
		
	End for 
	
End for 