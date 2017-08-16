waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Allgemeine Regeln"];
player createDiarySubject ["policerules","Polizei Regeln"];
player createDiarySubject ["Lizensen","Lizenspreise (Preise!)"];
//player createDiarySubject ["civrules","Zivilisten Regeln"];
player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
//player createDiarySubject ["gangrules","Gang Regeln"];
//player createDiarySubject ["terrorrules","Rebellen Regeln"];
player createDiarySubject ["controls","Steuerung"];


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
					Den offiziellen Changelog findest du im Forum !<br/>
					Oder ihr kommt auf unseren Teamspeak unter: <br/>
					46.20.46.76:10111 <br/>					
				"
		]
	];
	
	player createDiaryRecord["serverrules",
		[
			"Serverregeln",
				"
					Die Serverregeln findet iht im Forum unter www.neighbourhood-life.enjin.com/home.<br/><br/>
				"
		]
	];

// Police Section
	player createDiaryRecord ["policerules",
		[
			"Grenze",
				"
				Folgende Regeln gelten an der Grenze, sowie den Checkpoints Alpha und Bravo.<br/><br/>
				Ein Grenzcheckpoint muss mit mindestens 2 Polizisten besetzt werden. <br/><br/>
				Grenzkontrollen dürfen NICHT ohne Verdacht auf illegale Aktivitäten durchgeführt werden.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Grenzkontrolle",
				"
			
				An den Grenzübergängen zum Rebellengebiet können Cops über längere Zeit Stationiert sein.<br/><br/>
				Cops dürfen nur auf Verdacht, bezüglich Illegalen Waren Personen/Fahrzeuge durchsuchen.<br/><br/>
				Fahrer sind dazu angehalten sich langsam und mit angeschaltetem Licht dem Grenzübergang zu nähern.<br/><br/>
				Sollte sich ein Fahrer aggressiv dem Grenzübergang nähern oder ihn gar durchbrechen, so ist dies als Straftat zu werten<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Bank",
				"
				DieZentralbank ist ein gesperrtes Gebiet für Zivilisten. Zivilisten dürfendie Zentralbank nicht ohne Genehmigung betreten. Tun sie dies doch - verhaften.<br/><br/>
				Im Bereich der Zentralbank herrscht Flugverbotszone!<br/><br/>
				Wird die Zentralbank ausgeraubt, ist es Pflicht jedes verfügbaren Polizisten zu versuchen, den Raub zu stoppen.<br/><br/>
				Die eingeteilten Polizisten sollten sich sofort zur Zentralbank begeben, kleine Verbrechen können in diesem Fall ignoriert werden.<br/><br/>
				Waffeneinsatz ist gestattet, allerdings sollte jede Möglichkeit sie lebend gefangen zu nehmen zuerst versucht werden.<br/><br/>
				Die Polizei darf nicht blind in die Bank feuern.<br/><br/>
				Jeder Zivilist, der sich in unmittelbarer Umgebung des Bankgeländes aufhält, gilt während eines Banküberfalls als potentieller Komplize der Bankräuber.<br/><br/>
				Jeder Zivilist, welcher aktiv versucht die Beamten am Betreten der Bank zu hindern wird verhaftet.<br/><br/>
				Alle Beteiligten Bankräuber müssen sich im Umkreis von 400 Meter um das Bankgebäude aufhalten.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Illegale Gebiete", 
				"
				Das Outland wird nicht als Illegales Gebiet angesehen, sondern als außerhalb der Zuständigkeit der Polizei. Diese kann dort nach eigenem Ermessen eingreifen. <br/><br/>
				Cops dürfen illegale Gebiete nur stürmen, wenn sie minedestens zu 4 sind und mindestens 1 Officer dabei ist.<br/><br/>
				Einem Polizist ist es unter keinen Umständen erlaubt ein illegales Gebiet zu becampen.<br/><br/>
				Polizisten dürfen mobile Checkpoints nicht näher als 1000 Meter an einem illegalen Ort (Drugfields, Drugprocessings) aufbauen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
			Ein mobiler Checkpoint muss aus mindestens 3 Polizisten und 2 Fahrzeugen bestehen.<br/><br/>
			
			Richtiges Verhalten an Checkpoints:<br/><br/>
			Zivilisten haben sich grundlegend an die Anweisungen der Polizei zu halten.<br/><br/>
			Weisen Sie den Polizisten ggf. darauf hin, dass Sie Waffen bei sich führen.<br/><br/>
			Tragen Zivilisten Waffen bei sich, haben sie diese sofort wegzustecken.<br/><br/>
			An einem Checkpoint dürfen Polizisten die Zivilisten ohne Angabe von Gründen durchsuchen.<br/><br/>
			Nach der Durchsuchung können die Zivilisten in ihr Fahrzeug steigen und wegfahren, solange nichts gegen sie vorliegt.<br/><br/>
			Sollte etwas illegales gefunden werden, wird die Person festgenommen und abhängig von dem begangenen Verbrechen zu einer Geld- oder Haftstrafe verurteilt.<br/><br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Fahrzeuge", 
				"
			Fahrzeuge, welche verlassen, zerstört, oder ohne Fahrer sind können beschlagnahmt werden.<br/><br/>
			Jedes Fahrzeug, welches sich über einen längeren Zeitraum nicht bewegt kann beschlagnahmt werden.<br/><br/>
			Das Beschlagnahmen von Fahrzeugen ist ein wichtiger Job. Er hilft dabei, den Server sauber zu halten und die Performance zu stärken.<br/><br/>
			Das Führen von Fahrzeugen unter Alkoholeinfluss und Drogeneinfluss ist strafbar und wird mit einem entsprechenden Bußgeld geahndet.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Festnahmen und Strafzettel", 
				"
			Es muss dem zu Verhaftenden Verbrecher vor seiner Verhaftung der Grund für seine Verhaftung genannt werden.<br/><br/>
			Das Verbrechen Mord wird mit X $ Strafe je begangenem Mord + Haftstrafe geahndet. Die Geldstrafe muss gezahlt werden. Ist die Strafe höher als das Vermögen, muss das gesamte Vermögen gezahlt werden.<br/><br/>
			Wird die Geldstrafe nicht freiwillig bezahlt, wird sie eingezogen.<br/><br/>
			Der Besitz, Vertrieb und Konsum von Rauschmitteln ist Strafbar.<br/><br/>
			Strafzettel werden als Warnung für Zivilisten angesehen. Wenn ein Zivilist ein Gesetz bricht aber keine Gefahr für jemanden darstellt wird ihm ein Strafzettel geschrieben.<br/><br/>
			Strafzettel müssen einen zu rechtfertigenden Preis haben.<br/><br/>
			Die Höhe der Strafzettel muss auf der begangenen Straftat beruhen.<br/><br/>
			Wenn ein Zivilist sich weigert einen Strafzettel zu zahlen ist es ein Grund ihn zu verhaften.<br/><br/>
			Einem Zivilisten einen unangebracht hohen Strafzettel auszustellen ist nicht erlaubt und führt zur Degradierung/Suspendierung nach ermessen der Polizei-Chefs.<br/><br/>
			Kann ein Spieler nicht Zahlen, dann muss er eine bestimmte Zeit dafür im Gefängnis sitzen.<br/><br/>
				"
		]
	];

	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebellen/Gang Regeln",
				"
			Rebellen können auf ihrem Terrain jederzeit das Feuer auf Polizisten eröffnen.<br/><br/>
			Rebellen/Banditen gelten grundsätzlich verdächtig und dürfen von der Polizei durchsucht werden.<br/><br/>
			Cops können im Falle eines Angriffs jederzeit das Feuer erwidern.<br/><br/>
			Rebellen/Banditen sind Feinde der Cops, nicht der Zivilisten. Rebellen dürfen niemals ohne RP Hintergrund das Feuer auf Zivilisten eröffnen, auch nicht in ihrem Gebiet.<br/><br/>
			Rebellen müssen sich, um als offizielle Rebellenorganisation anerkannt zu werden, mit einem ausführlichen Post im entsprechenden Forum vorstellen und dort ihre Mitglieder sowie Gründe.<br/><br/>
			ihrer Rebellion vortragen.<br/><br/>
			Eine Rebellenbande muss, um als diese erkannt zu werden, ihren Namens-Tag vor dem Ingame Namen tragen.<br/>
			Die Fahrzeuge im Rebellenshop sind illegale Fahrzeuge. Illegale Fahrzeuge, welche außerhalb des Outlands von der Polizei gestoppt werden, dürfen von von der Polizei für den aktuellen Restart-Zyklus beschlagnahmt werden.<br/><br/>
			Illegale Waffen sind verboten. Wenn Rebellen/Banditen mit ihnen erwischt werden, darf die Polizei die illegalen Waffen zusätzlich zu dem Bußgeld beschlagnahmen (außer vom Rebellengebiet).<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gang Kriege",
				"
			Zivilisten dürfen im Rahmen dieser Kriege nicht getötet werden.<br/><br/>
			Voraussetzung für einen Gang Krieg ist, dass die beteiligten Gangs im Forum nach allgemein gültigen Regeln angemeldet sind.<br/><br/>
			Voraussetzung ist eine offizielle Kriegserklärung im Forum mit Benennung des Grundes für den Krieg.<br/><br/>
			Die Polizei greift in den Gang Krieg nicht ein, außer sie wird von Zivilisten zu Hilfe gerufen oder Zivilisten sind gefährdet.<br/><br/>
			Die Respawnregeln gelten auch während eines Gangkrieges<br/><br/>
			Während des Krieges gibt es keine Safezones<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Besetzung",
				"
			Wird ein Ort längerfristig von einer Gang besetzt, muss dies im besetzte Orte Forum angegeben werden.<br/><br/>
			Voraussetzung für die Besetzung eines Ortes durch eine Gang ist, dass die Gang offiziell unter o. g. Regeln im Forum angemeldet ist.<br/><br/>
			Gangs dürfen in von ihnen besetzten Orten Maut in angemessener Höhe von durchreisenden Zivilisten verlangen, jedoch nur einmal pro Durchreise.<br/><br/>
			Auch wenn ein Gebiet besetzt ist, muss das Roleplay eingehalten werden und es gilt weiterhin RDM Verbot.<br/><br/>
			Wenn ein Ort durch eine Gang besetzt ist, kann die Polizei versuchen, Das Gebiet zu befreien, muss es aber nicht. Wichtigster Faktor hierbei ist die Sicherheit der Zivilisten.<br/><br/>
			Rebellen duerfen sich mit Waffengewalt gegen die Polizei wehren, sollte diese versuchen, das Gebiet zu befreien.<br/><br/>
			Die Polizei darf sich in besetzten Orten aufhalten, muss sich aber an die Regeln fuer das Rebellengebiet halten. Trotzdem gilt - RDM VERBOT!<br/><br/>
			Ein besetzter Ort gilt als Rebellengebiet. Somit sind hier Rebellenwaffen sowie Rebellenfahrzeuge legal und duerfen von der Polizei nicht beschlagnahmt werden.<br/><br/>
			Ein durch eine Gang besetzter Ort darf von einer anderen Gang uebernommen werden. Die Polizei hat sich hierbei nicht einzumischen, es sei denn, Zivilisten werden angegriffen und erstatten Anzeige.<br/><br/>
			Ein besetzter Ort gilt als befreit, wenn sämtliche Gangmitglieder aus dem Ort durch die Polizei vertrieben oder getötet worden sind.<br/><br/>
			Sollte ein Ort befreit worden sein, muss die Anzeige des besetzten Ortes im Forum gekennzeichnet sein.<br/><br/>
			Wurde ein besetzter Ort befreit, darf die vertriebene/ausgelöschte Gang den Ort für die Dauer des aktuell laufenden Server Restart Zyklus nicht erneut besetzen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Überfall",
				"
			Ein Überfall muss per Directchat angekündigt sein<br/>
			Nachdem eine Forderung gestellt wurde, muss dem Opfer mind. 10 Sekunden Zeit gegeben werden der Forderung nachzukommen<br/>
			Sollte das Opfer die Forderungen nicht nachkommen, dann sollten ihm die Alternativen genannt werden<br/>
			Sollte das Opfer mit einem Fahrzeug flüchten, dann hat das zerstören von Reifen oder dem Rotor (Helikopter) vorrang und nicht das Töten des Menschen<br/>
			Flüchtet ein Opfer in eine Savezone, verliert die Safezone ihre Wirkung für alle beteiligten<br/>
			Das Töten des Menschen sollte die aller letzte Möglichkeit sein!<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Allgemeine Stuerung:<br/>
				
				Z: Spieler Menü öffnen<br/>
				U: Auto auf und Abschließen<br/>
				T: Kofferraum Öffnen<br/>
				Shift+P: Ohrstöpsel<br/>
				Left Shift + G: Niederschlagen <br/>
				Left Shift + B: Ergeben<br/>
				Left Shift + H: Waffe Holstern<br/>
				Left Windows: Interaktionsmenü / Sammeln<br/>
				Shift + Numpad Zahlen: Animationen<br/>
				
				Cop Stuerung;<br/>
				F: Sirene<br/>
				Left Shift + R: Person Festnehmen<br/>
				Left Shift + L: Blaulicht Einschalten.<br/>
				O: Schranken Öffnen<br/>
				"
		]
	];
	
	player createDiaryRecord ["Lizensen",
		[
			"",
				"
					Legale Lizensen:    30.000<br/>
					Illegale Lizensen: 150.000<br/>
				"
		]
	]; 
