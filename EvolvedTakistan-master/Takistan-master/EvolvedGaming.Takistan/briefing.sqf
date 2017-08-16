if (!hasInterface) exitWith {};
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","General Rules"];


/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					http://evolvedgamingclan.com/forum/index.php?/forum/117-change-logs/
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Official Rules", 
				"
					http://evolvedgamingclan.com/forum/index.php?/topic/25-server-rules-must-read/
				"
		]
	];
	
