waitUntil {!isServer && !isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["credits","Credits"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Allgemeine Regeln"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];

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

    player createDiaryRecord ["credits",
        [
            "AsYetUntitled",
                "
AsYetUntitled (formerly ArmaLife) is a GitHub project which aims to update and keep adding new features to the original 'Altis Life RPG' by Tonic.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["changelog",
        [
            "Altis Life Changelog",
                "
The full changelog can be found on the AsYetUntitled/Framework repository on GitHub. https://github.com/AsYetUntitled/Framework/<br/><br/>
v4.4 release 3!<br/>
By: danielstuart14<br/>
Date: 31. May 2016<br/><br/>
v4.4 release 2!<br/>
By: danielstuart14<br/>
Date: 20. March 2016<br/><br/>
v4.4 release 1!<br/>
By: danielstuart14<br/>
Date: 12. February 2016<br/><br/>
v4.3 release 4!<br/>
By: danielstuart14<br/>
Date: 31. January 2016<br/><br/>
v4.3 release 3!<br/>
By: danielstuart14<br/>
Date: Not released<br/><br/>
v4.3 release 2!<br/>
By: danielstuart14<br/>
Date: 22. January 2016<br/><br/>
v4.3 release 1!<br/>
By: danielstuart14<br/>
Date: 19. January 2016<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["changelog",
        [
            "Server Change Log",
                "
This section is meant for people doing their own edits to the mission, DO NOT REMOVE THE ABOVE.<br/><br/>
                "
        ]
    ];

        player createDiaryRecord ["serverrules",
        [
            "Exploits",
                "
Folgende Sachen werden direkt mit einem Verweis von dem Server bestraft:<br/><br/>
1. Mit anderen Methoden als mit einem Helikopter aus dem Gefängnis ausbrechen.<br/>
2. Mit Selbstmord aus RP entfliehen.<br/>
3. Geld Glitches werden nicht tolleriert!<br/>
4. Gehackte Items o.Ä sind verboten! <br/>
5. Bugs müssen gemeldet und dürfen nicht zum eigenen Vorteil benutzt werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["safezones",
        [
            "Safe Zones",
                "
In diesen Safe Zonen (Grün markiert) dürfen keine Überfälle o.Ä gestartet werden, es sei denn, eine RP Situation hat ausserhalb gestartet <br/><br/>
Jeder Fahrzeug Spawn, sprich Garagen und Händler<br/>
Jeder Waffenladen<br/>
Alle Polizei HQs<br/>
Rebellen Posten<br/>
Obstplantagen, sowie die Pfandlagerhalle fallen bedingt unter die Safe Zonen.<br/>
Offensichtlich neue Spieler, welche sich nicht verteidigen können, dürfen unter KEINEM Fall überfallen werden ( Ohne Waffe, kleines Fahrzeug etc.)<br/>

                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Banngründe",
                "
1. Hacking<br/>
2. Cheating<br/>
3. Exploiting<br/>
4. Nach 3 Kicks<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Umgang mit Polizei",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Belästigung und Verfolgung von Polizisten ist untersagt und gilt als Trolling.<br/>
2. Polizisten ohne einen RP Grund zu töten gilt als RDM.<br/>
3. Das absichtliche blockieren der polizeilichen Arbeit wird auf Dauer, sofern kein triftiger RP Grund erkennbar ist, als Trolling angesehen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Boote",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Wiederholtes wegdrücken eines Bootes ohne Erlaubnis ist Trolling.<br/>
2. Ein Boot wegzudrücken, um jemanden mutwillig dadurch zu verletzen ist untersagt.<br/>
3. Spieler im Wasser überfahren.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Luftfahrt",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Mutwilliges rammen eines Helikopters in andere Fahrzeuge oder Häuser.<br/>
2. Permanentes über Städte fliegen ohne Grund.<br/>
3. In einen Heli setzen und klauen ohne dem Besitzer eine Chance zum abschließen zu lassen. Rennt der Besitzer weg ohne abgeschlossen zu haben ist der Diebstahl legitimiert.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Fahrzeuge",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Absichtliches überfahren von Spielern (VDM).<br/>
2. Absichtlich vor ein Fahrzeug springen.<br/>
3. Andere Fahrzeuge rammen, bis sie explodieren.<br/>
4. Ständiges Versuchen in ein Fahrzeug einzusteigen ohne die Erlaubnis des Besitzers.<br/>
5. Ein Fahrzeug stehlen nur um es zu zerstören<br/>
6. Mehrere Fahrzeuge kaufen um oben genanntes zu tun.<br/>
7. Schüsse auf ein Fahrzeug NUR um es außer Gefecht zu setzen, nicht zu zerstören.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Kommunikation",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Den Sidechat mit dem Mikrofon benutzen.<br/>
2. Spamming in jeglichen Channeln.<br/>
4. Jede Gruppierung MUSS in ihrem Channel bleiben im TS.<br/>
5. Zivilisten in Polizei Channels dürfen keine Fahrzeuge weitergeben.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Random Deathmatching (RDM)",
                "
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Töten ohne RP Grund<br/>
2. Rebellion heißt nicht, dass man ohne Gründe Spieler tötet.<br/>
3. Polizisten und Zivilisten dürfen sich nur mit kriminieller Grundlage einen Schusswechsel leisten.<br/>
4. Falls man im Kreuzfeuer eines Gefechtes stirbt ist das kein RDM.<br/>
5. Jemanden zum Schutz seines eigenen Wohls oder das jemand anderes umzubringen ist kein RDM.<br/>
6. Einen Spieler auf Grund eines Auftrages zu töten, ist ohne vernünftige RP Grundlage untersagt.<br/><br/>
Das Verfahren kann von Situation zu Situation variieren.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "New Life Regel",
                "
Die New Life Regel gilt nur für Polizisten und Zivilisten.<br/><br/>
Folgende Sachen werden mit einem Bann bestraft.<br/><br/>
1. Erst 15 Minuten nach dem Tod, darf man zurück zum Ort des Todes.<br/>
2. Stirbt man in einer RP Situation, sind alle Verbrechen vergessen, man darf allerdings auch keine Rache mehr ausüben.<br/>
3. Bei RDM tritt die New Life Regel nicht in Kraft.<br/>
4. Respawnt man manuell, ist das kein New Life.<br/>
5. Tötet man sich selbst um aus einer RP Situation zu entfliehen ist das kein New Life.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Spielt fair!",
                "
Sollte ein Admin sagen, dass man sein Verhalten überdenken sollte, hat das einen Grund.<br/><br/>
                "
        ]
    ];

// Police Section
    player createDiaryRecord ["policerules",
        [
            "Krisen Management",
                "
Krisen müssen von einem Polizeichef geregelt werden, ansonsten von dem Ranghöchsten.<br/>
Geiselnahme, Banküberfälle, Besetzungen, Terroristische Anschläge etc. zählen als Krisen. <br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Staatsbank",
                "
1. Das betreten der Staatsbank ist Zivilisten untersagt.<br/>
2. Helikopter, welche über der Staatsbank fliegen, werden gebeten das Gebiet zu verlassen, ansonsten werden sie abgeschossen<br/>
3. Im Falle eines Staatsbanküberfalles, MÜSSEN ALLE Polizisten mobilisiert werden.<br/>
4. Polizisten müssen direkt zu Hilfe eilen.<br/>
5. Waffengebrauch sollte bei einem Bankraub nur als letze Möglichkeit benutzt werden.<br/>
6. Polizisten dürfen nicht blind in die Bank feuern.<br/>
7. Zivilisten müssen aus dem Gebiet evakuiert werden.<br/>
8. Zivilisten welche die Polizei behindern gelten als Komplizen<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Luftfahrt",
                "
1. Es darf nur in einer Stadt gelandet werden, nach Absprache mit der Polizei.<br/>
2. Das landen auf einer Straße ist untersagt.<br/>
3. Die Polizei kann für kurze Zeit das Landen untersagen.<br/>
4. Helikopter dürfen nur mit Genehmigung unter 300 Meter fliegen.<br/>
5. Auch Polizisten dürfen nicht ohne eine aktive Situation über einer Stadt fliegen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Illegale Gebiete",
                "
1. Gang Verstecke dürfen von Polizisten untersucht werden, jedoch darf niemand festgenommen werden, solange kein Straftatbestand vorhanden ist.<br/>
2. Illegale Gebiete dürfen nicht ohne eine angekündigte Razzia betreten werden.<br/>
3. Sollte man jemanden in ein illegales Gebiet verfolgen, ist Unterstützung anzufordern.<br/>
4. Es ist untersagt, dass Polizisten an illegalen Gebieten campen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Patrouillen",
                "
1. Polizisten dürfen Straßen und Städte abfahren um illegale Aktivitäten oder verlassene Fahrzeuge aufzudecken.<br/>
2. Innerhalb von Städten kann man diese zu Fuß machen außerhalb .<br/>
3. Illegale Gebiete sind davon ausgeschlossen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Straßenkontrollen",
                "
Polizisten dürfen zur allgemeinen Sicherheit Straßensperren errichten.<br/><br/>
1.Eine Straßensperre muss aus mindestens 2 Polizisten und 2 Fahrzeugen bestehen.<br/>
2. Straßensperren dürfen nicht näher als 300 Meter von einem illegalen Gebiet erreichtet werden.<br/>
3. Straßen dürfen im Gegensatz zu Kreuzungen gesperrt werden.<br/>
4. Straßensperren müssen nicht auf der Karte makiert werden.<br/><br/>
Straßensperren Vorgehen:<br/>
1. Den Fahrer in einem sicheren Abstand zum anhalten bringen.<br/>
2. Die Mitfahrer fragen, ob sie Waffen haben.<br/>
3. Die Mitfahrer bitten, aus dem Fahrzeug auszusteigen.<br/>
4. Nach Herkunft und Ziel fragen.<br/>
5. Fragen ob sie etwas gegen eine Durchsuchung haben.<br/>
6. Sollten sie zustimmen, fesseln und durchsuchen.<br/>
7. Sollten sie nicht zustimmen muss man sie gehen lassen, sofern kein Verdacht auf illegales im Raum steht.<br/>
8. Nachdem die Durchsuchung vollendet ist, können sie wieder in ihr Fahrzeug steigen.<br/>
9. Beim Fund illegaler Sachen, ist ein Strafgeld und evtl. eine Verhaftung angebracht.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Fahrzeuge",
                "
1. Ordnungsgemäß geparkte Fahrzeuge sollten in Ruhe gelassen werden.<br/>
2. Fahrzeuge die unbenutzt, zerstört oder verlassen sind, dürfen beschlagnahmt werden.<br/>
3. Boote sollten am Hafen geparkt werden.<br/>
4. Fahrzeuge die in einer bestimmten Zeit nicht bewegt wurden, können beschlagnahmt werden.<br/>
5. Beschlagnahmen von Fahrzeugen ist wichtig für die Polizisten und dient zur Serverleistung.<br/>
6. Der Besitzer sollte immer informiert werden, bevor das Fahrzeug abgeschleppt wird.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Geschwindigkeiten",
                "
Altis Geschwindigkeiten:<br/><br/>
In Hauptstädten:<br/>
Kleine Straßen: 50km/h<br/>
Hauptstraßen: 65km/h<br/>
Außerhalb von Hauptstädten:<br/>
Kleine Straßen: 80km/h<br/>
Hauptstraßen: 110km/h<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Stadt Protokoll",
                "
1. Hauptstädte werden abgelaufen.<br/>
2. Der Autohändler sollte auf abschleppbare Autos überprüft werden.<br/>
3. Polizisten sollten nicht nur rumstehen oder sich nur in der Zentrale einer Stadt aufhalten.<br/>
4. Polizisten können in eine Stadt einmarschieren, sollte rebellische Aktivität vorhanden sein.<br/>
5. Das Gesetz muss nicht gerechtfertigt werden.<br/>
6. Polizei HQs sind illegal für alle Zivilisten.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Verhaftungen und Strafgeld",
                "
Verhaftungen sollten zur Verschließung solcher dienen, welche sich selbst oder Andere gefährden.<br/><br/>
1. Ist ein Ticket bezahlt, darf man nicht zusätzlich verhaftet werden.<br/>
2. Man muss dem Verdächtigen sagen, warum er verhaftet wird..<br/>
3. Ist ein Zivilist gesucht, ist die Tötung zu vermeiden.<br/><br/>
Tickets dienen zur Warnung.<br/><br/>
1. Sie sollten einen nachvollziehbaren Preis haben.<br/>
2. Ticktes sollten nach eigenem Ermessen berechnet werden.<br/>
3. Ablehnen eines Tickets kann ein Grund für eine Freiheitsstrafe sein.<br/>
4. Ein nicht angemessener Preis des Tickets ist ein Grund zur Suspendierung.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Waffen",
                "
Ein Polizist darf in keinem Fall Zivilisten mit Waffen versorgen.  Sollte das bekannt werden, ist das ein Banngrund.<br/><br/>
Legale Waffen:<br/>
1. P07<br/>
2. Rook<br/>
3. ACP-C2<br/>
4. Zubr<br/>
5. 4-five<br/>
6. Und alle im Waffenladen<br/><br/>
Alles andere ist illegal.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Nicht scharfe Munition",
                "
Der Taser ist die einzige Möglichkeit nicht scharf zu schießen.<br/><br/>
1. Der Taser sollte zur Lähmung von Verbrechern dienen.<br/>
2. Anderweitige Benutzung des Tasers ist untersagt.<br/>
3. Taser wird nur unter Beachtung der Regeln benutzt.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Raiding/Camping",
                "
Raiding ist eine EInwanderung der Polizisten in ein illegales Gebiet um kriminelle Aktivitäten aufzudecken und zu bekämpfen.<br/><br/>
1. Um einen Raid durchzuführen müssen mindestens 4 Polizisten involviert sein, wovon einer den Kommisar Status erreicht haben muss.<br/>
2. Alle Zivilisten in einem Gebiet, welches durchsucht wird, sind zu fesseln und zu durchsuchen. Wird nichts gefunden sind sie freizulassen.<br/>
3. Beim Fund illegaler Sachen ist eine Anklage durchzuführen.<br/>
5. Nicht scharfer Waffengebrauch ist oben definiert.<br/>
6. Ist das Gebiet gesichert haben die Polizeisten das Gebiet zu räumen.<br/>
7. Nach einem Raid steht das Gebiet unter 20 Minuten Raid Schutz.<br/>
8. Diese Regel gilt auch nach einem fehlgeschlagenem Raid.<br/>
9.Unterstützung kann angefordert werden, gestorbene Polizisten sind davon jedoch ausgeschlossen.<br/><br/>
Camping ist als langes Warten in einem Bereich definiert.<br/><br/>
1. Straßensperren gelten nicht als Camping (Auch der Grenzposten).<br/>
2. Die Bank darf nicht ständig bewacht werden.<br/>
3. Nach einem Raid darf das Gebiet nicht länger bewacht werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Rangfolge",
                "
Polizeiliche Rangfolge:<br/>
1. Chef<br/>
2. Stellv. Chef<br/>
3. Ausbilder SEK<br/>
4. SEK<br/>
5. Zoll<br/>
6. Komissar<br/>
7. Polizei<br/>
8. Stadtpolizei<br/>
9. Anwärter<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Scharfe Munition",
                "
1. Scharfe Munition darf nur zur Verteidigung des eigenen Lebens oder das eines Anderen verwendet werden<br/>
2. Abfeuern von scharfer Munition ohne Genehmigung führt zur Suspendierung.<br/>
3. Das falsche Benutzen von Waffen führt ebenfalls zur Suspendierung.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "TeamSpeak Regel",
                "
1. Alle Polizisten müssen im Teamspeak in den vorhergesehen Channeln sein, ansonsten werden sie aus dem Spiel entfehrnt.<br/>
2. Teamspeak sollte erst vor dem joinen auf den Server betreten werden.<br/><br/>
                "
        ]
    ];

// Illegal Items Section
    player createDiaryRecord ["illegalitems",
        [
            "Rebelllen Regeln",
				"
1. Eine Gang ist Vorraussetzung eines Rebellendaseins.<br/>
2. Widerstand ist keine Rechtfertigung für RDM.<br/>
3.Rebellen RP sollte mehr als nur Überfälle und Bankraub sein.<br/>
4. Widerstand sollte dennoch koordiniert sein.<br/>
5. Ein guter Grund muss hinter jedem Handeln stehen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["illegalitems",
        [
            "Gang Regeln",
                "
1. Mitglied eienr Gang zu sein, ist nicht illegal, solange diese nicht mit illegalen Aktivitäten in Verbindung gebracht wird.<br/>
2. Der Aufenthalt in einem Ganggebiet ist nicht illegal, solange nichts illegales gemacht wird.<br/>
3. Gangs können Gangverstecke einnehmen, verteidigen und kämpfen.<br/>
4. Gangs können Kriege führe, welche allerdings im Side angekündigt werden müssen und beidseitig bestätigt werden.<br/>
5. Gangs dürfen keine Zivilisten in Ganggebieten töten, es sei denn sie gehören einer verfeindeten Gang an.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["illegalitems",
        [
            "Illegalle Fahrzeuge",
                "
Der Besitz folgender Fahrzeuge ist illegal:<br/><br/>
1. Ifrit<br/>
2. Quillin<br/>
3. Bewaffneter Offroad<br/>
4. Polizei Fahrzeuge<br/>
Bei Terror Aktionen wie Geiselnahme, Banküberfall und Besetzung ist es den Polizisten erlaubt, bei gewonnenem Kampf alle illegalen Fahrzeuge zu sprengen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["illegalitems",
        [
            "Illegale Waffen",
                "
Folgenede Waffen sind illegal:<br/><br/>
1. MX Series<br/>
2. Katiba Series<br/>
3. TRG Series<br/>
4. Mk.200 Series<br/>
5. Mk.18 ABR<br/>
6. SDAR Rifle<br/>
7. Sting SMG<br/>
8. Silenced P07 (Taser)<br/>
9. Explosives<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["illegalitems",
        [
            "Illegae Items",
                "
Folgende Items sind illegal:<br/><br/>
1. Schildkröten<br/>
2. Kokain<br/>
3. Heroin<br/>
4. Cannabis<br/>
5. Marijuana<br/><br/>
                "
        ]
    ];

// Controls Section

    player createDiaryRecord ["controls",
        [
            "Polizei und Medic Steuerung",
                "
F: Sirene.<br/>
L: Speed radar (police only and weapon is P07 Suppressed).<br/>
Left Shift + L: Sirenen Licht.<br/>
Left Shift + R: Restrain Polizei.<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["controls",
        [
            "Zivilisten Steuerung",
                "
Left Shift + G: Knock out / stun (Waffe benötigt, dient zum ausrauben).<br/>
Spacebar: Lagerbox setzen.<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["controls",
        [
            "Generelle Steuerung",
                "
Z: Player Menu.<br/>
U: Auf und Abschließen von Fahrzeugen und Häusern.<br/>
T: Kofferraum und Hauslager.<br/>
Left Shift + B: Hände über dem Kopf<br/>
Left Windows: Hauptinteraktion.<br/>
Left Shift + H: Waffe holstern<br/>
Left Ctrl + H: Waffe entholstern<br/>
Shift + Spacebar: Springen.<br/>
Left Shift + O: Ohrenstöpsel<br/><br/>
                "
        ]
    ];
