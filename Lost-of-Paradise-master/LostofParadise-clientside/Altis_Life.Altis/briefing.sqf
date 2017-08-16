waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["serverrules","Serverregeln"];
player createDiarySubject ["controls","Steuerung"];

	player createDiaryRecord ["serverrules",
		[
			"Information", 
				"
				Server Regeln und Changelogs sind auf www.lostofparadise.de oder www.lop-community.de zu finden.<br/>
				Wir weisen darauf hin das wir an eine Altis Globale Bannlist angeschlossen sind, im Fall eines Geldhacks oder sonstige Hacks wird der Bann auf sehr vielen Deutschen Servern automatisch übertragen.<br/>
				"
		]
	];

	player createDiaryRecord ["controls",
		[
			"",
				"
				Z: Öffnen des Player Menüs<br/>
				U: Fahrzeuge auf und zu sperren / Häuser auf und zu sperren<br/>
				F: Cop Sirene (nur Cops)<br/>
				Ä: Cop Durchsage (nur Cops)<br/>
				T: Fahrzeug Laderaum, Haus Lager<br/>
				Q: Sammeln<br/>
				Links Shift + R: Restrain erst nach Knockout<br/>
				Links Shift + G: Niederschlagen (nur Zivilist, gebraucht zum ausrauben)<br/>
				Links Shift + 1: Ergeben<br/>
				Links Shift + Leertaste: Springen<br/>
				Links Windows: Haupt Interaktions-Taste, wird gebraucht um Items/Geld aufzuheben, Fahrzeuge zu reparieren und für Cops um mit Zivilisten zu interagieren. Kann auf eine andere Taste gelegt werden indem man unter ESC->Configure->Controls->Custom->Use Action 10 die Taste anders belegt.<br/>
				Links Shift + L: Aktivieren des Sirenen Lichts (nur Cops/ARS).<br/>
				Links Shift + P: (Ohrstöpsel) Umgebungsgeräusche leiser schalten für eine ordentliche Konversation! An / Aus Funktion
				Links Shift + Num Pad: 1: Taekwondo<br/>
				Links Shift + Num Pad: 2: Kniebeugen Langsam<br/>
				Links Shift + Num Pad: 3: Kniebeugen Schnell<br/>
				Links Shift + Num Pad: 4: Liegestütze<br/>
				"
		]
	];