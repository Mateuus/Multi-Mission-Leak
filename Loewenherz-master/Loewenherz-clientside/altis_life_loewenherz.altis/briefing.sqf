/*
	Filename: Briefing.sqf

	Author: www.loewenherz-projekt.de

	Description: Rules and Informations

	Examples:

	player createDiaryRecord ["Info", "Information gathered.<br /><img image='rules.paa' />"];

	player createDiaryRecord ["Diary", ["Intel", "Enemy base is on grid <marker name='enemyBase'>161170</marker>"]]

	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];

*/
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "placeholder")exitwith{};

player createDiarySubject ["placeholder","======================="];

player createDiarySubject ["infoallgemein","> Allgemeine Info's"]; 		// Allgemeine Informationen
player createDiarySubject ["regelnallgemein","> Allgemeine Regeln"]; 		// Allgemeine Regeln
player createDiarySubject ["regelnfraktionen","> Fraktionsregeln"]; 		// Fraktionsspezifische Regeln
player createDiarySubject ["gesetze","> Gesetze"]; 						// Gesetze bzw Richtlinien

/*********************************************************************************************************************************************/

	player createDiaryRecord ["infoallgemein",
		[
			"Alcohol",
				"
				Du kannst Bier, Wiskey oder Moonshine herstellen. Es folgt eine Erklaerung:<br/><br/>
				Lizenzen fuer die Herstellung von alkoholischen Getränken bekommt man beim Alcohol Licences NPC.<br/>
				Einige Items, welche man zur Herstellung benoetigt, koennen beim Markt gekauft werden:<br/>
				Zum Beispiel: Glas Bottle, Water Bottle und Cornmeal Grains.<br/><br/>
				Bier Herstellung:<br/>
				Hopfen + Hefe -> Brauerei = fermentiertes Bier<br/>
				Fermentiertes Bier + glass bottles -> Abfueller = Flasche Bier - Verkauf an der Bar bzw. Mr.Moonshine.<br/><br/>
				Wiskey Herstellung:<br/>
				Roggen + Hefe -> Brennerei = distilled Wiskey<br/>
				Distilled Wiskey + glass bottles -> Abfueller = Flasche Wiskey - Verkauf an der Bar bzw. Mr.Moonshine.<br/><br/>
				Moonshine Herstellung:<br/>
				Water Bottle + Cornmeal Grains -> Brennerei =  Mash<br/>
				Mash + Hefe -> Distillery = distilled Moonshine<br/>
				Distilled Moonshine + glass Bottles -> Abfueller = Flasche Moonshine - Verkauf bei Mr.Moonshine.<br/><br/>
				Man braucht immer die gleiche Anzahl von Items, also 1 zu 1 Verhaeltnis, um diese z.b. an der Brauerei zu processen.<br/>
				Zivilisten koennen alle 90 Sekunden eine Flasche Bier, Wiskey bzw. Moonshine trinken.<br/>
				Mit dem trinken von Alkohol steigt euer BAC, der Blutalkohol Wert.<br/>
				Alle X Minuten baut sich der Blutalkohol-Wert ein kleines bisschen ab.<br/>
				Trinken sie bitte nicht zuviel Alkohol, ansonsten kippen sie noch um und wachen in Unterhosen wieder auf.<br/>
				Beamte des LHPDs trinken keinen Alkohol, da sie sich jederzeit im Dienst befinden.<br/>
				Moonshine, in egal welcher Form, ist illegal - also strengstens verboten! Auch nur der Aufenthalt bei Mr.Moonshine wird nicht gerne gesehen.<br/>
				Polizisten können den BAC-Wert eines Zivilisten kontrollieren, was evtl. Konsequenzen zur Folge hat.<br/>
				Das Trinken in der Oeffentlichkeit ist bis zu einem Blutalkohol Wert von 0.08 gestattet. Das Fuehren von Fahrzeugen dann nicht mehr.<br/>
				Ab einem Wert von 0.12 muessen sie ihren Rausch in der Ausnuechterungszelle ausschlafen.<br/>
				Verkaufspreise koennen an der Bar bzw. bei Mr.Moonshine eingesehen werden. Alkoholische Getraenke sind vom Eco-System nicht betroffen.<br/><br/>
				"
		]
	];

		player createDiaryRecord ["infoallgemein",
		[
			"Level-System",
				"
				Es folgt die Erklaerung zum Level-/XP-System:<br/>
				Drueck Z und klick dann auf 'Skills' um dir deine Fertigkeiten anzeigen zu lassen.<br/><br/>
				Grundsaetzlich gilt folgendes:<br/>
				Je höher ein Skill ist desto schneller geht etwas, desto mehr Einheiten kommen raus oder desto mehr Bonus-Dollar springen dabei raus.<br/><br/>
				Beispiele:<br/>
				Wenn du Weed sammelst und verarbeitest, steigt dein Weed-Skill. Je hoeher du diesen Skill bringst desto schneller bzw. desto mehr sammelst du auf einmal und desto schneller processed du das Weed.<br/>
				Es gibt auch andere Skills wie Thief/Ausrauben. Je hoeher dieser Skill ist desto mehr Bonus-Dollar bekommst du wenn du eine Person ausraubst.<br/><br/>
				Desweiteren gibt es auch Skills für Polizisten oder z.b. Ärzte: Impounded/beschlagnahmt ein Polizist ein Fahrzeug, so steigt sein impounding Skill. Je höher er diesen Skill bringt, desto schneller impounded er und desto mehr Bonus Dollar$ bekommt er pro Beschlagnahmung. Das gleiche gilt für Tickets oder Inhaftierungen usw.. Weiterhin, je mehr Spieler ein Arzt wiederbelebt hat, desto schneller wird er dabei und desto mehr Bonus Geld bekommt er pro revive.<br/><br/>
				Es gibt auch Skills, deren Steigerung kaum spürbare Änderungen mit sich bringen. So z.B. Smoking. Je höher dein Smoking-Skill ist, desto besser sind deine Zigaretten gestopft, sprich desto länger brennen sie. Oder je höher dein RedGull-Skill ist, desto länger wirkt ein RedGull.<br/>
				Solltest du etwas nicht verstehen, dann frag einfach andere Spieler, oder teste es aus.<br/>
				Mit der Zeit werden immer weitere Skills hinzu kommen, so das du nach Moeglichkeit immer etwas neues findest bzw. skillen kannst.<br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Gang-Area",
				"
				Es folgt die Erklaerung zum Gang-Area-System:<br/><br/>
				Die Gang Area ist ein Ort, welcher von Gangs für betraechtliche Verguenstigungen eingenommen werden kann. Günstiger einkaufen verbunden mit Cashflow.<br/><br/>
				Sollten sich mindestens 5 Polizisten im Dienst befinden, ist es einer Gang moeglich die Area am zentralen Flaggenmast einzunehmen. Ist dies der Fall, so bekommt jeder Buerger eine Nachricht darueber und die Polizei hat Order sofort anzurücken um das Gebiet zu saeubern.<br/><br/>
				Ist die Area eingenommen, so koennen die Mitglieder der Gang mit den oertlichen Gang-Area-Dealern agieren, um dort Waffen und Fahrzeuge vergünstigt einzukaufen.<br/><br/>
				Solange die Gang Area in Haenden der Gang ist, und die Person welche das Einnehmen am Mast gestartet hat lebt, bekommt diese Person 50% aller aktuellen Drogenverkäufe cash auf die Hand.<br/><br/>
				Verkauft also jemand Drogen im Wert von 100 000$, dann bekommt der Gang-Area Besitzer einfach so 50 000$ cash auf die Hand.<br/><br/>
				Sollte es nun soweit sein, dass die Polizei an der Area angekommen ist, bedeutet dies für Beamte und Gang-Mitglieder NICHT, dass das Feuer sofort eroeffnet werden darf! Es gelten weiterhin die RDM bzw. Roleplay Regeln und eine DEUTLICHE Ansage von einer Seite muss vor einem Schusswechsel stattfinden.<br/><br/>
				Ist es der der Polizei gelungen die Gang Area zu besetzten und zu sichern, so kann sie den Gang Area Status wieder auf neutral setzen.<br/><br/>
				Natuerlich kann, wenn die Gang-Area von einer Gang gecaptured wurde, sie von einer anderen weiteren Gang erobert werden.<br/><br/>
				Das Erobern der Gang Area ist illegal und wird, wenn sie ein Polizist erwischt, mit einer Freiheitsstrafe geahndet.<br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Tankstellen",
				"
				An den Zapfsäulen der Tankstellen kannst du dein Vehikel auftanken. Weiterhin ...<br/><br/>
				Tankstelle Kaufen:<br/>
				Kaufst du eine Tankstelle, so kostet dies derzeit einmalig 10 000$. Der Betrag wird automatisch von deinem Konto abgebucht. Du bist danach der neue Besitzer dieser Tankstelle und kannst nun den Benzinpreis selbst bestimmen: Tankstelle Verwalten. Der Preis pro Liter ist normalerweise 8$. Du kannst ihn nun von 4$ bis 30$ pro Liter einstellen. Hier ein kleines Rechenbeispiel: Eine Hunterfüllung (500 Liter Benzin) kostet normalerweise 4000$.Auf dem niedrigsten Preis 2000$, auf dem höchsten 15 000$!	Sobald die Tankstelle einen Gewinn abwirft, bekommst du 100% dessen auf dein Konto ausgezahlt! Die Gewinnausschüttung erfolgt alle 15 Minuten.<br/>
				Alle Fraktionen, also CIVs, COPs, SECs und MEDICs können Tankstellen kaufen. Einnehmen und ausrauben können sie aber nur CIVs. Nach Serverneustart gehören die Tankstellen wieder niemanden, sie können also nicht permanent gekauft oder eingenommen werden.<br/><br/>
				Tankstelle einnehmen:<br/>
				Gehst du auf Tankstelle einnehmen, so musst du erstmal eine Weile warten. Nach erfolgreicher Einnahme, bekommen die COPs  eine Nachricht, das sie sich bei Gelegenheit darum kümmern sollten. Wirft die Tankstelle Gewinn ab, bekommst du 50% dessen alle 15 Minuten auf dein Konto ausgezahlt. Der Cooldown um Tankstellen einzunehmen ist 30 Minuten!	Tankstellen einzunehmen, wir sprechen heir von Schutzgelderpressung, ist eine Straftat und wird mit Gefängnis bestraft!<br/><br/>

				Zusatz-Info: Hast du dir eine Tankstelle gekauft, kann ein anderer CIV sie allerdings einnehmen! Dann geht der Gewinn der Tankstelle nicht mehr an dich, sondern an den Banditen der sie eingenommen hat. Clearen/recapturen (Tankstelle sichern) die COPs oder SECs die Tankstelle, geht der Gewinn wieder an den Besitzer.<br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Housing",
				"
				- Auf diesem Server könnt ihr euch ein Haus kaufen.<br/>
				- Ihr beginnt mit dem Kauf der “Homeowner License”.<br/>
				- Geht dann ein Gebäude und kauft dieses, falls es noch niemandem gehört.<br/>
				- Für euer Haus könnt ihr euch Lagerkisten und eine Garage kaufen.<br/>
				- Es gibt keine Erstattung bei eventuellen Bugs bzw. Verlusten.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Tastaturbefehle",
				"
				Manche dieser Befehle gelten nur, wenn man standartmäßig die ARMA 3 Steuerung aktiviert hat.<br/><br/>

		   		Y or Z: Öffnet das Player-Menü<br/>
				U: Lockt und unlockt dein Fahrzeug<br/>
				F: Aktiviert die Sirene<br/>
				T: Öffnet das Inventar des Fahrzeugs<br/>
				V: Aussteigen<br/>
				I: Inventar<br/>
				N: Nachtsicht<br/>
				B: Fernglas oder Entfernungsmesser<br/>
				Shift+G: Niederschlagen/ausrauben<br/>
				Shift+R: Fesseln<br/>
				Shift+L: Blaulicht<br/>
				Strg+Q: Spezielles Cop menü<br/>
				Links Shift + Größer/Kleiner Zeichen sind Ohrenstöpsel.<br/>
				Linke Windowstaste: Pflücken/ernten, reparieren, Spieler heilen usw.<br/>
				Linke Windowstaste + T: Sachen vom Boden aufheben usw..<br/>
				Mausrad scrollen: Radio im Auto einschalten und diverses<br/>
				Links Shift + Numpad 1,2,3 bis 9: Lustige Animationen machen.<br/>
				Rechte Maustaste: Zoom<br/><br/>

				Weiterhin: Im Z Menü unter Settings/Einstellungen kannst du den Sidechat austellen, deine Sichtweite anpassen oder Farbfilter aktivieren uvm. Im Zweifel einfach mal freundlich irgendwen fragen, am besten im TS3.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Bangründe",
				"
				Eindeutige Bangründe:<br/><br/>
				-Exploits/Hacks/Scripts.<br/>
				-Selbstmord um Roleplay zu vermeiden.<br/>
				-Vervielfältigen (duping) von Items, Fahrzeugen oder Geld.<br/>
				-Die Benutzung von gehackten Geld/Items/Fahrzeugen. SOFORT melden und Finger weg!<br/>
				-Das Ausnutzen von Bugs oder Spielmechaniken zum eigenen Vorteil.<br/>
				-Töten, Beklauen, Ausrauben, Trollen, Behindern, Entführen usw. von Medics.<br/>
				-Random Deathmatch (RDM) bzw. Vehicle Deathmatching (VDM).<br/>
				-Beleidigungen oder Rassismus.<br/>
				-Das Zesrören von Fahrzeugen ohne Roleplay-Hintergrund.<br/>
				-Das Töten eines COPS durch einen Security Operator<br/>
				-Das Benutzen des Ifrit HMG´s außerhalb der Rebel-Area.<br/>
				-Abspielen von Musik/Sounds im Spiel.<br/>
				-Combatlog, trolling oder Chat-Spam.<br/>
				-Fremdwerbung oder Server schlecht machen u.ä..<br/>
				-Schimpfwörter wie Arschloch, Fick Dich, HuSo usw. im Chat sind natürlich ein Bangrund.<br/>
				-Nervendes möchtegern Roleplay oder permanent aus der Rolle fallen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Donate Info",
				"
				Wenn du dich entscheidest für dieses Projekt zu donaten, so freuen wir uns, Danke!<br/><br/>
				Deine Donation hilft uns wirklich das Projekt am laufen zu halten.<br/><br/>
				Mehr Informationen zum Donaten findest du auf donate.lhzp.de.<br/><br/>
				Oder in unserem Forum auf forum.lhzp.de bzw. auf unserem TS3: ts.loewenherz-projekt.de:9988 pw=blah<br/><br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"Rückerstattung",
				"
				Für eine Rückerstattung deiner Items/Fahrzeuge/Kleidung musst du Beweise vor legen. Dies geschieht im besten Fall mittels Videobeweis. Als glaubhafte Zeugen gelten im Groben nur COPs, MEDICs, ADMINs, MODs und HELPER welche das Geschehen gesehen haben und somit den Verlust bestätigen können. Bilder sind wenig aussagekräftig. Am besten besorgst du dir ein Aufnahmeprogramm, und drückst in fragwürdigen Situationen direkt auf record.<br/><br/>

				Bei höherer Gewalt wie aussergewöhnlichen Serverrestarts, Servercrashs, Problemen seitens Rechenzentrum, deines Providers, Steam oder Battleye, unstabilen Arma3 Patches sowie Wipes oder Rolebacks bekommst du natürlich nichts erstattet.<br/><br/>

				Anzeigen gegen Spieler sind einfacher, jedoch wird bei einer falsch Anzeige, der Anzeiger entfernt. Spieler Anzeigen werden im TS3 getätigt, allerdings setzt dies ein gewisses Maß an “Reife” vorraus: Eine lapidar hingeklatschte Anzeige, also ohne viel Infos, Daten und Fakten, wird im Zweifel nicht beachtet, danke.<br/><br/>

				Polizisten nach einer Rückerstattung zu fragen wird immer wieder gerne gemacht, ist aber natürlich quatsch und kein Roleplay. Rückerstattungsanfragen werden über das Teamspeak 3 bei Admins, Mods oder Helpern getätigt.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["infoallgemein",
		[
			"TS3/Forum",
				"
				Unsere Teamspeak 3 Daten sind: ts.loewenherz-projekt.de:9988 pw=blah<br/><br/>
				Unsere Homepage findest du auf www.loewenherz-projekt.de<br/><br/>
				Unser Forum findest du unter forum.lhzp.de<br/><br/>
				Facebook, Twitter, Youtube und co findest du auf www.loewenherz-projekt.de oder www.lhzp.de<br/><br/>

				Shortlinks:<br/>
				ts3.lhzp.de<br/>
				twitch.lhzp.de<br/>
				youtube.lhzp.de<br/>
				twitter.lhzp.de<br/>
				facebook.lhzp.de<br/><br/>

				Es gibt Teamspeak3-Regeln, zu finden unter regeln.lhzp.de!<br/><br/>
				"
		]
	];

	player createDiaryRecord ["regelnallgemein",
		[
			"Safezones",
				"
				Safezones sind sichere Zonen, in welchen KEINE Verbrechen oder illegale Aktivitäten jeglicher Art geduldet werden. Der Radius einer Safezone ist ca. 100 Meter (+/- 10 Meter). Grobe Faustregel: Die umliegenden/angrenzenden Gebäude gehören immer zur sicheren Zone!<br/><br/>

				In einer Safezone sind sämtliche illegalen/kriminellen Aktivitäten ausnahmslos verboten und führen bei Verstoß zu einem permanentem BAN! Unwissenheit schützt davor nicht! Du darfst nicht rauben, stehlen, trollen, Spieler überfahren oder erschiessen, Autos entwenden oder versuchen diese zu lockpicken, von Ausserhalb in diese Zone hinein schiessen, andere Fahrzeuge rammen usw.. Du darfst auch nicht deinen Freund aus Spaß innerhalb einer Safezone ausrauben/überfahren/töten/beklauen usw.. Safezone ist Safezone: IMMER!<br/><br/>

				Safezones haben einen Radius von 100m und sind:<br/>
				- Kavala-Marktplatz (logisch weil ...)<br/>
				- Folgende Shops: CarShop, TruckShop, AirShop, GunStore, DonaterShop<br/>
				- Jede zivile Garage<br/>
				- Jedes Polizei-Hauptquartier (auch HWP und Grenzposten!)<br/>
				- Rebellen-Außenposten<br/>
				- Gefängnis<br/>
				- Alle Security HQ´s<br/>
				- ATM ist KEINE Safezone! Es gibt aber ATMs die in Safezones liegen!<br/><br/>
				Und nochmal: Safezone ist eine sichere Zone und zwar immer, dauerhaft, jederzeit und ausnahmslos!<br/><br/>
				Das Flüchten in eine Safezone zum Schutz von Leib und Gut ist legitim!<br/><br/>
				"
		]
	];


	player createDiaryRecord ["regelnallgemein",
		[
			"Neues Leben",
				"Stirbt man in Loewenherz RPG beginnt ein NEUES LEBEN. Die NEUES-LEBEN Regel klärt in wie weit sich das neu angefangene Leben definiert. Dies hängt von diversen Faktoren ab: Wenn dich ein COP,  Rebell oder Gangmitglied erschiesst, so beginnt für dich ein komplett NEUES LEBEN. Das bedeutet, man erinnert sich theoretisch nicht mehr daran, was man vor seinem Tod getan hat oder wie man gestorben ist bzw. wurde “geläutert”. Auch alle anderen erinnern sich nicht mehr an diese Person, was zum Beispiel sämtliche Polizeistrafen bzw. Kopfgelder verfallen lässt. Wichtig ist: Egal wie du gestorben bist, du darfst deinen Todesort 15 Minuten lang nicht mehr aufsuchen und auch innerhalb dieses Zeitraumes von Ausserhalb nicht mehr auf das Geschehen innerhalb eingreifen – am besten, man wählt eine Stadt, die weit entfernt vom Todesort ist, um neu zu spawnen oder hält weit Abstand.<br/><br/>

		KEIN NEUES LEBEN (Reset deiner Polizeiakte) entsteht bei:<br/><br/>
	 1. Absichtlichem Sterben (z.b. von einem Haus springen)<br/>
		2. Vehicle Deathmatch (überfahren werden)<br/>
		3. Serverneustart<br/>
		3. Du stirbst durch die Explosion z.b. eines Fahrzeugs.<br/>
		4. Irgendein random Spieler erschiesst dich.<br/><br/>
		"
		]
	];

	player createDiaryRecord ["regelnallgemein",
		[
			"RDM",
				"
				Das absichtliche Töten eines unbekannten Gegenübers ohne Rollenspielhintergrund wird als Random Deathmatch (RDM) bezeichnet. Ein Rollenspielhintergrund wie “Ich bin ein Irrer mit einer Waffe und schieß einfach auf alles was ich sehe!” zählt nicht. Vor dem Töten eines anderen Spielers, muss ein Motiv vorhanden sein. Dieses wird dem Gegenüber per Voice laut und deutlich mitgeteilt, danach empfiehlt sich eine Überprüfung ob er dies gehört/verstanden hat. Erst dann sollte geschossen werden. Zu brüllen “Dies ist ein Überfall!” und eine Sekunde danach sofort alles zu erschiessen, ist weder ein Motiv noch legetim. Dann könnte man den Spieler erstmal ausrauben, bevor man gleich “den Trigger” drückt. Auch die Polizei darf nicht ohne Vorwarnung er- bzw. beschossen werden. Immer erst warnen, warten und dann feuern! <br/><br/>

				ACHTUNG: Du solltest wissen das der ""Direct Voice Chat"" weniger als 50 Meter weit zu hören ist und das das Sprechen aus dem Fahrzeug heraus, mit Spielern ausserhalb des Fahrzeugs, nicht/kaum verstanden werden kann!!!<br/><br/>

				ACHTUNG: Nur weil du Rebell bist und ein COP auf dich zugerannt kommt, bedeutet das nicht das dein Kollege mit dem Sniper Schussfreigabe hat. Erst wird geredet, dann geschossen. Du willst das der COP weggeht? Dann sag es ihm, lass ihm Zeit zu antworten, lass ihm Zeit zu gehen!<br/><br/>

				VORSICHT: Warnschuesse koennen schnell als RDM oder RDM Versuch verstanden werden.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["regelnallgemein",
		[
			"VDM",
				"
				Es ist nicht erlaubt andere Spieler zu überfahren. Mit dem eigenen Fahrzeug andere Vehikel ohne vorrangegangenes Roleplay zu rammen/crashen ist ebenfalls nicht erlaubt - Vehicle Deathmatch! Durch desyncs bzw. lags kann so etwas allerdings passieren. Die meisten desyncs sind nicht schuld des Servers, sondern vielmehr von Spielern die mit unter 20 FPS spielen. Deswegen passiert so etwas vornehmlich in hoch bevölkerten Gebieten, in welchen auch noch viele Objekte stehen: siehe Kavala Marktplatz. Anmerkung: Solltest du einen Freund aus Spaß oder Versehen überfahren, wirst du dafür sehr wahrscheinlich trotzdem in das Gefängniss müssen. Der Polizei ist es allerdings gestattet zu rammen/crashen, denn diese macht so etwas nicht grundlos.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["gesetze",
		[
			"Notwehr",
				"
				Besteht akute Gefahr für das eigene Leben, darf eine LEGALE Waffe in Notwehr verwendet werden. Im Idealfall schlägt man seinen Gegenüber nieder und ergreift die Flucht, sodass beide Leben verschont bleiben.<br/><br/>

				Das Töten per Fahrzeug in einer akuten Bedrohungssituation ist NICHT erlaubt, es gibt allerdings durch Panik ausgelösste Reaktionen die so etwas rechtfertigen könnten! Die Beweislast liegt allerdings bei ihnen, ansonsten ist es VDM!<br/><br/>

				Das Töten eines anderen Spielers in Notwehr muss unverzüglich der Polizei gemeldet werden, man muss sich sofort stellen bzw. die Polizei muss antworten/reagieren. Anwortet die Polizei nicht, weil sie keine Zeit hat, das Ticket komsich geschrieben wurde o.ä. wird der Fall als Mord gehandhabt.<br/><br/>

				Sie müssen im Zweifel beweisen, das sie in Notwehr gehandelt haben. Beweise sind Videos oder glaubhafte Zeugenaussagen von COPs, MEDICs, SECs, Admins, Mods, Helpern oder bekannten Bürgern. Der Polizist kann ihnen nur Beweise für z.B. einen Mord vorlegen (DNA Spuren und Fingerabdrücke vom Tatort). Die Beweislast liegt immer bei ihnen, ansonsten könnte ja jeder kommen und auf Notwehr spekulieren.<br/><br/>

				Töten, Ausrauben, Überfahren usw. eines Freundes (z.b. aus Spaß oder Unachtsamkeit) wird genauso bestraft als wenn es ein Fremder gewesen wäre.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["regelnallgemein",
		[
			"Verkehrsregeln",
				"
				Geschwindigkeitsbegrenzungen:<br/><br/>
				-Außerorts: 130km/h<br/>
				-Innerorts: 50km/h<br/>
				-Kavalla Markt 30km/h<br/>
				Auf der gesamten Map ist der Rechtsverkehr einzuhalten.<br/>
				Das Überfliegen, hovern oder landen in Städten ist eine Straftat.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["gesetze",
		[
			"Luftfahrt",
				"
				Möchte ein Helicopter in einer Stadt landen, so kann er die Polizei via Nachricht um Landeerlaubnis bitten. Die Polizei entscheidet dann im Einzelfall, wie dringlich die Anfrage ist und meldet sich, wenn Zeit vorhanden, via Nachricht. Sollten Sie ohne Genehmigung versuchen zu landen oder drüber hinweg fliegen, so dürfen die Polizisten Gebrauch von der Schusswaffe machen und/oder ihnen ein saftiges Bussgeld aufdrücken.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["gesetze",
		[
			"Banküberfall",
				"

				- Einen Banküberfall startet man am MAP-Marker: <marker name='vico1'>Banküberfall starten!</marker><br/><br/>

				- Vorraussetzung ist weiterhin, das mindestens 12 Polizisten online sein müssen und kein anderer gerade diese Mission macht.<br/><br/>

				- Wenn ein Zivilist ohne Authorisierung das Gelände bzw. Markierung der Bank betritt, dann zählt es als Versuch diese auszurauben. Dieser Versuch kann tödlich enden.<br/><br/>

				- Bei einem Banküberfall dürfen seitens der Polizei alle Gegenmaßnahmen uneingeschränkt und ohne Vorwarnung eingesetzt werden. Dies gilt auch für polizeiliche Maßnahmen von ausserhalb auf das Bankgelände und auf flüchtige/verdächtige Personen/Fahrzeuge, welche sich vom Bankgelände entfernen oder diesem nähern.<br/><br/>

				- Beim finalen Schritt unserer Bank-Überfalls-Mission, muss sich jeder am Anfang eingeladene Bankräuber, innerhalb der Markierung (500 Meter Radius) befinden.<br/><br/>

				- Sollte ein Bankräuber sterben, darf er nach den NEUES-LEBEN Regeln zurück kehren (15 Minuten). Will er allerdings gegen die COPs agieren, muss er sich zuerst innerhalb der Markierung befinden.<br/><br/>

				- Am Banküberfall dürfen sich nur, die am Anfang eingeladenen Spieler beteiligen. Externe dürfen zu keiner Zeit hinzugezogen werden! <br/><br/>
				"
		]
	];

	player createDiaryRecord ["gesetze",
		[
			"The Purge",
				"
				Es folgen Informationen und Regeln zum Purge Event.<br/><br/>
				1.) Ein sogenannter Purge bzw. die Säuberung ist ein XX minütiges PVP Event, bei welchem für den gesamten Zeitraum Chaos und Anarchie auf den Straßen herrscht.<br/>
				2.) Sobald die Sirene ertönt, werden sämtliche Verbrechen, einschließlich Mord, für die Dauer des Events geduldet!<br/>
				3.) Es darf RDM und VDM betrieben werden. Jeder darf jeden ohne Ansage erschiessen bzw. überfahren. Die Roleplay Regeln treten bis zum Ende der Säuberung ausser Kraft.<br/>
				4.) Der polizeiliche sowie medizinische Dienst tritt ausser Kraft. Bedeutet: Während dem gesamten Zeitraum gibt es keine Cops oder Medics mehr. Sie dürfen online sein, aber weder schiessen, verhaften noch wiederbeleben. Am besten loggen sie als CIV ein oder sie verrichten ihren Dienst auf der Alkohol-Route (siehe Punkt 6).<br/>
				5.) Waffen wie Sniper(Lynx + MAR10), Rahim, MK14 oder ASP1, Raketenwerfer, Suicide-Vest, Granaten, HMG(-Offroader), Ifrit und Mienen sind NICHT erlaubt. Alle anderen Waffen sind erlaubt.<br/>
				6.) PVP ist überall erlaubt, ausser auf der sogenannten Alkohol-Route (Pyrgos, Wiskey und Bier)! Wer nicht am PVP teilnehmen möchte, kann, für die Dauer des Events, Bier und Wiskey farmen. Diese Farmer dürfen NICHT überfallen oder erschossen werden. Wie man Wiskey oder Bier farmed und herstellt sieht man unter M und dann Alcohol.<br/>
				7.) Wir empfehlen Farmern auf der Alkohol-Route eine Videoaufnahme mitlaufen zu lassen. Sollte sich jmd. die Regeln zum Purge nicht durchgelesen haben und euch überfallen, habt ihr einen Videobeweis!<br/>
				8.) Das Uran Labratory auf Chelonist gehört, ebenso wie Moonshine, nicht zur sicheren Alkohol-Route sondern ist Purgebar.<br/>
				9.) Zum The Purge-Event werden sehr wahrscheinlich einige bis viele Waffenkisten und MedicContainer in Kavala gespawned. Somit sind Waffen für die Dauer des Events gratis Verfügbar.<br/><br/>

				Möge Gott mit euch sein!<br/><br/>

				Achtung: Die Fahndungsliste des LHPDs läuft natürlich weiter. Bedeutet: Triffst du nach dem Purge auf einen Polizisten, hast du dich für deine Verbrechen zu verantworten!
				"
		]
	];

	player createDiaryRecord ["gesetze",
		[
			"Illegales",
				"
				Illegale Waffen/Items/Fahrzeuge:<br/><br/>
				-Alles was beim Rebel Outpost/HQ bzw. der Gang Area gekauft wird ist ILLEGAL! (Ausser der Meth Truck)<br/>
				-Waffen bzw. legale Items + Kugelsichere-Weste vom DonatorShop sind ILLEGAL!<br/>
				-Illegale/Rebellen Kleidung aus dem DonatorShop ist ILLEGAL!<br/>
				-Jegliche Art von Drogen (Kokain, Heroin, Weed) sowie Moonshine und Uran sind ILLEGAL!<br/>
				-Items von bedrohten Tierschutzarten wie z.b. Schildkrötenfleisch ist ILLEGAL!<br/>
				-Taucheranzug (das Atemgerät ist allerdings erlaubt) ist ILLEGAL!<br/>
				-Die Gang-Area einzunehmen oder sich innerhalb dieser aufzuhalten ist ILLEGAL!<br/>
				-GoKarts in der Dunkelheit und/oder ohne Helm+Overall zu fahren ist ILLEGAL!<br/><br/>

				Raub, Einbruch, Stehlen, Freiheitsberaubung bzw. Geiselnahme, Morden u.ä. wird fast immer mit Gefängnisaufenthalt bestraft!<br/>
				Wer illegale Items, Kleidung, Waffen oder Fahrzeuge mit sich führt, muss mit massiven Maßnahmen der Polizei rechnen, dem eventuellen Verlust dieser Gegenstände, hohen Geldstrafen oder sehr wahrscheinlich mit einem Gefängnissaufenthalt.<br/><br/>
				Zu behaupten, das man dies oder das nur gefunden hat oder es zugesteckt wurde, hilft einem nicht aus der Klemme. Lauf mal mit einer AK 47 in Berlin durch die Stadt und erklaere dann der Polizei das du die Waffe nur gefunden haettest. EPIC FAIL!<br/><br/>
				Weiterhin ist es illegal eine Waffe in Städten offen/sichtbar zu tragen. Waffen, egal welcher Art, müssen in den Holster bzw. den Rucksack.<br/><br/>
				Die Fahndungsliste der Polizei gilt als unumstößlicher Beweis!<br/><br/>
				"
		]
	];

	player createDiaryRecord["regelnfraktionen",
		[
			"Polizei",
				"
					- Bewerbungen sind auf www.loewenherz-projekt.de im Forum möglich.<br/>
					- Die Polizei muss auf ein Nicht-Rollenspiel nicht antworten. Also, wer mit Beamten nicht im Roleplay redet, bekommt evtl. keine Antwort.<br/>
					- Um eine “Drogenrazzia” durchzuführen (Feld, Processing, DrugDealer), müssen die Cops mind. 2 Mann aufbringen. Die Polizei muss eine Razzia ausdrücklich, laut und gut verständlich im Voice-Chat ausrufen. Nachdem die Lage geklärt wurde, müssen die Cops das Gebiet wieder verlassen.<br/>
					- Cops dürfen “Drogenrazzia” Gebiete nicht länger als 30 Minuten becampen, es sei denn sie haben einen dringenden Tatverdacht bzw. Gefahr in Verzug an diesem Ort zu erwarten. Ausschlaggebend dafür kann z.b. ein gespotteter Heli/LKW usw. an Feld XY oder ein Hinweis aus der Bevölkerung sein.<br/>
					- Bei einer Kriese dürfen Cops eine Stadt abriegeln wenn z.B. starke rebellische Aktivitäten auftreten, Terrorwarnungen existieren oder Geiselnahmen eine Absperrung erfordern. Nachdem die Situation geklärt wurde, muss die Abriegelung aufgehoben werden.<br/>
					- Ein Cop hat NIEMALS die Berechtigung einen Zivilisten mit Waffen auszurüsten und darf nur Waffen/Fahrzeuge/Items seinem Rang entsprechend mit sich führen. Ein Verstoß hat eine Degradierung oder Entlassung zur Folge.<br/>
					- Bevor ein Bürger eingesperrt, im Zweifel entwaffnet oder entkleidet, bzw. ihm ein Ticket ausgestellt wird, muss man ihm den Grund mitteilen und die Möglichkeit geben sich zu äusssern. Dies geschieht meist im Police HQ . Der Festgenommene kann sich äussern, möchte er allerdings in epischer Breite diskutieren, kann er dies gerne vor Gericht tun, der Beamte hat dafür keine Zeit.<br/>
					- Falls der “Bürger” einen Anwalt ruft oder fordert, ist wie folgt zu verfahren: Der Anwalt wird seinem Mandanten raten sich nicht zu äußern, da alles was er sagt später vor Gericht gegen ihn verwendet werden kann. Ein Anwalt spricht nicht mit Polizisten, sondern mit dem Staatsanwalt/Richter. Sprich: Einen Anwalt zu rufen oder zu fordern ist sinnfrei, wenn die Beweislage sowieso eindeutig ist. Die Fahndungsliste gilt als eindeutiger Beweis.<br/>
					- Wenn jemand das Bußgeld nicht bezahlen möchte/kann (refuse/ablehnen), so muss er seine Strafe im Gefängnis absitzen.<br/>
					- Bußgelder dürfen das aktuelle Kopfgeld nicht unterschreiten und dürfen maximal doppelt so hoch ausgestellt werden. Nach Ausstellen des Bußgeldes trägt der Austeller selber dafür Sorge, das der Betroffene von der Fahndungsliste entfernt wird bzw. entfernt wurde.<br/>
					- Polizisten dürfen ihre Fahrzeuge nicht unbeobachtet herum stehen lassen. Dies lockt eventuell Diebe an und der Beamte muss dann evtl. mit einer Disziplinarmaßnahme rechnen!<br/>
					- Das Rammen oder Beschießen von flüchtigen FAHRZEUGEN ist erlaubt, solange das Leben anderer Zivilisten oder das eigene nicht gefährdet ist.<br/>
					- Das Zerstören, nach Sicherstellung, von Fahrzeugen (egal ob illegal oder legal) ist erlaubt sobald einer der folgende Aspekte zu trifft:  Ein Beamter wurde von einem der Insassen getötet, das Fahrzeug war Tatwaffe, Personen von Außerhalb haben dem z.b. flüchtigen Fahrzeug geholfen (durch z.b. Beschuss oder Rammen). Im Zweifel muss ein hochrangiger Polizist (lvl 4+) gefragt werden oder es wird darauf verzichtet. Ein guter Polizist lässt auch mal Fünfe gerade sein, doch bei einem Ifrit überlegt er sich das besser zwei mal.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["regelnfraktionen",
		[
			"Security",
				"
				-Bewerbungen sind auf www.loewenherz-projekt.de im Forum möglich.<br/>
				-Die Loewenherz Security Agency existiert nicht, um Gesetze durchzusetzen, sondern ist eine vom Staat geduldete Sicherheitsfirma, die teilweise kostenfrei oder gegen Bezahlung Personen-/Fahrzeug-/Gebäude-Schutz anbietet .<br/>
				-Security Operator dürfen keinen illegalen/kriminellen Aktivitäten nachgehen.<br/>
				-Security Operator dürfen ihren Status nicht ausnutzen um gewissen Spielern/Gruppierungen/Freunden etc. zu helfen. Sie sind für alle da, nicht für wenige bzw. ein paar Erlauchte.<br/>
				-Security Operator hören auf die Polizei und handeln entsprechend, wenn sie von Beamten dazu aufgefordert werden. Sie dürfen keine Polizisten in ihrer Arbeit behindern oder gar erschießen.<br/>
				-Security Operator können von allen Zivilisten angemietet werden, unter der Bedingung, dass diese nur vollkommen legalen Aktivitäten nachgehen. Z.b. helfen sie nicht bei einem Bankueberfall.<br/>
				-Security Operator haben NIEMALS die Berechtigung einem Zivilisten Waffen oder andere Ausrüstung zu überlassen oder nicht für die Arbeit zugelassenes Equipment mit sich zu führen. Ein Verstoß hat eine Entlassung zur Folge.<br/>
				-Security Operator dürfen alle Arten von Transporten schützen - auch illegale, also z.B. Kokaintransporte. Sie wollen gar nicht wissen was sie transportieren. Wenn die COPs kommen, kann die LSA ihnen dann auch nicht weiter helfen.<br/>
				-Security Operator dürfen ihre Fahrzeuge nicht unbeobachtet herum stehen lassen. Dies lockt eventuell Diebe an und der Mitarbeiter muss evtl. mit einer Disziplinarmaßnahme rechnen!<br/>
				-Die LSA Mitarbeiter sind keine Soeldner! Es sind Sicherheitsbeamte bzw. Bodyguards. Mittels smartphone koennen sie einen SO anfordern.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["regelnfraktionen",
		[
			"Medic",
				"
				-Bewerbungen sind auf www.loewenherz-projekt.de im Forum möglich.<br/>
				-Medics dürfen keine Waffen tragen.<br/>
				-Medics dürfen keinen illegalen/kriminellen Aktivitäten nach gehen.<br/>
				-Medics dürfen ihren Status nicht ausnutzen um gewissen Spielern/Gruppierungen/Freunden etc. zu helfen. Sie sind für alle da, nicht nur für Wenige bzw. ein paar Erlauchte.<br/>
				-Medics sind Dienstleister und dürfen somit weder beklaut, erschossen, entführt, eingeknastet o.ä. werden.<br/>
				-Medics hören auf die Polizei und entfernen sich bzw. handeln entsprechend, wenn sie von den Beamten dazu aufgefordert werden.<br/><br/>
				"
		]
	];