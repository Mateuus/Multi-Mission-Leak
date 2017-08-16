/*
	File: fn_welcomeNotification.sqf
	Author: Blackd0g

	Description:
	Called upon first spawn selection and welcomes our player.
*/

private ["_civ","_cop","_med","_adminlevel","_rank","_coplevel"];

//if(lhm_firstSpawn) then {
//	[player] spawn lhm_initFirstSpawn;
//} else {
	[player] spawn lhm_fnc_spawningCam;
//};


[] spawn
{
	waitUntil {!isNil "spawningCam" && spawningCam};

	sleep 0.1; // important to use hintC function
	_intro = [];
	_rank = "";

	switch (playerSide) do {

		case west:
		{
			_coplevel = call lhm_coplevel;
			switch (_coplevel) do
			{
				case 1:
				{
				_rank = "Cadet";
				};
				case 2:
				{
				_rank = "Officer";
				};
				case 3:
				{
				_rank = "Corporal";
				};
				case 4:
				{
				_rank = "Sergeant";
				};
				case 5:
				{
				_rank = "Lieutenent";
				};
				case 6:
				{
				_rank = "First Lieutenent";
				};
				case 7:
				{
				_rank = "Captain";
				};
				case 7:
				{
				_rank = "Colonel";
				};
				case 7:
				{
				_rank = "Deputy Chief";
				};
				case 7:
				{
				_rank = "Chief";
				};
			};
		};

		case independent:
		{
			_medlevel = call lhm_mediclevel;
			switch (_medlevel) do
			{
				case 1:
				{
				_rank = "Medical assistant";
				};
				case 2:
				{
				_rank = "Medical specialist";
				};
				case 3:
				{
				_rank = "Assistant medical director";
				};
				case 4:
				{
				_rank = "Chief medical director";
				};
				case 5:
				{
				_rank = "Medical Superintendent";
				};
			};
		};
	};

	// Civilian Text
	 _civ = [format["<img size='4.5' image='core\textures\misc\logo\lhlife_logo.jpg'/><br/><br/>
	%1, bitte lese dir diese Informationen gut durch!<br/>
	<t color='#FF0000'>Die Regierung</t> <t color='#FF0000'>LOEWENHERZ</t>, moechte dich offiziell auf unserer schoenen Insel begruessen! In der aktuellen Version haben sich einige Dinge geaendert!<br/>
	Durch die neue Fraktion <t color='#FF8C00'>'Loewenherz Security Agency'</t> wurde ein private Sicherheitsdienst eingefuehrt.<br/>
	Folgende Dienstleistungen bieten die <t color='#FF8C00'>'Security Operator'</t> an:<br/><br/>
	-Gebaeudeschutz<br/>
    -Fahrzeugschutz<br/>
    -Personenschutz<br/>
    -Absicherung der Handelswege<br/><br/>
	Ihr koennt sie genauso wie alle anderen Fraktionen per <t color='#FF8C00'>'Security'</t> Button erreichen.<br/>
	Wir hoffen, dass dir dein neues Leben auf %2 viel Freude bereiten wird! Wenn du irgendwelche Fragen haben solltest, tue dir keine Zwang an und FRAG NACH! Um anderen <t color='#00FF00'>Buergern</t> oder <t color='#00FF00'>Regierungsbeamten</t> fragen zu stellen benutze im Playermenu die Nachrichtenfunktion oder den VoiceChat! <br/><br/>(<t color='#00FF00'>ADMINS: Blackd0g, TREiBER, Barney und Team...</t>).<br/><t color='#D8BFD8'>Teamspeak 3: ts.loewenherz-projekt.de:9988 PW: 'blah'<br/>
	", name player,worldName]];

	// Cop Text
	_cop = [format["<img size='4.5' image='core\textures\misc\logo\lhpd.jpg'/><br/><br/>
	beim <t color='#FF0000'>[L]</t>oewen<t color='#FF0000'>[H]</t>erz <t color='#FF0000'>[P]</t>olice <t color='#FF0000'>[D]</t>epartment,<br/><br/><t color='#FF0000'>Wichtige Informationen fuer alle Beamten!</t><br/><br/>
	<t color='#FFD700'>%1 %2</t><br/><br/>
	Unsere Aufgabe ist es die Zivilbevoelkerung von %3 zu Schuetzen und dieser mit Rat und Tat zur Seite zu stehen.<br/>
	Jedes LHPD Mitglied sollte stets freundlich und hilfsbereit sein.<br/><br/>
	<t color='#FF0000'>Unsere wichtigsten Regeln sind:</t><br/><br/>
	Das Rollenspiel sollte als LHPD Beamter, dass Kernelement des Spiel darstellen.
	Ein hoeherer Dienstgrad ist gegenueber einem niedrigeren Dienstgrad Weisungsbefugt.
	Wenn du getoetet wurdest <t color='#FF0000'>MUSST du 15 Min. warten</t>, bevor du an deinem Todesort zurueckkehren darfst.
	Du Darfst nicht von aussen auf das geschehen dort Einfluss haben
	Die Anwendung von toedlicher Gewalt ist nur fuer den Schutz ihres eigenen Lebens oder zum Schutz dritter.
	Ein Cop hat NIEMALS die Berechtigung einen Zivilisten mit Waffen auszuruesten.<br/>
	<t color='#FFD700'>Das vollstaendige Regelwerk findest du mittels Taste </t><t color='#FF0000'>'M'</t><t color='#FFD700'> unter 'Polizei Regeln' auf der MAP.</t><br/><br/>
	mit freundlichen Gruessen<br/><br/>
	Das Police Headquarter %3<br/><br/>
	(<t color='#00FF00'>ADMINS: Blackd0g, TREiBER, Barney und Team...</t>).<br/><t color='#D8BFD8'>Teamspeak 3: ts.loewenherz-projekt.de:9988 PW: 'blah'<br/>
	",_rank, name player,worldName]];

	// Medic Text
	_med = [format["<img size='4.5' image='core\textures\misc\logo\medic.jpg'/><br/><br/>
	beim <t color='#FF0000'>[L]</t>oewen<t color='#FF0000'>[H]</t>erz <t color='#FF0000'>[M]</t>edical <t color='#FF0000'>[D]</t>epartment,<br/><br/><t color='#FF0000'>Wichtige Informationen fuer alle Angestellten!</t><br/><br/>
	<t color='#FFD700'>%1 %2</t><br/><br/>
	Ihre Aufgabe ist es die Zivilbevoelkerung von %3 medizinisch zu versorgen und dieser bei gesundheitlichen Fragen zur Seite zu stehen.<br/>
	Bedenken sie das ein hoeherer Dienstgrad einem niedrigeren gegenueber weisungsbefugt ist.<br/>
	Weiterhin ist, auch wenn sie Notaerzte sind, die 15 Minuten Regel zu wahren:<br/><br/>
	Wenn du getoetet wurdest <t color='#FF0000'>MUSST du 15 Min. warten</t>. warten bevor du an den Todesort zurueck kehren darfst.<br/><br/>
	Du darfst auch nicht von außen auf das Geschehen dort Einfluss nehmen.<br/>
	Die Anwendung von toedlicher Gewalt ist als Arzt nicht erlaubt, denn das verstoeßt gegen ihre Prinzipien.<br/>
	Als Aerzte die in Kriesengebieten eingesetzt werden, sind sie sich darueber im klaren, welche Gefahr mit der Ausuebung ihres Berufes einher geht.<br/>
	Das Kernelement ihrer Arbeit ist natuerlich Roleplay/Rollenspiel.<br/>
	Wichtig: Sie kennen das Regelwerk welches unter Taste 'M' zu finden ist.<br/><br/>
	Mit freundlichen Gruessen<br/><br/>
	Das %3 Medicalcenter<br/><br/>
	(<t color='#00FF00'>ADMINS: Blackd0g, TREiBER, Barney und Team...</t>).<br/><t color='#D8BFD8'>Teamspeak 3: ts.loewenherz-projekt.de:9988 PW: 'blah'<br/>
	",_rank, name player,worldName]];


	// Security Text
		_sec = [format["<img size='4.5' image='core\textures\misc\logo\security.jpg'/><br/><br/>
	%1, Wichtige Informationen fuer alle Mitglieder!<br/>
	<t color='#FF0000'>Die Loewenherz Security Agency</t> <t color='#FF0000'>LOEWENHERZ</t>, hat dich als Mitglied der Security ausgewaehlt! Willkommen im Team!<br/> Ihr Aufgabengebiet umfasst die folgende Dienstleistungen: <br/>
	-Gebaeudeschutz<br/>
	-Fahrzeugschutz<br/>
	-Personenschutz<br/>
	-Absicherung der Handelswege<br/>	<br/>
	<t color='#FF0000'>Unsere wichtigsten Regeln sind:</t><br/><br/>
	-Ihre Handlungen sind an geltendes Recht gebunden<br/>
	-Die Polizei ist Ihnen gegenueber weisungsbefugt!<br/>
	-Handeln Sie immer im Sinne der Firma.<br/>
	-Ein Agent darf nur die ihm gestellte Ausruestung benutzen.<br/>
	-Ein Security Agent  hat NIEMALS die Berechtigung einen Zivilisten mit Waffen auszuruesten. <br/>
	-Der Schutz Ihres Kunden hat hoechste Prioritaet, die Anwendung von toedlicher Gewalt ist nur zum Schutz ihres eigenen Lebens oder zum Schutz Dritter erlaubt.<br/>
	-Wenn du getoetet wurdest <t color='#FF0000'>MUSST du 15 Min. warten</t>, bevor du an deinem Todesort zurueckkehren darfst. Du darfst nicht von aussen auf das Geschehen dort Einfluss nehmen.<br/>
	<br/><br/><t color='#FF0000'>Verstoeße werden SCHWER geahndet.</t><br/>
		", name player,worldName]];

	switch (playerSide) do
	{
		case west:
		{

			{
				_intro = _intro + [(parseText _x)];
			} forEach _cop;

			_cop = _intro;
			sleep 0.1; // important to use hintC function
			"Willkommen" hintC _cop;
			//playSound "introSong";

		};

		case civilian:
		{
			{
				_intro = _intro + [(parseText _x)];
			} forEach _civ;

			_civ = _intro;
			sleep 0.1; // important to use hintC function
			"Willkommen" hintC _civ;
			//playSound "introSong";
		};

		case independent:
		{

			{
				_intro = _intro + [(parseText _x)];
			} forEach _med;

			_med = _intro;
			sleep 0.1; // important to use hintC function
			"Willkommen" hintC _med;
			//playSound "introSong";
		};

		case east:
		{

			{
				_intro = _intro + [(parseText _x)];
			} forEach _sec;

			_sec = _intro;
			sleep 0.1; // important to use hintC function
			"Willkommen" hintC _sec;
			//playSound "introSong";
		};

	};

};

[] spawn lhm_fnc_movingText;