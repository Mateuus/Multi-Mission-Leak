/*
	Dateiname: fn_persoPreInit.sqf
	Autor: Felix von Studsinske
	Beschreibung:
		Setzt bestimmt Variablen
*/
if !hasInterface exitWith {};
if !isMultiplayer exitWith {};
if isServer exitWith {};
[] spawn {
	private ["_rang","_rangArr","_skip","_index"];
	waitUntil {(!isNull player && player == player)};
	_skip = (getNumber(missionConfigFile >> "Personalausweis" >> "persoNeu_wann") isEqualTo 0);
	waitUntil {(!isNil "life_session_completed")};
	fvs_persoReady = false;
	fvs_hakenregeln = false;
	fvs_checking = false;
	fvs_hakenrichtig = false;
	fvs_namenInfo = false;
	fvs_checking_a = false;
	fvs_namen_a = false;
	fvs_hakendaten = false;
	if _skip then {
		waitUntil{life_session_completed};
		diag_log "::Client:: Warten auf Schließung des Spawnmenues wird uebersprungen";
		diag_log "::Client:: Pruefe Personalausweisdaten.";
		0 cutText ["Check the identity card...","BLACK FADED"];
		while {true} do {
			if !(isNull (findDisplay 38500)) exitWith {
				closeDialog 0;
			};
		};
		waitUntil {isNull (findDisplay 38500)};
		[] call fvs_fnc_perso_laden;
		0 cutFadeOut 99999999;
		waitUntil{fvs_persoReady};
	} else {
		waitUntil{(life_session_completed && !(isNull (findDisplay 38500)))};
		diag_log "::Client:: Warte auf Schließung des Spawnmenues...";
		waitUntil{(isNull (findDisplay 38500)) && (isNull (findDisplay 999999))}; // 38500=Spawn, 999999=Welcome
		diag_log "::Client:: Pruefe Personalausweisdaten.";
		0 cutText ["Check the identity card...","BLACK FADED"];
		[] call fvs_fnc_perso_laden;
		0 cutFadeOut 99999999;
		waitUntil{fvs_persoReady};
	};
	if _skip then {[] call life_fnc_spawnMenu;};
	diag_log "## Personalausweis-Variable wird gesetzt 'persoRangBez'";
	_rang = "";
	switch playerSide do {
		case west: {
			_rangArr = getArray(missionConfigFile >> "Personalausweis" >> "cop_lvl");
			_index = getArray(missionConfigFile >> "Personalausweis" >> "staatsbuergerschaften") find ((player getVariable ["personaltext",["","","","","","","","","","","","","","","","0"]]) select 15);
			if (_index < 0) then {_index = 0;};
			_rang = (_rangArr select ((call life_coplevel) -1)) select _index;
			if (_rang isEqualTo "") then {_rang = "Array in der 'Config_Perso.hpp >> Personalausweis >> cop_lvl' nicht vollständig!";};
			player setVariable ["persoRangBez",_rang,true];
		};
		case independent: {
			_rangArr = getArray(missionConfigFile >> "Personalausweis" >> "med_lvl");
			_index = getArray(missionConfigFile >> "Personalausweis" >> "staatsbuergerschaften") find ((player getVariable ["personaltext",["","","","","","","","","","","","","","","","0"]]) select 15);
			if (_index < 0) then {_index = 0;};
			_rang = (_rangArr select ((call life_mediclevel) -1)) select _index;
			if (_rang isEqualTo "") then {_rang = "Array in der 'Config_Perso.hpp >> Personalausweis >> med_lvl' nicht vollständig!";};
			player setVariable ["persoRangBez",_rang,true];
		};
		case civilian: {};
		case east: {};
	};
	if (isClass (missionConfigFile >> "CfgRemoteExec" >> "Functions")) then {
		{
			if !(isClass (missionConfigFile >> "CfgRemoteExec" >> "Functions" >> (_x select 0))) then {
				_error = true;
				diag_log format["PERSO: Funktionswarnung... CfgRemoteExec moeglicherweise fehlerhaft - fehlend: %1-1/client",_x];
			} else {diag_log format["PERSO: %1-%2 ist in der CfgRemoteExec-(Functions) vorhanden! OK",(_x select 0),getNumber(missionConfigFile >> "CfgRemoteExec" >> "Functions" >> (_x select 0) >> "allowedTargets")];};
		} forEach [
			["fvs_fnc_persoBeantragen",2],
			["fvs_fnc_persoErgebnis",1],
			["fvs_fnc_zeigePerso",1],
			["DB_fnc_persoRequest",2],
			["DB_fnc_persoInsert",2],
			["DB_fnc_persoUpdate",2]
		];
	};
	diag_log format["## Personalausweis-Variable gesetzt: %1",_rang];
};