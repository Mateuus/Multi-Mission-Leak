/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiPreInit.sqf
	Beschreibung:
		Führt eine gewöhnliche preInit für das Taxi aus
		
	Sie dürfen meine Funktionen/Scripte nur mit der "License-FvS.txt" nutzen sowie der Einhaltung der Regeln.
		Im Missionshauptverzeichnis oder in einem leicht zu findenen Ordner muss die "License-FvS.txt" vorhanden sein!
			Beispiel-Pfad: 
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
	You are only allowed to use my scripts/functions with my littly "License-FvS.txt" and the agreements to the rules.
		The "License-FvS.txt" has to be in your mission root folder or in an easy to finding folder
			Destination example:
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
*/
if !hasInterface exitWith {};
if !isMultiplayer exitWith {};
if isServer exitWith {};
diag_log "Taxi: preinit";
[] spawn {
	private ["_Preis_km","_Preis_Zeit","_Preis_Start","_Preis_Multi_Auto","_Preis_Multi_Luft","_Preis_Multi_Boot","_Taxi_Grundpreis_Aktua","_Erlaubte_Fraktionen",
		"_Erlaubte_Fahrzeuge","_Taximeter_Sleep","_Welche_Kilometer","_Taximeter_Farbe_M_An","_Taximeter_Farbe_M_Aus","_Taximeter_Info_Step","_debug",
		"_wk_Text","_str","_tasteNr","_tastenName","_error"
	];
	_error = false;
	_debug = getNumber(missionConfigFile >> "CfgTaxi" >> "debug");
	_debug = if(_debug == 0) then {false;} else {true;};
	waitUntil {if _debug then {diag_log "Taxi: Wait for the player...";}; (!isNull player && player == player)};
	waitUntil {if _debug then {diag_log "Taxi: Wait for client variables...";};(!isNil "life_session_completed")};
	waitUntil {if _debug then {diag_log "Taxi: Wait for display46...";}; !(isNull (findDisplay 46))};
	waitUntil {if _debug then {diag_log "Taxi: Waiting for player data...";}; life_session_completed};
	diag_log "Taxi: Client bereit...";
	taxi_wip = false;
	taxi_rechnung = [];
	_str = "";
	if (!(isClass(missionConfigFile >> "CfgTaxi")) || !(isClass(missionConfigFile >> "taxi_rechnung"))) exitWith {
		"ERRORS IN THE TAXISYSTEM";
		"####################";
		diag_log format["Taxi: Konfig vorhanden: %1",isClass(missionConfigFile >> "CfgTaxi")];
		diag_log format["Taxi: Dialog vorhanden: %1",isClass(missionConfigFile >> "taxi_rechnung")];
		"####################";
		"ERRORS IN THE TAXISYSTEM";
	};
	_Preis_km = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_km");
	_Preis_Zeit = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Zeit");
	_Preis_Start = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Start");
	_Preis_Multi_Auto = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Auto");
	_Preis_Multi_Luft = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Luft");
	_Preis_Multi_Boot = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Boot");
	_Taxi_Grundpreis_Aktua = getNumber(missionConfigFile >> "CfgTaxi" >> "Taxi_Grundpreis_Aktua");
	_Erlaubte_Fraktionen = getArray(missionConfigFile >> "CfgTaxi" >> "Erlaubte_Fraktionen");
	_Erlaubte_Fahrzeuge = getArray(missionConfigFile >> "CfgTaxi" >> "Erlaubte_Fahrzeuge");
	_Taximeter_Sleep = getNumber(missionConfigFile >> "CfgTaxi" >> "Taximeter_Sleep");
	_Welche_Kilometer = getNumber(missionConfigFile >> "CfgTaxi" >> "Welche_Kilometer");
	_Taximeter_Farbe_M_An = getText(missionConfigFile >> "CfgTaxi" >> "Taximeter_Farbe_M_An");
	_Taximeter_Farbe_M_Aus = getText(missionConfigFile >> "CfgTaxi" >> "Taximeter_Farbe_M_Aus");
	_Taximeter_Info_Step = getNumber(missionConfigFile >> "CfgTaxi" >> "Taximeter_Info_Step");
	_tasteNr = getNumber(missionConfigFile >> "CfgTaxi" >> "tasteTaximeter");
	_tastenName = getText(missionConfigFile >> "CfgTaxi" >> "tasten" >> str _tasteNr);
	_Welche_Kilometer = if(_Welche_Kilometer == 0) then {true;} else {false;};
	_wk_Text = if _Welche_Kilometer then {"Nur abgerundete/beendete Kilometer werden berechnet"} else {"Angefange Kilometer werden als ganze Kilometer berechnet"};
	{
		_str = _str + format["%1; ",getText(configFile >> "CfgVehicles" >> _x >> "displayName")];
	} forEach _Erlaubte_Fahrzeuge;
	{
		diag_log _x;
	} forEach [
		"Taxi: Einstellungen - Anfang",
		format["Taxi: Price per kilometer: %1",_Preis_km],
		format["Taxi: Price per time interval: %1",_Preis_Zeit],
		format["Taxi: Basic price (for taximeter start / start): %1",_Preis_Start],
		format["Taxi: Price multipliers per mode - Car: %1, Boat: %2, Air: %3",_Preis_Multi_Auto,_Preis_Multi_Boot,_Preis_Multi_Luft],
		format["Taxi: Basic price update (interval in minutes): %1",_Taxi_Grundpreis_Aktua],
		format["Taxi: Allowed vehicles: %1",_str],
		format["Taxi: Allowed fractions: %1",_Erlaubte_Fraktionen],
		format["Taxi: Sleep before each taximeter update in seconds: %1",_Taximeter_Sleep],
		format["Taxi: Which kilometer calculation: %1",_wk_Text],
		format["Taxi: Color Motor On/Off: %1/%2",_Taximeter_Farbe_M_An,_Taximeter_Farbe_M_Aus],
		format["Taxi: How many steps should be notified to all passengers?: %1 (ca. all %2 seconds)",_Taximeter_Info_Step, (_Taximeter_Info_Step * _Taximeter_Sleep)],
		format["Taxi: After how many steps all passengers will be notified: %1 (ca. all %2 seconds)",_Taximeter_Info_Step, (_Taximeter_Info_Step * _Taximeter_Sleep)],
		format["Taxi: Button combination for switching the taximeter on/off: SHIFT + %1 (%2)",_tastenName,_tasteNr],
		format["Taxi: DebugMode: %1", _debug],
		"Taxi: Settings - End"
	];
	taxi_display_handler46 = (findDisplay 46) displayAddEventHandler ["KeyDown",format["if((_this select 1) == %1 && (_this select 2)) then {if (taxi_wip) then {taxi_wip = false;titleText['Taximeter was terminated manually','PLAIN'];} else {0 spawn fvs_fnc_taxiInitFahrer;titleText['Taximeter was started','PLAIN'];};};false",_tasteNr]];
	if (isClass (missionConfigFile >> "CfgRemoteExec" >> "Functions")) then {
		{
			if !(isClass (missionConfigFile >> "CfgRemoteExec" >> "Functions" >> _x)) then {
				_error = true;
				diag_log format["Taxi: Funktionswarnung... CfgRemoteExec moeglicherweise fehlerhaft - fehlend: %1-1/client",_x];
			} else {diag_log format["Taxi: %1-%2 ist in der CfgRemoteExec-(Functions) vorhanden! OK",_x,getNumber(missionConfigFile >> "CfgRemoteExec" >> "Functions" >> _x >> "allowedTargets")];};
		} forEach [
			"fvs_fnc_taxiDialogRechnung",
			"fvs_fnc_taxiInitFahrer",
			"fvs_fnc_taxiMsgKunden",
			"fvs_fnc_taxiRechnungAusstellen",
			"fvs_fnc_taxiRechnungBezahlt",
			"fvs_fnc_taxiRechnungErhalten"
		];
	};
	if (isClass (missionConfigFile >> "CfgRemoteExec" >> "Commands")) then {
		if !(isClass (missionConfigFile >> "CfgRemoteExec" >> "Commands" >> "hint")) then {
			_error = true;
			diag_log format["Taxi: Der Befehl/Command ist nicht in der CfgRemoteExec hinterlegt. Ohne 'hint' ist eine fehlerfreie Funktion nicht gewährleistet! >> class hint {allowedTargets = 0;};"];
		} else {
			diag_log format["Taxi: hint-%1 ist in der CfgRemoteExec-(Commands) vorhanden! OK",getNumber(missionConfigFile >> "CfgRemoteExec" >> "Commands" >> "hint" >> "allowedTargets")];
		};
	};
	if _error exitWith {
		taxi_wip = nil;
		taxi_rechnung = nil;
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",taxi_display_handler46];
		diag_log "TAXI-ERROR: Das Taxisystem konnte nicht geladen werden. Displayhandler und eigenserstellte Variablen entfernt.";
		[
			"<t align='center' size='2' color='#ff0000' underline='true'>Taxi-ERROR</t><t align='left' size='0.7' color='#f0f0f0'>Es liegen Fehler vor. Weitere Informationen im RPT-Log des Clients >> WINDOWS+R drücken >> %localappdata%\Arma 3 in der 'Eingabeaufforderung' eingeben>> Aktuellste Log-Datei (.rpt) öffnen und prüfen</t>",
			"Taxi-ERROR",
			"VERSTANDEN",
			"VERSTANDEN"
		] call BIS_fnc_guiMessage;
	};
	_Erlaubte_Fraktionen = {
		if(str playerSide in _x) exitWith {_Erlaubte_Fraktionen select _forEachIndex};
		["","false"]
	} forEach _Erlaubte_Fraktionen;
	if (call compile format["%1",_Erlaubte_Fraktionen select 1]) then {systemChat format["If you get into a taxi, press this key to start 'SHIFT + %1' in '%2'",_tastenName,_str];};
	diag_log "Taxi: preinit beendet";
};