/*
	File: BR_start.sqf
	Author: Bloodwyn

	Description:
	Starts the Battle Royale. Can stay on the client ;)
*/
_action = [
		"Wollen Sie wirklich BattleRoyale starten?",
		"Battle Royale",
		"JA",
		"NEIN"
	] call BIS_fnc_guiMessage;

	waituntil{ str _action == "true" or  str _action == "false"};
	if(!_action) exitWith{};

Gericht_1 setVariable ["LHM_BR_eventstarted",true,true];
[[[],{ titleText ["BattleRoyal beginnt! FIGHT!","PLAIN"]}],"BIS_FNC_SPAWN",true,false] call lhm_fnc_mp;