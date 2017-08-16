/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_lastPos"];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then {
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	if(license_civ_einwohner) then {
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	} else {
		//Rules
		rulesok = false;
		if(!createDialog "agb") exitWith {};
		waitUntil{!isNull (findDisplay 32154)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 32154)}; //Wait for the spawn selection to be done.
		if(!rulesok)then {
			player enableSimulation false;
			["Aborted",false,true] call BIS_fnc_endMission;
			sleep 35;
		};
		rulesok = false;
		[] spawn life_fnc_introJet;
	};
};
player addRating 9999999;
[] spawn {
	while{true} do {
		sleep(10*60);
		life_civTime = life_civTime + 1;
	};
};

dokeyCheck={	private ["_r"] ;	_r = false ; 	if ((_this select 1) in (actionKeys "TacticalView")) then {		hint "Commandermodus deaktiviert" ;		_r=true;	};  _r;} ;(FindDisplay 46) displaySetEventHandler [     "keydown",     "_this call dokeyCheck"     ];