waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["sealteamsloth","E-Monkeys.com"];
player createDiarySubject ["serverrules","Serverregeln"];
player createDiarySubject ["controls","Steuerung"];

// Server Rules Section
	player createDiaryRecord ["serverrules",
		[
			"Serverregeln", 
				"
				Serverregeln<br/><br/>
				- Die aktuellen Serverregeln findest du in unserem<br/>
				  Forum unter www.e-Monkeys.com im Bereich<br/>
				  Server-Informationen.<br/>
				 
				"
		]
	];

	
// Seal Team Sloth Section

	player createDiaryRecord ["sealteamsloth",
		[
			"Website/Forum",
				"
				 Patchnotes, Ankündigungen und vieles mehr<br/>
				 findest du auf unserer Homepage<br/>
				 
				 www.e-Monkeys.com
				 
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Teamspeak",
				"
				Auf unserem Teamspeak werden dir<br/>
				Zivilisten Channel sowie ein<br/>
				Ingame Support zur verfügung gestellt.<br/><br/>
				
				ts.e-Monkeys.com
				
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Werde VIP",
				"
				
				Spenden in jeglicher Form und Höhe helfen<br/>
				den Server am Laufen zu halten.<br/><br/>
				
				Werde Teil der Community und erhalte<br/>
				mit deiner Spende einzigartige Features!<br/><br/>
				
				Alle nötigen Informationen zum Spenden<br/>
				erhälst du in unserem Forum unter<br/><br/>
				
				www.e-Monkeys.com 'Werde VIP'<br/><br/>
				
				"
		]
	];
		
	
	
	

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"Steuerung",
				"
				Z: Spieler-Menü öffnen<br/>
				U: Fahrzeuge abschließen und öffnen<br/>
				F: Polizeisirene (Polizei)<br/>
				Windowstaste + T: Schnelltaste zum Sammeln<br/>
				1: Spielernamen anzeigen<br/>
				2: Eigenen Personalausweis öffnen<br/>
				3: Ohropax einsetzen<br/>
				Left Shift + R: Festnehmen<br/>
				Left Shift + G: Ergeben<br/>
				Left Ctrl + G: Niederschlagen<br/>
				Left Shift + H: Holstern / Schultern<br/>
				Left Shift + F: Yelp (Polizei)<br/>
				Shift + NUM 1: Taekwondo<br/>
				Shift + NUM 2: Kniebeugen<br/>
				Shift + NUM 3: Schnelle Kniebeugen<br/>
				Shift + NUM 4: Liegestützen<br/>
				Shift + NUM 5: Pinkeln<br/>
				Shift + NUM 6: Begrüßung<br/>
				Shift + NUM 7: Nicken<br/>
				"
		]
	];