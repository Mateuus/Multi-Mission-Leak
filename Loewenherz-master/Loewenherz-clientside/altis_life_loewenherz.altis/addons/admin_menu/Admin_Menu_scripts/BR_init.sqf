/*
	File: BR_init.sqf
	Author: Bloodwyn

	Description:
	Starts the BR Event init on the server.
*/

_action = [
		"Wollen Sie wirklich BattleRoyale vorbereiten?",
		"Battle Royale",
		"JA",
		"NEIN"
	] call BIS_fnc_guiMessage;

	waituntil{ str _action == "true" or  str _action == "false"};
	if(!_action) exitWith{};



[]spawn{
			while{!(Gericht_1 getVariable ["LHM_BR_eventstarted",false])}do{
					hint format ["Es sind derzeit %1 Teilnehmer",count(Gericht_1 getVariable ["LHM_BR_members",[]])];
					sleep 4;
			};
		};

titletext["BattleRoyale wird vorbereitet, Sie werden in 10s teleportiert!","PLAIN"];

//script auf Server
[[],"lhm_fnc_BR_spawn",false,false] call lhm_fnc_mp;
//script auf server

sleep 10;

player setPosATL [23510.6,17820.5,10.6];
player setDir 0;
execVM "addons\admin_menu\Admin_Menu_scripts\eventflag.sqf";