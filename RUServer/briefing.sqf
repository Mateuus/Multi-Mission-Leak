waitUntil {!isServer && !isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

//player createDiarySubject ["credits","Credits"];
player createDiarySubject ["changelog","Change Log"];
//player createDiarySubject ["serverrules","Allgemein"];
//player createDiarySubject ["policerules","Polizeiregeln"];
//player createDiarySubject ["gangs","Gangs"];
player createDiarySubject ["Feuerwehr","Feuerwehrreggeln"];
//player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
//player createDiarySubject ["gangrules","Gang Regeln"];
//player createDiarySubject ["terrorrules","Rebllelregeln"];
//player createDiarySubject ["controls","Steuerrung"];
player createDiarySubject ["Preise","Preise"];
player createDiarySubject ["Jobangebote","Berufe"];

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

/*    player createDiaryRecord ["changelog",
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
*/

    player createDiaryRecord ["changelog",
        [
            "Server Change Log",
                "
ChangeLog#1 Farm Erträge geändert<br/>
ChangeLog#2 Häuserlimit runtergesetzt<br/>
ChangeLog#3 Häuserpreise angepasst<br/>
ChangeLog#4 Fahrzeugpreise angepasst<br/>
ChangeLog#5 Ausparkpreise angepasst<br/>
ChangeLog#6 T-Inventar bei Fahrzeugen angeglichen<br/>
ChangeLog#7 Neue Werte von Farmitems<br/>
<br/>
ChangeLog#8 Ausparkpreise angepasst<br/>
ChangeLog#9 Farm Erträge angepasst<br/>
<br/>
MapFix#1 Markergröße überall angepasst<br/>
MapFix#2 unnötige Marker entfernt<br/>
MapFix#3 Anpassung von Teilen der Map<br/>
MapFix#4 Entfernung nördlicher Wilderei für Schildkröten<br/>
MapFix#5 bestimmte Objekte wurden versetzt<br/>
MapFix#6 Airfield fix<br/>
MapFix#7 Krankenhaus innerhalb von Georgetown umgezogen<br/>

                "
        ]
    ];

	player createDiaryRecord ["serverrules",
        [
            "Exploits",
                "
Folgende Aktivitäten sind Exploits und werden mit einem Bann bestraft!:<br/><br/>
1. Flucht aus dem Gefängnis nur durch (Freikauf) oder Helikopterflucht.<br/>
2. Es darf kein Selbstmord begangen werden um sich einem laufenden Rollenspiel zu entziehen.<br/>
3. Duplizieren von Gegenständen und Währung. Solltest du eine hohe Geldsumme erhalten benachrichtige einen Admin und überweise ihm das Geld.<br/>
4. Nutzen von gehackten Items. Benutze diese nicht und melde dies einem Admin.<br/>
5. Ausnutzen von nicht gewollten Spielmechaniken, Bugs und Glitches zum Vorteil. Hierbei treten Punkt 1, 3 und 4 in Kraft.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Bannbare Vergehen",
                "
Hacking,Cheating,Explots,Trolling,Fremdwerbung,Nicht einhalten der Serverregeln,Stimmenverzerrer,Diskriminierungen,Duping;Versuchste Duping(Gegenseitiges Nieren rausschneiden und verkaufen. <br/>
Waffenhandel zwischen Spielern Ausgenommen innerhalb der Gang<br/>
Blind durch eine Wand schießen,Unangebrachtes Verhalten und schwere Kraftausdrücke <br/>
Spielern eine wissentlich falsche Auskunft geben mit dem Zweck dem
anderen zu Schaden (z.B.: ALT+F4 als Anwort auf die Frage einer
Tastenfunktion).<br/>
Das Handeln mit Echtgeld gegen Spielgeld oder anderen Wertgegenständen ist verboten.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Random Deathmatch (RDM)",
                "
Es liegt im Ermessen eines Admins wie hoch
die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit
schützt nicht vor Strafe!<br/><br/>
1. Jemanden ohne RP-Grund töten ist verboten! ('Überfall Überfall' rufen und dann direkt schießen ist KEIN RP!)<br/>
2. Eine Rebellion ist kein Grund alles und jeden zu töten. (Hinter einer Rebellion steht immer ein Grund)<br/>
3. Cops und Zivilisten dürfen nur eine Schießerei anzetteln, wenn ein Verbrechen die Grundlage ist.<br/>
4. Wenn du im Kreuzfeuer einer Schießerei getötet wirst, ist das kein RDM.<br/>
5. Jemanden töten um sich und andere gegen eine offensichtliche Bedrohung zu schützen ist kein RDM. z.B.: Wenn jemand
anderes RDM betreibt.<br/>
6. Jemanden erschießen ohne ihm eine ausreichende Reaktionszeit zu gewähren (z.B bei einem Überfall) ist RDM.<br/>
7. Wenn ein Helikopter über einer Kampfzone Schwebeflug macht, müssen Warnschüsse auf ihn abgegeben werden.
Jemanden im Helikopter ohne Warnschüsse zu töten ist RDM.
Außer es ist eindeutig, dass es ein feindlicher Helikopter ist. (z.B. jemand vom Feind ist ausgestiegen)<br/>
8. Jemanden erschießen, wenn er verhaftet ist, ist RDM, auch wenn ein RP
läuft. (Geiselnehmer dürfen ihre Geilsel erschießen, wenn es notwendig ist.)<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "New Life Regel / NLR)",
                "
Es liegt im Ermessen eines Admins wie hoch
die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit
schützt nicht vor Strafe!<br/><br/>
1. Nach deinem Tod, darfst du 15 Minuten lang nicht in die Nähe des Todesorts kommen! Mindestens 2 KM Abstand halten.<br/>
2. Nach den 15 Minuten darfst du den Punkt deines Todes betreten, aber nicht in das RP
wieder eingreifen.<br/>
3. Dies bedeutet, dass du zu keiner Zeit, auch nicht nach dem Wiederbeleben an dem RP
teilnehmen kannst, bei welchen du gestorben bist.<br/>
4. Bei einem Tod sind deine Vergehen vergessen, andernfalls darfst du
aber auch keine Rache ausüben. (Du erinnerst dich sozusagen an nichts
was passiert ist)<br/>
5. Solltest du deinem Mörder nach 15 Minuten oder außerhalb der 2 KM wieder antreffen, kannst du ein neues RP
mit ihm starten.<br/>
6. Wenn du Opfer von RDM wirst, gilt die NLR nicht.<br/>
7. Wenn du dich mit Absicht selbst tötest und respawnst gilt die NLR nicht. (Punkt 2 der Exploits beachten!)<br/>
8. Sollte ein Polizist in Georgetown sterben, darf er in Georgetownspawnen.
Dieser darf sich nur am Marktplatz aufhalten und darf
diesen auf KEINEN FALL vor den 15 Minuten verlassen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Safezones",
                "
Es liegt im Ermessen eines Admins wie hoch
die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit
schützt nicht vor Strafe!<br/><br/>
Orte die mit einer Safezone versehen sind: (Auch mit einem grünen/weißen Kreis auf der Karte markiert)<br/>
Fahrzeugsspawns (Garagen und Shops),Waffenshops,Rebellen Stützpunkte,Bankautomaten,Umkreis 20m,Weitere spezielle Bereiche (markiert)<br/>
1. Marktplätz in Georgetown ist eine absolute
Safezone. Zivilisten dürfen hier keine Straftaten begehen. Polizei wird
bei einem Regelbruch sofort eingreifen.<br/>
2. Die Polizei HQs in Georgetown und am Airport sind absolute Safezonen.
Bedeutet, dass sowohl keine Verfolgung von Polizisten in diese
stattfinden darf, als auch kein Beschuss dieser Zonen oder innerhalb
dieser Zonen stattfinden darf. Die Polizei darf bei Straftaten
eingreifen. Polizisten dürfen jedoch nicht von innen nach außen
schießen. (Sprich: Aus dem HQ heraus)<br/>
3. Andere Polizeireviere sind davon nicht betroffen.<br/>
4. Die grünen Safezonen gelten für die Zivilisten untereinander. Ein
Zivilist darf mit einem Polizisten in diesen Safezonen im Rahmen des RP
interagieren.<br/>
5. Die Rebellenaußenposten sind Rebellenstandorte. Polizisten dürfen
dort keine Streife vollführen. Für Rebellen untereinander ist es eine
absolute Safezone.<br/>
6. Safezones retten euch nicht vor einem RP, wenn das RP
außerhalb gestartet wurde ist die Safezone für die RP
Beteiligten ausgeschaltet.<br/>
7. Spieler dürfen sich nicht länger als 10 Minuten in einem Radius von
250m um die Polizei HQ`s aufhalten, wenn sie bewaffnet
sind. Das becampen und belagern von den Polizei HQ`s Georgetown und Airport
ist verboten.<br/>
8. Hat sich ein Polizeibeamter in die Safezone der HQs geflüchtet,
dann darf er nicht wieder an einem außerhalb
laufenden Feuergefecht teilnehmen, dass vor seiner Flucht gestartet
wurde.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Kommunikation",
                "
Es liegt im Ermessen eines Admins wie hoch
die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br/>
1. Der Sidechat darf nicht als Voicechat benutzt werden. Nur der schriftliche
Chat ist im Sidechat erlaubt. Hierbei gilt jedoch die OOC (Out of
Charakter) Regel. Es darf keine Information über das Spielgeschehen
weitergegeben werden, sofern dies ein Vorteil bzw. Nachteil darstellen
kann.<br/>
2. Spamming in jegliche Channels ist verboten!<br/>
3. Der Teamspeak ist nicht ohne Grund in verschiedene Channel unterteilt! Polizisten bleiben in ihrem Channel!<br/>
4. Zivilisten dürfen nicht in den Channel der Cops kommen und deren
Bewegungen und Aktivitäten abhören. Werdet ihr erwischt werdet ihr aus
dem Channel entfernt. Wiederholtes Vergehen resultiert mit der
Entfernung aus dem Spiel und dem TS.<br/>
5. Kommunikation darf man als Zivilist jemanden nur abnehmen, wenn man ihn als Geisel nehmen möchte.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Roplay",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br/>
- ROLEPLAY wird bei uns groß geschrieben und ein Rollenspielverhalten wird von jedem Spieler erwartet!<br/>
- Dies beinhaltet, dass man sich eine Figur mit Rolle, Charakter und Geschichte ausdenkt und diesen gewissenhaft nachgeht!<br/>
- Das eigene und das Leben anderer sollte demnach weitgehend verschont bleiben!<br/>
1. In ein laufendes RP darf sich EINE weitere zivile Partei einmischen.Diese Partei muss vor dem einstieg ins Gefecht angekündingt werden<br/>
2. Wenn ein Feuergefecht im Rahmen des RP 10 Minuten lang unterbrochen wurde,muss das RP (im Hinblick auf das Feuergefecht) neu gestartet werden.<br/>
3. Der Start eines Rollenspiels wird durch eine deutliche Mitteilung durch direkte Kommunikation (Sprache oder Schrift) oder durch eine SMS definiert.<br/>
4. Wenn man vor einem Restart in Gewahrsam der Polizei ist, muss man sich nach dem Restart im HQ stellen.<br/>
5. Informationen, welche man durch das Teamspeak und/oder Stream erhält, dürfen nicht benutzt werden.<br/>
6. Die Sirene (F) der Polizei ist keine RP Eröffnung!<br/>
7. Die Warnsirene (Ö) eröffnet ein RP!<br/>
8. Es sollte jedem die Möglichkeit gegeben werden, sein Leben mittels Rollenspiel zu retten!<br/>
9. Die Tötung eines Spielers sollte dabei der letzte Ausweg sein!<br/>
10. Jeder sollte sich die Zeit nehmen und nachdenken, was er dem Gegenüber mitteilen möchte.<br/>
11. Aussagen wie die Folgenen werden hier nicht geduldet. Dies sind lediglich Beispiele.<br/>
11.1 'Anhalten/stehen bleiben sonst Tod'<br/>
11.2 'Überfall' rufen, dann jemanden niederschlagen und ausrauben.<br/>
12. Wer meint, kein anständiges RP zu führen,bekommt einen Bann.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Bundesbank:",
                "
1. Zivilisten dürfen das Gelände der Zentralbank nicht betreten, solangesie nicht die Erlaubnis dafür haben. Wenn sie dies ohne Erlaubnis tun, müssen sie aus dem Gebiet eskortiert oder festgenommen werden.<br/><br/>
2. Helikopter, die über der Zentralbank fliegen, können gezwungen werden, das Gebiet zu verlassen. Bei Verweigerung dürfen sie ausgeschaltet werden.<br/>
3. Wenn die Zentralbank ausgeraubt wird, müssen alle polizeilichen Kräfte mobilisiert werden, um den Raub zu stoppen.<br/>
4. Ausnahme für Punkt 3 bietet hierbei die Geiselnahme. Hier muss mindestens die Hälfte aller polizeilichen Kräfte mobilisiert werden<br/>
5. Nahebefindliche Polizisten werden verpflichtet Unterstützung zu leisten. Niedere Verbrechen können bei einem Bankraub zur Akte gelegt werden. Straftäter sind frei zu lassen.<br/>
6. Tödliche Gewalt kann auf die Bankräuber angewendet werden, wenn es keine Alternative gibt. Jede Möglichkeit zu Tasern oder der Festnahme sollte die erste Wahl sein!<br/>
7. Polizisten dürfen nicht blind in das Gebäude feuern.<br/>
8. Zivilisten müssen aus dem Gebiet evakuiert werden.<br/>
9. Jeder Zivilist der die Polizisten bei der Gefahrenvermeidung blockiert, kann als Komplize der Bankräuber angesehen werden.<br/>
10. Hochrangige Polizisten dürfen Zivilisten als Wachmänner rekrutieren um die Bank zu beschützen.<br/>
11. Polizisten dürfen beim Bundesbankraub alle Fahrzeuge die im Gebiet oder in der Nähe stehen beschlagnahmen. Auch im RP.<br/>
12. Zivilisten die auf dem Gelände der Bundesbank sind werden als Feindlich angesehen. (Bei aktiven Bundesbankraub)<br/>
13. Mit Zivilisten die sich bewaffnet im Umkreis der Bank befinden müssen mit bekämpfung rechnen.<br/>
14. Wenn der Bundesbankraub gestartet wurde, darf die Polizei nicht umloggen um an der Bundesbank teilzunehmen. Polizisten haben Land- und Luftfahrzeuge um zu diesem Einsatz zu kommen.<br/>
15. Das starten der Bundesbank ohne den Hintergrund diese ernsthaft Auszurauben ist verboten!<br/><br/>
				"
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Boote",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br/>
1. Wiederholtes Pushing von Booten ohne Erlaubnis und/oder um jemanden zu töten. (Kein RP)<br/>
2. Taucher oder Schwimmer mit Absicht überfahren. (RDM)<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Luftfahrt",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br/>
1. Mit Absicht in irgendwas hereinrammen um eine Explosion herbeizuführen.<br/><br/>
2. Ein RP mit einem Helikopter kann nur per SMS gestartet werden.<br/>
3. Stehlen von Helikoptern, wenn der Besitzer nicht ausreichend Zeit hatte, um abzuschließen ist verboten. Wenn jemand landet, nicht abschließt und sich entfernt, ist er selbst Schuld, wenn ihr aber direktnach dem Landen einsteigt ohne dem Piloten eine Chance zu geben abzuschließen, ist dies ein Regelbruch. <br/>
4. Helikopter dürfen nicht auf Straßen landen.<br/>
5. Angehängte Fahrzeuge dürfen nicht als Wurfgeschoss, Ramme oder Waffe benutzt werden. Nur der Transport ist erlaubt.<br/>
Folgendes wird vom Bußgeld Katalog der Polizei geregelt. (Kein Regelbruch aber Illegal)<br/>
6. Unter 300m Höhe über eine Stadt fliegen. (Illegal & erhöhtes Risiko eines Crashs > Lebensgefahr auch für Mitspieler)<br/>
7. Helikopter dürfen nicht über einer Stadt fliegen. Nur Polizisten dürfen dies, wenn eine Polizei-Operation im Gange ist.<br/>
8. Polizisten dürfen jegliche Landeanflüge der Zivilisten für eine kurze Zeitspanne verbieten.<br/>
9. In Georgetown darf kein Helikopter ohne Erlaubnis der Polizei landen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Fahrzeuge",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/>
1. Mit dem Fahrzeug darf man zu keiner Zeit jemanden überfahren. Unfälle entbinden keinen von der Regel.<br/>
2. Mit Absicht vor ein Fahrzeug springen um zu sterben.<br/>
3. In andere Fahrzeuge rammen um eine Explosion zu provozieren.<br/>
4. Andauernd versuchen in fremde Fahrzeuge einzusteigen um diese zu klauen.<br/>
5. Fahrzeuge klauen um Schaden anzurichten.<br/>
6. Mehrere Fahrzeuge auf einmal kaufen um Explosionen zu verursachen.<br/>
7. Die EINZIGEN Gründe, auf ein Fahrzeug zu schießen: Reifen zerschießen oder fahrunfähig machen. Zerstöre nicht vorsätzlich andere Fahrzeuge! (Personen im Fahrzeug dürfen beschossen werden.)<br/>
8. Stehlen von Fahrzeugen aller Art, wenn der Besitzer nicht ausreichend Zeit hatte, um abzuschließen. Wenn jemand aussteigt, nicht abschließt und sich vom Fahrzeug entfernt, ist er selber Schuld, wenn ihr aber direkt nach dem der Fahrer ausgestiegen ist, einsteigt ohne ihm eine Chance zu geben abzuschließen, ist dies ein Regelbruch.<br/>
9. Alle Einsatzfahrzeuge müssen sich am Georgetown Markt an die Geschwindigkeitsbeschränkung von 50km/h halten. Einzige Ausnahme ist die Polizei,wenn sie aktiv ein Fahrzeug verfolgen. (Sirene muss Aktiv sein)<br/>
10. Ein RP zwischen Fahrzeugen kann nur mit dem Smartphone (SMS) gestartet werden.<br/>
11. Fahrzeuge während eines RPs einzuparken ist RP Flucht. (Dazu gehören auch Helikopter)<br/>
12. Fahrzeuge dürfen während eines RPs nicht mit dem Helikopter weggeflogen werden.<br/>
13. Die folgenden Geschwindigkeitsbeschränkungen sollten von der Polizei, zur Sicherheit aller, durchgesetzt werden.<br/>
In größeren Städten: Maximal 50 km/h<br/>
Außerhalb der größeren Städte: Maximal 120 km/h<br/><br/>
                "
        ]
    ];

// Police Section
    player createDiaryRecord ["policerules",
        [
            "Verhalten bei Verbrechen",
                "
Egal bei welchem Verbechen hat der Polizist mit dem höchsten rang vor Ort das Sagen!<br/>
Im Falle das die Bundeszentralbank ausgeraubt wird haben sich alle Polizisten zu Versammeln und  die EZL managed den Einsatz.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["serverrules",
        [
            "Verbotene Fahrzeuge:",
                "
Das führen folgender Fahrzeuge ist für Zivilisten illegal:<br>
Hunter,Polizeifahrzeuge,Hellcat,Ghosthawk,Mi-48 kKajman,Strider,Ifrit,AH-99 Blackfoot,Prowler,Qlin<br/>
<br/>
Das führen folgender Waffen für Zivillisten ist illegal:
1. Alle Handfeuerwaffen und die PDW sind LEGAL!<br/>
2. Die 4-Five und alle anderen Waffen sind ILLEGAL!<br/>
3. Zivilisten dürfen Waffen nicht offen in der Stadt tragen. (In den Rucksack stecken oder holstern)<br/>
4. Außerhalb von Städten dürfen Zivilisten legale Waffen offen tragen,müssen aber jederzeit einer Durchsuchung durch die Polizei rechnen.Die Waffe sollte in der Gegenwart von Polizisten gesenkt sein (2x Strg)<br/>
<br/>
Das führen folgender Substanzen/Gegenstände für TZivillisten ist verboten<br>
- Schildkröten,- Kokain,- Heroin,- Marijuana,- Bolzenschneider,- Sprengladung, Bank Gold,- Nagelband/Stacheldraht,- Dietrich<br/><br>
           "
        ]
    ];

    player createDiaryRecord ["gangs",
        [
            "Allgemeine Gangregeln",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br>
1. Jedes Gangmitglied einer Gang muss einen Gangtag vor seinem Namen tragen.<br/>
2. Gangmitglieder ohne Gangtag dürfen nicht an RPs der Gang teilnehmen.<br/>
3. Wenn zwei oder mehrere Gangs zusammenarbeiten, muss es dem Gegenüber (Feind) mitgeteilt werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["gangs",
        [
            "Gangkrieg",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/>
1. Jede Gang darf einen Gangkrieg ausführen<br/>
2. Es darf nur gegen eine andere Gang Krieg geführt werden.<br/>
3. Andere Gangs dürfen sich nicht einmischen.<br/>
4. Beide Gangs müssen mit diesem Krieg einverstanden sein.<br/>
5. Es darf niemand in der Safezone erschossen werden, außer es wurde vorher ein RP gestartet.
Der Gangkrieg zählt hierbei nicht als RP Start.<br/>
6. Gangkriege dürfen maximal 24 Stunden andauern.<br/>
7. Gangkriege müssen im Forum in den vorgesehenen Thema angekündigt werden.<br/>
8. Zu Punkt 7 müssen abgesprochene Regeln niedergeschrieben werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["terrorrules",
        [
            "Rebellen Regeln",
                "
Ein Rebell ist jemand, der einen bewaffneten Widerstand gegen die Regierung führt.
In unserem Falle ist die Regierung die Polizei. Durch die Unterzahl der Polizei im Gegensatz
zu den möglichen Rebellen, sollte NIEMALS ohne Grund auf die Polizisten
geschossen werden. Bitte seid zivilisiert und benutzt den allgemeinen
Menschenverstand bei euren Aktionen. Nehmt das Wort Rebellen nicht zu
wörtlich, es soll schließlich Spaß für alle bringen.<br/>
1. Rebellen benötigen eine Gruppierung, diese muss ihre Intentionen gegenüber der Polizei klar äußern.<br/>
2. Widerstand ist keine Entschuldigung für RDM (Siehe 'Random Deathmatch ( RDM )')<br/>
3. Widerstand bedeutet mehr als nur Bankraub und Polizistenmord.<br/>
4. Der Widerstand muss Organisiert sein.<br/>
5. Hinter jedem Angriff, Übergriff und jeder Aktion muss ein Grund stehen.<br/>
6. Rebellenkleidung zu tragen ist innerhalb von Georgetown verboten. (Westen und Helme gehören dazu)<br/>
7. Es ist nicht illegal in einer Gang zu sein, solange nichts illegales gemacht wird.<br/>
8. Eine Stadtübernahme in Georgetown ist verboten.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Polizeiinteraktionen",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/><br/>
1. Zivilisten können festgenommen werden, wenn diese einem Polizisten folgen, um deren Position zu verraten.<br/>
2. Folgen oder Belästigen von Polizisten über einen längeren Zeitraum wird als Trolling angesehen. (Bannbare Vergehen Punkt 4)<br/>
3. Aktives Behindern von Polizisten kann in einer Festnahme resultieren.<br/>
<br/>
Combatlog:<br/>
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens
ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/>
1. Das Spiel beenden ohne die 20 Sekunden Auslogzeit abzuwarten ist Combatlog.<br/>
2. Das Spiel während des Todes zu beenden ist Combatlog.<br/>
3. Drückt man Alt + F4 um das Spiel zu beenden ist es Combatlogging.<br/>
4. Nutzt man Punkt 3 in einem RP um die Waffe verschwinden zulassen, darf die Polizei euch Illegalen Waffenbesitz anrechnen.<br/>
5. Wenn man tot ist darf man das Spiel nicht schließen, ansonsten ist es Combatlog.<br/>
6. Wenn man Verhaftet ist darf man das Spiel nicht schließen, ansonsten ist es Combatlog.<br/>
7. Solltet ihr denken ihr seit unschuldig und wollt euer Geld wieder, müsst ihr ein Beweisvideo vorlegen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Allgemeine Polizeiregeln",
                "
Es liegt im Ermessen der Direktion wie hochdie Strafe eines Vergehens ausfällt! Dabei kann eine Degradierung, eineVerwarnung, aber in seltenen Fällen auch ein Bann in Frage kommen.
Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/>
1. Anweisungen von Ranghöheren ist folge zu leisten!<br/>
2. Alle die als Polizist spielen, müssen im Teamspeak im dafür vorgesehenen Channel sein.<br/>
3. Bitte logge dich im Teamspeak ein bevor du dich Ingame als Polizist einloggst. (Erst TS, dann ArmA)<br/>
4. Jeder muss einen Verbandskasten und mindestens zwei Werkzeugskästen mit sich führen.<br/>
5. Ein Polizist darf einem Zivilisten keine Waffen oder andere Polizeiausrüstungs Gegenstände geben.<br/>
6. Als Polizist muss das Gangtag entfernt werden!<br/>
7. Spawnt man mit Soldaten Equipment, muss man sich sofort umbringen oder man lässt sich umbringen! Nutzung oder Aufbewahrung = Bugusing!<br/>
8. Jeder Polizist ist aufgefordert die Regeln zu kennen und sich an diese zu halten.<br/>
9. Jeder Notruf muss von der EZ beantwortet werden und auf der Karte markiert werden, kurze Meldungen dürfen auch direkt von der Streife vor Ort angenommen werden.<br/>
10. Im Teamspeak sollte man sich vernünftig benehmen und auf die Lautstärke im Channel achten, besonders bei einem Einsatz.<br/>
11. Bei Dienstbeginn/-schluss immer im Teamspeak an- und abmelden, zu dem zusätzlich bei der EZ im Spiel an- und abmelden.<br/>
12. AFK im Dienst ist nicht erlaubt! Eine kurze Abmeldung für ca. 5 Minuten bei der EZ ist erlaubt. (Bei über 5 Minuten aus dem Spiel ausloggen!)<br/>
13. Achte auf dein Verhalten im Spiel und im Teamspeak gegenüber deinen Kollegen/-innen.<br/>
14. Es ist Pflicht der Polizei, der Feuerwehr mitzuteilen wenn ein RP beendet ist.<br/>
15. In Polizei HQ´s darf weder rumgeschossen noch sich untereinander getasert werden! Dies gilt auch für andere Orte!<br/>
16. Der Verkauf von Polizeiequipment ist verboten.<br/>
17. Im Gruppenfunk darf nur die EZ und die SL (Streifenleiter) funken! (EZ & SL im TS dazuschreiben)<br/>
18. Es muss immer eine EZ im TS sein und für jede Streife der Stadt ein SL (Der Ranghöchste der Streife).<br/>
19. Es darf zu keiner Zeit über die Fahndungsliste gesprochen werden und es darf auch keine Auskunft gegeben werden.<br/>
20. Fahrzeuge dürfen nur gefahren werden, wenn man sie Rangentsprechend kaufen kann.<br/>
21. Fahrzeuge (eigene und von Kollegen) dürfen nur dann Beschlagnahmt werden wenn sie offen sind, wenn sie eine Gefahr darstellen oder wenn die Kollegen offline sind.<br/>
22. Fahrzeuge dürfen während eines laufendem RPs nicht beschlagnahmt werden, ausgenommen bei der Bundesbank.<br/>
23. Solltest du Probleme mit dem on kommen haben, oder in den Urlaub fahren so melde dich bitte ab!<br/>
24. Man darf mit dem Rang Ordnungsbeamter und Wachtmeister nicht als Zivilist spielen.<br/>
25. Sobald ein laufendes RP beendet ist, schreibe bitte der Feuerwehr welche Partei gewonnen hat und wer zu erst wiederbelebt werden darf.<br/>
26. Eine Razzia darf nur mit Absprache des Ranghöchsten durchgeführt werden, im Zweifelsfall auch durch die Erlaubnis der EZ.<br/>
27. Bei der Zentralbank müssen alle Einsatzkräfte anrücken, jedoch muss der Markt immer besetzt sein! (Umspawnen ist verboten)<br/>
28. SEK darf nur bei Bankfilialen, Geiselnahmen oder Bundesbank eingesetzt werden. (Kein anderes RP)<br/>
29. Tränengas nur für SEK - Einsatz nach Bedarf.<br/>
30. Gummigeschosse dürfen auch außerhalb eines SEK Einsatzes genutzt werden.<br/>
31. Eine Gasmaske ist ab Oberwachtmeister Pflicht!<br/>
32. Krisenbewältigungen werden von einem Kommissar oder höher getätigt. Wenn keiner verfügbar ist, muss die Person mit dem nächstniedrigeren Rang die Situation handhaben.<br/>
33. Streife darf man mit Landfahrzeugen nur zu zweit oder mehr fahren. (Außer nicht ausreichend Kräfte vorhanden)<br/>
34. Es zählt nur der Bußgeldkatalog der Ingame zu finden ist.<br/>
35. Regeln die man Ingame lesen kann sind zu 100% umzusetzten!<br/>
36. Nichteinhalten der Regeln kann und wird zu einem Bann führen.<br/>
37. Luftunterstützung: Helis dürfen Rangentsprechend benutzt werden.<br/>
38. Waffen von Zivilisten müssen beschlagnahmt werden und sind nicht zum Eigengebrauch zu nutzen.<br/>
39. Fahrzeuge sind Rang bezogen; Außnahme sind die Sondergruppen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Rangstruktur der Polizei",
                "
Der Höchstrangigste Polizist ist der jeweilige Ansprechpartner für die Polizei, wird ein Admin benötigt ist er verpflichtet diesen zu rufen.<br/><br/>
Regel 1 der Allgemeinen Polizeiregeln ist hierbei zu befolgen!<br/>
1. Ordnungsbeamter<br/>
2. Wachtmeister<br/>
3. Oberwachtmeister<br/>
4. Hauptwachtmeister<br/>
5. Kommissar<br/>
6. Oberkommissar<br/>
7. Hauptkommissar<br/>
8. Polizeidirektion<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Illegale Zonen",
                "
Es liegt im Ermessen eines Admins wie hoch die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit schützt nicht vor Strafe!<br/>
1. Rebellenaussenposten sind keine illegalen Gebiete.<br/>
2. Polizisten dürfen Drogenfelder nicht ohne Razzia betreten. (Siehe 'Razzia/Camping')<br/>
3. Wenn du als Polizist ein illegales Gebiet betreten willst, fordere vorher Verstärkung an!<br/>
4. Unter keinen Umständen darf ein Polizist an einem illegalen Gebiet campen.<br/>
5. Drogenverarbeitungsstätten und Schwarzbrenner dürfen nur mit mindestens 2 Polizeibeamten betreten werden.<br/>
6. Drogendealer dürfen nur mit 2 Beamten betreten werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Patrouillen",
                "

1. Polizisten dürfen durch die Städte und Straßen der Insel patrouillieren um illegale Aktivitäten aufzudecken.<br/><br/>
2. Patrouillen können sowohl zu Fuß als auch mit einem Fahrzeug getätigt werden.<br/>
3. Patrouillen dürfen nicht in ein illegales Gebiet führen. (Siehe Razzia/Camping)<br/>
4. Die Polizei darf keine Streife in der Nähe eines Rebellenstützpunktes vollführen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Feste + allgemeine Straßenkontrollen",
                "
Polizisten sind ermutigt feste
Straßenkontrollen an strategischen Punkten zu errichten, um den Kampf
gegen illegale Aktivitäten zu unterstützen und die Sicherheit auf den
Straßen zu gewährleisten.<br/><br/>
1. Eine Kontrolle Bedarf mindestens 3 Polizisten und zwei Fahrzeuge.<br/>
2. Eine Kontrolle darf nicht innerhalb von 300 m um eine Illegale Zone errichtet werden.<br/>
3. Eine Kontrolle darf nur auf Straßen errichtet werden.<br/>
4. Kontrollen müssen nicht auf der Karte markiert werden.<br/>
Richtiges Vorgehen bei festen und allgemeinen Straßenkontrollen:<br/>
1. Lass den Fahrer das Fahrzeug in einer sicheren Entfernung zu dir anhalten und den Motor abschalten.
2. Frage die Fahrzeuginsassen, ob sie Waffen mit sich führen.<br/>
3. Bitte die Fahrzeuginsassen, das Fahrzeug zu verlassen. Wenn sie Waffen haben, weise sie darauf hin diese zu senken und gebe ihnen zeit dies zu tun, nehme sie NICHT sofort fest.<br/>
4. Frage nach wohin die Reise geht und woher sie kommen.<br/>
5. Hole dir eine Erlaubnis zum Durchsuchen der Personen und des Fahrzeuges ein.<br/>
6. Wenn du eine Erlaubnis der Personen hast, dann lege sie in Handschellen und durchsuche sie.<br/>
7. Wenn du keine Erlaubnis der Personen erhältst, dann musst du sie fahren lassen, es sei denn es besteht ein BEGRÜNDETER Verdacht. Eine Ablehnung der Durchsuchung ist kein Verdacht, dass jemand etwas verheimlichen möchte.<br/>
8. Nach der Durchsuchung, darfst du den Personen erlauben weiterzufahren.<br/>
9. Im Falle von Illegalen Gegenständen, die bei den Personen sichergestellt wurden, darfst du Strafen nach dem Bußgeldkatalog verteilen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Fahrzeuge",
                "
1. Richtig geparkte Fahrzeuge, sollten in Ruhe gelassen werden.<br/><br/>
2. Boote sollten vernünftig am Ufer / Steg geparkt werden.<br/>
3. Wenn Zweifel bestehen, durchsuche das Fahrzeug und benachrichtige den Besitzer.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Stadtprotokolle",
                "
1. Polizisten dürfen in größeren Städten patrouillieren.<br/><br/>
2. Polizisten dürfen am Autohändler anhalten, um sicherzustellen, dass dieser frei ist. Stehen dort Fahrzeuge, sollte die Feuerwehr benachrichtigt werden.<br/>
3. Polizisten dürfen nicht in der Stadt herumstehen oder rumtrödeln.<br/>
4. Polizisten dürfen die Stadt auch in größeren Mengen betreten, wenn esrebellische Aktivitäten gibt. Sobald der Frieden in der Stadt wieder gesichert ist, haben die Polizisten das Gebiet zu räumen.<br/>
5. Der Ausnahmezustand darf zu keiner Zeit erklärt werden.<br/>
6. Die Polizei Reviere sind für Zivilisten verboten. Betreten dieser
ohne Genehmigung ist nicht erlaubt. Sich in der Nähe aufzuhalten, ist
jedoch nicht verboten, solange die Zivilisten keinen Aufstand machen
oder die Polizisten belästigen.<br/><br>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Nutzung von Nicht Tödlicher Gewalt",
                "
Der Taser ist die einzige Form der Nicht-tödlichen-Gewalt.<br/><br/>
1. Taser sollten benutzt werden, um unkooperative Zivilisten oder Verbrecher auszuschalten und festzunehmen.<br/>
2. Feuere den Taser nur ab, wenn du jemanden Festnehmen willst, der Missbrauch zieht eine Bestrafung nach sich.<br/>
3. Nutze den Taser nur wenn es die Regeln erlauben, nicht um anderen deinen Willen aufzuzwingen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Nutzung von Tödlicher Gewalt",
                "
1. Tödliche Gewalt ist NUR erlaubt, um dein eigenes Leben, das eines
anderen Polizisten oder eines Zivilisten zu beschützen. Auch wenn
tödliche Gewalt nicht mehr hilft.<br/>
2. Abfeuern einer Waffe, wenn keine Bedrohung besteht oder außerhalb von
Trainingseinheiten ist verboten. Polizisten die dagegen verstoßen
werden Bestraft.<br/>
3. Wenn ein Polizist eine Waffe ohne Erlaubnis in einer schwierigen
Situation nutzt, wird dies bestraft. Die Erlaubnis erteilt der
Ranghöchste Polizist vor Ort.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Razzien/Camping",
                "
Eine Razzia meint ein Trupp von Polizisten,
welche Gebiete durchsuchen, in denen hohe Kriminalität vorkommt, um
Kriminelle an der Ausübung von Straftaten zu hindern oder zu erwischen.<br/><br/>
1. Um eine Razzia durchzuführen, müssen 4 Polizisten beteiligt sein, einer davon muss mindestens den Rang Kommissar haben.<br/>
2. Alle Zivilisten im Bereich der Razzia, dürfen festgenommen und
durchsucht werden. Wenn nichts illegales gefunden wird, müsst ihr sie
gehen lassen.<br/>
3. Wenn etwas Illegales gefunden wird, werden die betroffenen mit zum Revier genommen und dort laut Bußgeldkatalog behandelt.
4. Tödliche Gewalt darf nur unter bestimmten Voraussetzungen eingesetzt werden. (Siehe 'Nutzung von Tödlicher Gewalt')
5. Nach Sicherung des Gebiets haben sich die Polizisten wieder zu entfernen.
6. Eine Razzia darf nicht innerhalb von 20 Minuten nach einer Razzia im selben Gebiet stattfinden.
7. Sollte eine Razzia fehlschlagen (Alle Polizisten sterben) gilt 6. trotzdem.
8. Verstärkung darf gerufen werden, es dürfen aber keine Polizisten sein die bereits gestorben sind. (Siehe 'New Life')
Camping ist definiert als unnötiges bleiben in einem Gebiet, nach dem
Ende einer Razzia oder wenn Polizisten eine Razzia nicht beenden und
Zivilisten, die das Gebiet betreten, weiterhin belangen wollen.
Kontrollen sind kein Camping. (Siehe 'Feste + allgemeine Straßenkontrollen' für mehr Informationen)<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Hausdurchsuchungen/Camping",
                "
Eine Hausdurchsuchung meint ein Trupp von
Polizisten, welche ein Gebäude durchsuchen, um Kriminelle an der
Ausübung von Straftaten zu hindern oder zu erwischen.<br/>
1. Um eine Hausdurchsuchung durchzuführen, müssen 3 Polizisten beteiligt
sein, einer davon muss mindestens den Rang Kommissar aufzeigen.<br/>
2. Wenn ein Straftäter in ein Haus flüchtet darf die Polizei mit
mindestens 2 Polizisten das Haus aufbrechen. (Einer davon muss Kommissar
sein)<br/>
3. Alle Zivilisten die eine Hausdurchsuchung stören, dürfen festgenommen
werden. Wenn nichts illegales gefunden wird, müsst ihr sie gehen
lassen.<br/><br/>
4. Wenn etwas Illegales gefunden wird, werden die betroffenen mit zum Revier genommen und dort laut Bußgeldkatalog behandelt.<br/>
5. Nach Beendigung und Sicherung des Hauses müssen die Türen geschlossen werden und das Gelände verlassen werden.<br/>
6. Eine Hausdurchsuchung darf nicht innerhalb von 120 Minuten nach einer Hausdurchsuchung im selben Gebäude stattfinden.<br/>
7. Sollte eine Hausdurchsuchung fehlschlagen (Alle Polizisten sterben) gilt 6. trotzdem.<br/>
8. Verstärkung darf gerufen werden, es dürfen aber keine Polizisten sein die bereits gestorben sind. (Siehe 'New Life')<br/>
9. Eine Hausdurchsuchung darf nur durchgeführt werden wenn jemand auf der Fahndungsliste mit Mord oder Drogendelikten steht.<br/>
10. Der Besitzer eines Hauses muss von der Polizei verhaftet sein oder 11.<br/>
11. Der Besitzer eines Hauses muss bei der Durchsuchung seines Hauses vor Ort sein. Außer bei Punkt 10.<br/>
12. Wenn ein Besitzer mit Delikten von Punkt 9 auf der Fahndungsliste
steht und von der Polizei getötet wird, hat die Polizei 10 Minuten um
dessen Haus aufzuspüren und zu durchsuchen.<br/>
Camping ist definiert als unnötiges bleiben in einem Gebäude, nach
Beendigung einer Hausdurchsuchung oder wenn Polizisten eine
Hausdurchsuchung nicht beenden und Zivilisten, die das Gebäude betreten,<br/>
weiterhin belangen wollen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["policerules",
        [
            "Verhandlungsfüher",
                "
1. Die Polizei stellt einen Verhandlungsführer für Tankstellen, Banken, Geiselnahmen oder Ähnliches bereit.<br/><br/>
2. Der Verhandlungsführer darf nur in Zivilkleidung kommen und darf keine Waffen bei sich tragen.<br/>
3. Der Verhandlungsführer muss mit dem SUV kommen.<br/>
4. Der Verhandlungsführer muss vorher per Polizei-an-alle-Nachricht angekündigt werden.<br/>
5. Der Verhandlungsführer darf zu keiner Zeit getötet oder als Geisel genommen werden.<br/>
6. Der Verhandlungsführer darf zu keiner Zeit jemand töten oder festnehmen.<br/>
7. Bei Tankstellen, Banken und Geiselnahmen muss der Verhandlungsführer akzeptiert werden.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["Feuerwehr",
        [
            "Allgemein",
                "
Es liegt im Ermessen eines Admins wie hoch
die Strafe eines Vergehens ausfällt! Keine Diskussionen! Unwissenheit
schützt nicht vor Strafe!<br/><br/>
1. Die Feuerwehr darf zu keiner Zeit beklaut, beraubt oder getötet werden. Darunter fallen auch die Fahrzeuge der Feuerwehr.<br/>
2. Die Feuerwehr darf unter keinen Umständen Waffen besitzen bzw. benutzten.<br/>
3. Die Feuerwehr darf erst wiederbeleben, wenn ein Feuergefecht( RP ) beendet ist.<br/>
4. Die Feuerwehr hat eine Teamspeak Pflicht und muss sich im Feuerwehr Channel befinden.<br/>
5. Die Feuerwehr darf nichts vom Boden aufsammeln, wenn eine Leiche in der Nähe liegt.<br/>
6. Die Feuerwehr darf Ihren Universalschlüssel, nur benutzen um eine Leiche aus einem Fahrzeug zu ziehen.<br/>
7. Die Feuerwehr darf keine bewaffneten Personen transportieren.<br/>
8. Die Feuerwehr darf sich nicht an Straftaten beteiligen (z.B. einem Gefängnisausbruch).<br/>
9. Die Mitarbeiter dürfen ausschließlich die bei der Feuerwehr erhältlichen Kleidungsstücke tragen.<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["Jobangebote",
        [
            "Verarbeitungswege",
                "
Illegal<br/><br/>
<br/>
- Kokainfeld -> Kokainverarbeitung/Gangversteck 2 -> Drogendealer<br/>
- Heroinplantage -> Heroinverarbeitung/Gangversteck 3 -> Drogendealer<br/>
- Marihana Plantage -> Marihuanaverarbeitung/Gangversteck 1 -> Drogendealer<br/>
- Wilderei für Schildkröten -> Schildkröten Händler<br/>
- Weitere Illegale Berufe in Planung<br/>
<br/>
Legal<br/>
<br/>
- Apfel/Pfirsiche -> Tanoamarkt<br/>
- Kupfermine -> Kupferverarbeitung -> Metallhändler<br/>
- Diamantenminde -> Diamantenschleifer -> Juwelier<br/>
- Steinbruch -> Steinverarbeitung -> Zementhändler<br/>
- Öl Felder -> Ölverarbeitung -> Ölhändler<br/>
- Sandmine -> Sand Verarbeiter -> Glashändler<br/>
- Salzmine -> Salzverarbeitung -> Salzhändler<br/>
- Jagtgründe -> Tanoamarkt<br/>
- Weitere Legale berufe in Planung<br/>
<br/>
Missionen<br/>
<br/>
- DP -> DP<br/>
- Treibstofflager -> Tankstellen (Benötigt Tanklaster)<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["Jobangebote",
        [
            "Lizenzen",
                "
Legal<br/><br/>
<br/>
Öl, Salz, Sand, Eisen: 10.000€<br/>
Diamand: 25.000€<br/>
Kupfer, Zement: 8.000€<br/>
<br/>
Illegal<br/>
<br/>
Kokain, Heroin, Marihuana: 70.000€<br/>
Rebellenlizenz: 2.500.000<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["Jobangebote",
        [
            "RP Berufe und Regeln",
                "
Anwälte dürfen nicht auf der Fahndungsliste stehen oder müssen sich
vorab bei Polizei stellen. Anwälte müssen eine Anwaltszulassung haben
und einen Anwaltsanzug tragen. Andernfalls wird dieser nicht von der
Polizei anerkannt.<br/><br/>
                "
        ]
    ];
    player createDiaryRecord ["controls",
        [
            "Allgemein",
                "
Z: Öffnet das Spielermenu<br/>
U: Öffnet / Schließt Fahrzeuge<br/>
F: Polizeisirene/ Feuerwehrsirene (Wenn Polizist / Feuerwehrmann)<br/>
T: Fahrzeug Kofferraum<br/>
Linke Windowstaste: Nutzung der Spitzhacke (Benötigt eine Spitzhacke)<br/>
^: Magicfinger<br/>
Als Cop: Linkes Shift + R: Festnehmen (Wenn Polizist)<br/>
Als Zivi: Linkes Shift + G: Bewusstlos schlagen mit einer Waffe (Wenn Zivilist, erlaubt ausrauben und festnehmen)<br/>
Shift + B: Hände über den Kopf heben<br/>
Linke Windowstaste: Interaktions Taste zum Aufsammeln von Gegenständen
oder Geld, Fahrzeug Interaktionen (Reparatur, etc) und Interaktion mit <br/>
Zivilisten (für Cops).<br/>
Linkes Shift + L: Sirenenlichter Polizei<br/>
Linkes Shift + H: Waffe Holstern<br/>
Shift + Numpad 1-5: Zusätzliche Animationen<br/>
                "
        ]
    ];
	player createDiaryRecord ["Preise",
        [
            "Fahrzeuge",
                "
PKWS<br/>
Quadbike: 5000<br/>
Hatchback: 20.000<br/>
Offroad: 25.000<br/>
Jeep: 40.000<br/>
SUV: 80.000<br/>
Hatchback Sport: 80.000<br/>
Truck: 90.000<br/>
<br/>
LKWS<br/>
Truck Box: 120.000<br/>
Truck Fuel: 250.000  (Fuelspace: 5.000L)<br/>
Zamack transport: 150.000<br/>
Zamack abgedeckt: 200.000<br/>
Zamack Fuel: 850.000  (Fuelspace: 10.000)<br/>
Hemmt transport: 600.000<br/>
Hemmt abgedeckt: 1.400.000<br/>
Hemmt Box: 2.000.000<br/>
Hemmt Fuel: 2.000.000  (Fuelspace: 30.000)<br/>
Tempest transport: 2.500.000<br/>
Tempest abgedeckt: 3.500.000<br/>
Tempest Gerät: 4.000.000<br/>
<br/>
Luftfahrzeuge<br/>
Mh-9 Hummingbird: 450.000<br/>
M-900: 450.000<br/>
Caesar BTT: 250.000<br/>
Orca: 1.000.000<br/>
Mohawk: 1.250.000<br/>
Huron: 2.000.000<br/>
Taru: 2.500.000<br/>
Blackfish: 4.250.000<br/>
Xian: 3.750.000<br/>
<br/>
                "
        ]
    ];

	player createDiaryRecord ["Preise",
        [
            "Lizenzen",
                "
Die Lizenzen für Jobs:<br/>
1.Öl:10000k<br/>
2.Diamant:25000k<br/>
3.Salz:10000k<br/>
4.Sand 10000k<br/>
5.Eisen 10000k<br/>
6.Kupfer:8000k<br/>
7.Zement:8000k<br/>
<br/>
Die Lizenzen für illegale Jobs:<br/>
1. Alle 70000<br/>
<br/>
Rebellenlizezn:<br/>
1. 2.500.000<br/>
<br/>
Allgemeine Lizenzen:<br/>
1.PKW Lizenz: 1500<br/>
2.Boot Lizenz: 2500<br/>
3.Pilot Lizenz: 100000<br/>
4.Truck Lizenz; 25000<br/>
5.Waffen Lizenz: 100000<br/>
6.Tauchen Lizezn: 10000<br/>
7.Haus Lizenz: 250000<br/><br/>
                "
        ]
    ];
