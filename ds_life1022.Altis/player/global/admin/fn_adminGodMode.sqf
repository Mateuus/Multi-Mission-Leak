/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Toggles god mode on the player
*/

private ["_player","_targets"];

if((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))exitWith{closeDialog 0;};

_player = (name player);

[] spawn {
  	while {dialog} do {
		closeDialog 0;
		sleep 0.01;
	};
};

if(DS_god)then {
	DS_god = false;
	titleText ["God mode disabled","PLAIN"]; titleFadeOut 2;
	player setVariable ["bulletProof",false,true];
	player allowDamage true;
	if(DS_adminLevel < 4)then {
        _targets = allPlayers select {_x getVariable ["DSAdmin",false]};
        [_player,"Disabled God Mode"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
	};
} else {
	DS_god = true;
	titleText ["God mode enabled","PLAIN"]; titleFadeOut 2;
	player setVariable ["bulletProof",true,true];
	player allowDamage false;
	if(DS_adminLevel < 4)then {
        _targets = allPlayers select {_x getVariable ["DSAdmin",false]};
        [_player,"Activated God Mode"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];
	};
};

if(DS_god)then {
	[] spawn {
		while{true}do {
			sleep 60;
			if(!DS_god)exitWith{};
			hint "REMEMBER YOU HAVE GOD MODE ACTIVATED!";
			systemchat "REMEMBER YOU HAVE GOD MODE ACTIVATED!";
		};
	};
};