#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Switching it up and making it prettier..
*/
private["_option","_state"];
_option = SEL(_this,0);
_state = SEL(_this,1);

switch(_option) do {	
	case "objects": {
		if(EQUAL(_state,1)) then {
			life_revealObjects = true;
			LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_revealObjects = !true;
			[LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};
	
	case "sidechat": {
		if(EQUAL(_state,1)) then {life_sidechat = true;} else {life_sidechat = !true;};
		[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];
	};
	
	case "chat": {
		if(EQUAL(_state,1)) then {life_chat = true;} else {life_chat = !true;};
		if(life_chat) then {showChat true;} else {showChat false;};
	};
	
	case "hud": {
		if(EQUAL(_state,1)) then {life_hud = true;} else {life_hud = !true;};
		if(life_hud) then {4 cutRsc ["osefStatusBar","PLAIN"];} else {4 cutText ["","PLAIN"];};
	};
};