waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["Info","Alle Infos"];
player createDiarySubject ["controls","Steuerung"];
player createDiarySubject ["rules","Server-Regeln"];
player createDiarySubject ["teamspeak","TeamSpeak Server"];

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

	
//Info-Seite

	player createDiaryRecord ["Info",
		[
			"Infos",
				"
				Auf tanoarpg.de<br/>
				"
		]
	];

	player createDiaryRecord ["teamspeak",
		[
			"TeamSpeak 3 Server",
				"
				IP: ts.tanoarpg.de<br/>
				     94.250.223.11:15093<br/>
				"
		]
	];

	player createDiaryRecord ["controls",
		[
			"Steuerung",
				"
				Allgemeine Steuerung:<br/>
				Z: Spieler Menü<br/>
				U: Fahrzeuge auf/zuschließen<br/>
				Left Shift + 1: Telefon<br/>
				ENDE: Earplugs<br/>
				Left Shift + G: Ergeben<br/>
				Left Shift + Space: Springen<br/>
				Left Shift + H: Waffe Holstern<br/>
				Left Windows: Spieler Interaktionsmenü<br/>
				T: Vehicle Trunk<br/>
				
				Polizei Steuerung:<br/>
				F: Polizei Sirene<br/>
				Ö: Polizei Warnung<br/>
				P: Polizei Lieutenant Sirene<br/>
				Ä: Cop Schranken öffnen<br/>
				O: Cops Nagelbänder legen<br/>
			    Left Shift + 2: WantedList<br/>
				Left Shift + 3: Anzeige erstatten<br/>
				Left Shift + R: Festnehmen<br/>
				Left Strg + A: Straßensperrenhemtt aufbauen/abbauen<br/>
				
				Civ Steuerung:<br/>
			    ^: Spitzhacke<br/>
				Left Shift + V: Knockout<br/>
				Left Shift + O: Civ Restrain<br/>
				Left Windows: Housing option<br/>
				Left Windows: Farmen an Feldern<br/>
				U: Häuser Öffnen/Schließen<br/>
				alt + 5:Winken<br/>
				alt + 6:Brofist<br/>
				alt + 7:Da lang!<br/>
				Shift+1,2,3,4: Coole Moves<br/>
				
				Medic Steuerung:<br/>
				F: Medic Sirene<br/>
				Ä: Schranken öffnen<br/>
				
				"
		]
	];
	
	player createDiaryRecord ["rules",
		[
			"Regeln",
				"
				<br/>Alle Regeln findet ihr auf tanoarpg.de!
				<br/>
				
				"
		]
	];