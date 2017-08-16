waitUntil {!isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["space1","--------------------------"];
player createDiarySubject ["ChangeLog","ChangeLog"];
player createDiarySubject ["Regeln","Regeln"];
player createDiarySubject ["Teamspeak 3","Teamspeak 3"];
player createDiarySubject ["Fragen","Support"];
player createDiarySubject ["items","Allgemeines"];
player createDiarySubject ["controls","Tastenbelegung"];
player createDiarySubject ["space2","--------------------------"];
player createDiarySubject ["Illegales","Illegales"];
player CreateDiarySubject ["space3","--------------------------"];
player CreateDiarySubject ["TwitchStream","TwitchStream"];
player CreateDiarySubject ["space4","--------------------------"];

player createDiaryRecord ["Regeln",
	[
		"Regelwerk",
			"
			<br />
			<font color='#FACC2E'>Unsere aktuellen Regeln findet ihr unter:</font><br/>
			<br />
			<font color='#FACC2E'>http://michecortes.de/serverinfo/armaregeln/</font><br/>
			<br />
			"
	]
];

player createDiaryRecord ["TwitchStream",
	[
		"MicheCortesLP",
			"
			<br />
			<font color='#FACC2E'>Schaut MicheCortes im Stream zu und werdet Teil von etwas Größerem</font><br/>
			<br />
			<font color='#FACC2E'>http://www.twitch.com/michecorteslp</font><br/>
			<br />
			"
	]
];

player createDiaryRecord ["ChangeLog",
	[
		"10.05.17",
			"
			<br />
			<font color='#FACC2E'>- Ingame ChangeLog eingeführt</font><br/>
			<br />
			<font color='#FACC2E'>- Kavala FARA Helispawn</font><br/>
			<br />
			<font color='#FACC2E'>- Teeverarbeiter Lizenz-Preisanzeige korrigiert</font><br/>
			<br />
			<font color='#FACC2E'>- Verwahrstelle mit Flughangar ausgestattet</font><br/>
			<br />
			"
	]
];

player createDiaryRecord ["ChangeLog",
	[
		"09.05.17",
			"
			<br />
			<font color='#FACC2E'>- FARA Medic Rucksack</font><br/>
			<font color='#FACC2E'>- Texturen verkleinert</font><br/>
			<font color='#FACC2E'>- Vorbereitungen für HeadlessClient</font><br/>
			<br />
			"
	]
];

player createDiaryRecord ["Teamspeak 3",
	[
		"Teamspeak 3",
			"
			<br />
			<font color='#FACC2E'>Unseren TeamSpeak³-Server findest du unter: michecortes.teamspeak.de</font><br/>
			<br/>
			<font color='#FACC2E'>Unsere Website findest du unter:</font><br/>
			michecortes.de<br/>
			"
	]
];
	
player createDiaryRecord ["Fragen",
	[
		"Fragen/Fahrzeugverlust",
			"
			<br />
			Du hast eine Frage oder einen Fahrzeugverlust zu melden? Find dich in<br />
			unseren Supportchannel ein!<br /><br />
			Unsere Supporter warten um dir helfen zu können.
			"
	]
];
	
player createDiaryRecord ["items",
	[
		"Farming",
			"
			<br />
			=== <font color='#FE642E'>Items</font> ==============================================<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Stein<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Öl<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Eisen<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Kupfer<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Diamant<br />
			[<font color='#63bfaa'>Spitzhacke</font>] - Salz<br />
			[<font color='#63bfaa'>Netz</font>] - Muschel<br />
			[<font color='#63bfaa'>Schaufel</font>] - Sand<br />
			[<font color='#63bfaa'>Axt</font>] - Holz<br />
			[<font color='#63bfaa'>Nichts</font>] - Pfirsich<br />
			[<font color='#63bfaa'>Nichts</font>] - Apfel<br />
			[<font color='#63bfaa'>Nichts</font>] - Kakao<br />
			[<font color='#63bfaa'>Nichts</font>] - Marihuana<br />
			[<font color='#63bfaa'>Nichts</font>] - Heroin<br />
			[<font color='#63bfaa'>Nichts</font>] - Kokain<br />
			[<font color='#63bfaa'>Netz</font>] - LSD<br />
			<br />
			=== <font color='#2E2EFE'>Lizenzen (Allgemein)</font> =============================================<br />
			[<font color='#63bfaa'>1000 €</font>] - Führerschein<br />
			[<font color='#63bfaa'>50.000 €</font>] - Bootsschein<br />
			[<font color='#63bfaa'>20.000 €</font>] - Gefahrgutführerschein<br />
			[<font color='#63bfaa'>75.000 €</font>] - LKW Führerschein<br />
			[<font color='#63bfaa'>300.000 €</font>] - Waffenschein<br />
			[<font color='#63bfaa'>150.000 €</font>] - Pilotenschein<br />
			[<font color='#63bfaa'>500.000 €</font>] - Berufpilotenschein<br />
			[<font color='#63bfaa'>2.500.000 €</font>] - Rebellentraining<br />
			[<font color='#63bfaa'>1.000.000 €</font>] - Hausbesitzerurkunde<br />
			[<font color='#63bfaa'>15.000.000 €</font>] - Elite-Waffenschein<br />
			<br />
			=== <font color='#FF0040'>Lizenzen (Farming)</font> =========================================<br />
			[<font color='#63bfaa'>8.000 €</font>] - Kupfer<br />
			[<font color='#63bfaa'>5.000 €</font>] - Kakao<br />
			[<font color='#63bfaa'>25.000 €</font>] - Tee<br />
			[<font color='#63bfaa'>80.000 €</font>] - Stein<br />
			[<font color='#63bfaa'>500.000 €</font>] - Diamant<br />
			[<font color='#63bfaa'>60.000 €</font>] - Eisen<br />
			[<font color='#63bfaa'>75.000 €</font>] - Holz<br />
			[<font color='#63bfaa'>150.000 €</font>] - Silber<br />
			[<font color='#63bfaa'>300.000 €</font>] - Öl<br />
			[<font color='#63bfaa'>120.000 €</font>] - Sand<br />
			[<font color='#63bfaa'>100.000 € </font>] - Salz<br />
			[<font color='#63bfaa'>500.000 €</font>] - Muschel<br />
			[<font color='#63bfaa'>600.000 €</font>] - Marihuana<br />
			[<font color='#63bfaa'>750.000 €</font>] - Kokain<br />
			[<font color='#63bfaa'>650.000 €</font>] - Heroin<br />
			[<font color='#63bfaa'>1.500.000 €</font>] - LSD muss man haben!<br />
			"
	]
]; 
	
player createDiaryRecord ["controls",
	[
		"Tastenbelegung",
			"
			<br />
			=== <font color='#FE642E'>Allgemein</font> ==============================================<br />
			[<font color='#63bfaa'>M</font>] - Karte anzeigen<br />
			[<font color='#63bfaa'>LEERTASTE</font>] - Aktion aus dem Scrollmenü ausführen<br />
			[<font color='#63bfaa'>T</font>] - Kofferraum/Lagerkammer<br />
			[<font color='#63bfaa'>L</font>] - Licht an/aus (Nur in der Nacht)<br />
			[<font color='#63bfaa'>Z</font>] - Spielermenü<br />
			[<font color='#63bfaa'>U</font>] - Auf-/Abschließen von Türen (Fahrzeuge und Häuser)<br />
			[<font color='#63bfaa'>#</font>] - Salutieren<br />
			[<font color='#63bfaa'>SHIFT + H</font>] - Waffe holstern<br />
			[<font color='#63bfaa'>SHIFT + B</font>] - Ergeben<br />
			[<font color='#63bfaa'>Pos1</font>] - Sounds lauter<br />
			[<font color='#63bfaa'>Ende</font>] - Sounds leiser<br />
			[<font color='#63bfaa'>Ä</font>] - Hinsetzen<br />
			[<font color='#63bfaa'>2x STRG</font>] - Waffe senken<br />
			[<font color='#63bfaa'>Rechte STRG + M</font>] - GPS öffnen<br />
			[<font color='#63bfaa'>Ö</font>] - Waffe schnell wechseln<br />
			<br />
			=== <font color='#B40486'>Zivilist</font> =================================================<br />
			[<font color='#63bfaa'>Windows (Links)</font>] - Sammeln von Rohstoffen und Früchten<br />
			    (Teilweise Spitzhacke/Perlennetz/Schaufel/Axt benötigt)<br />
			[<font color='#63bfaa'>SHIFT + G</font>] - Niederschlagen<br />
			<br />
			=== <font color='#2E2EFE'>Polizei</font> =================================================<br />
			[<font color='#63bfaa'>F</font>] - Sirene<br />
			[<font color='#63bfaa'>Num 8</font>] - Anhaltesignal<br />
			[<font color='#63bfaa'>Num 9</font>] - RP-Sirene (Achtung Polizei)<br />
			[<font color='#63bfaa'>SHIFT + L</font>] - Blaulicht an/aus<br />
			[<font color='#63bfaa'>F3</font>] - Fahndungsliste anzeigen<br />
			[<font color='#63bfaa'>SHIFT + R</font>] - Festnehmen<br />
			[<font color='#63bfaa'>Ö</font>] - Barrikaden-Menue<br />
			[<font color='#63bfaa'>LEERTASTE</font>] - Barrikade Plazieren<br />
			[<font color='#63bfaa'>Entf</font>] - Barrikade Entfernen<br />
			[<font color='#63bfaa'>K</font>] - EMP-Menue<br />
			<br />
			=== <font color='#FF0040'>Rettungskräfte</font> =========================================<br />
			[<font color='#63bfaa'>F</font>] - Sirene<br />
			[<font color='#63bfaa'>SHIFT + L</font>] - Blaulicht an/aus<br />
			[<font color='#63bfaa'>O</font>] - Schranke öffnen<br />
			[<font color='#63bfaa'>Ö</font>] - Barrikaden-Menue<br />
			[<font color='#63bfaa'>LEERTASTE</font>] - Barrikade Plazieren<br />
			[<font color='#63bfaa'>Entf</font>] - Barrikade Entfernen<br />
			"
	]
];

player createDiaryRecord ["Illegales",
	[
		"Illegales",
			"
			<br />
			=== <font color='#FE642E'>Waffen</font> ==============================================<br />
			[<font color='#63bfaa'>Alle Waffen</font>] - vom Rebellenshop<br />
			[<font color='#63bfaa'>Alle Waffen</font>] - vom Elite-Shop<br />
			[<font color='#63bfaa'>Alle Langwaffen/Taser</font>] - von Polizisten<br />
			<br />
			=== <font color='#FE642E'>Fahrzeuge</font> ==============================================<br />
			<font color='#FACC2E'>Polizeifahrzeuge</font><br/>
			<font color='#FACC2E'>Strider</font><br/>
			<font color='#FACC2E'>Ifrit</font><br/>
			<font color='#FACC2E'>Qilin</font><br/>
			<font color='#FACC2E'>Prowler</font><br/>
			<br/>
			=== <font color='#FE642E'>Z-Items</font> ==============================================<br />
			<font color='#FACC2E'>Kokain</font><br/>
			<font color='#FACC2E'>Heroin</font><br/>
			<font color='#FACC2E'>Marihuana</font><br/>
			<font color='#FACC2E'>LSD</font><br/>
			<font color='#FACC2E'>Frösche</font><br/>
			<font color='#FACC2E'>Schildkröten</font><br/>
			<font color='#FACC2E'>Dietriche</font><br/>
			<font color='#FACC2E'>Nagelbänder</font><br/>
			<font color='#FACC2E'>Kabelbinder</font><br/>
			<font color='#FACC2E'>Augenbinden</font><br/>
			<font color='#FACC2E'>Bolzenschneider</font><br/>
			"
	]
];