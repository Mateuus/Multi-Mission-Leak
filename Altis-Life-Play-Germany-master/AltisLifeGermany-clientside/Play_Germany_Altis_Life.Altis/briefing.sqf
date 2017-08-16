waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["foreword","Vorwort"];
player createDiarySubject ["serverrules","Serverregeln"];
player createDiarySubject ["behavioral","Verhaltensregeln"];
player createDiarySubject ["penality","Bussgeldkatalog"];
player createDiarySubject ["close","Schlusswort"];

	player createDiaryRecord["foreword",
		[
			"Spenden",
				"
				Alle Infos, wie ihr uns unterstützen könnt findet ihr bei uns im Forum unter play-germany.de
				"
		]
	];

	player createDiaryRecord["foreword",
		[
			"Bank",
				"
				Wir haben die Bank von Altis Life 3.1.3.5 auf dem Server. Diese hat einige grundlegende Neuerungen.<br/>
				Es werden verschiedene Gegenstaende benötigt:<br/>
				- Bolzenschneider<br/>
				- Sprengladung<br/><br/>
				Ein Bankraub läuft jetzt folgendermaßen ab:<br/>
				1. Aufbrechen der Banktueren<br/>
				2. Aufbrechen der Tresorraumtüren<br/>
				3. Aufsprengen des Tresors<br/>
				4. Abtransport der geraubten Goldbarren (nur mit Bodenfahrzeug möglich)<br/>
				5. Alle Personen innerhalb des markierten Gebietes waehrend eines Bankraubes werden als Bankräuber angesehen und von der Polizei als feindlich eingestuft.
				6. Verkauf der Goldbarren bei einem der zwei Goldhändler<br/><br/>
				Die Polizei muss die Tueren und den Tresor nach einem Bankraub reparieren, anderenfalls ist die Bank frei zugänglich. Ist die Sprengladung platziert, erscheint ein Timer, der den Explosionszeitpunkt anzeigt. Die Sprengladung muss vor Ablauf des Timers mithilfe des Bombenentschärfers entschärft werden.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["foreword",
		[
			"Spezielle Steuerungselemente",
				"
				Linke Windowstaste: Hauptinteraktionstaste<br/>
				Z: Öffnen des Spielermenüs<br/>
				T: Fahrzeugkofferraum<br/>
				U: Öffnen/Abschliessen von Fahrzeugen<br/>
				Links Shift + Ö: Ergeben<br/>
				Links Shift + R: Niederschlagen / Fesseln<br/><br/>
				Links Shift + L: Einsatzlicht<br/>
				F: Yelp (als Polizist und Medic)<br/>
				Shift + F: Sirene (als Polizist und Medic)<br/>
				O: Öffnen von Schranken<br/>
				Shift + Ä: mobiler Bankzugriff (als Polizist)<br/>
				Ü: Zeigen des (Dienst-) Ausweises<br/><br/>
				"
		]
	];

	player createDiaryRecord["foreword",
		[
			"Daten",
				"
				- Filter: Altis Life Germany<br/>
				- IP: al1.play-germany.de<br/>
				- TS: ts.play-germany.de<br/>
				- Homepage:  http://play-germany.de<br/>
				- Forum: http://community.play-germany.de<br/><br/>
				"
		]
	];

	player createDiaryRecord["foreword",
		[
			"Vorwort",
				"
				Das RP liegt uns besonders am Herzen, denn das ist es, was Altis Life so besonders macht. Wenn ihr der gleichen Meinung seid, seid ihr bei uns herzlich willkommen und wir werden alles daran setzen, euch das Spielerlebnis so spannend und abwechslungsreich wie moeglich zu gestalten. Damit das funktioniert, muessen wir jedoch einige Regeln aufstellen, die jeder Spieler unbedingt kennen sollten. Bitte respektiert diese, dann werden ihr und wir mit Sicherheit sehr viel Spass haben. Team - Altis Life Germany.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Regelwerk",
				"
				Das Regelwerk ist in unserem Forum zu finden und wird dort immer aktuell gehalten.<br/>
				"
		]
	];

	player createDiaryRecord["close",
		[
			"Schlusswort",
				"
					Trotz der vielen Regeln und Gebote, die leider unabdingbar sind, um den Spielspass zu erhalten, sind wir auch nur Menschen. Wenn ihr also Zweifel habt, ob etwas richtig abgelaufen ist oder wenn ihr Verbesserungsvorschlaege habt, zoegert bitte nicht, uns entweder im TS oder InGame anzusprechen und im Supportbereich zu warten, damit wir uns so schnell wie moeglich um euer Anliegen kuemmern koennen. Solltet ihr Fragen das Spiel betreffend haben, koennte euch auch der im TS vorhandene FAQ-Channel in der Eingangshalle helfen. Team - Altis Life Germany.<br/><br/>
				"
		]
	];
