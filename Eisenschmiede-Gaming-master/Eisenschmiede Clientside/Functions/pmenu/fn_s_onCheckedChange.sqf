#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Switching it up and making it prettier..
*/
private["_option","_state"];
_option = SEL(_this,0);
_state = SEL(_this,1);

switch(_option) do {
	case "tags": {
		if(_state isEqualTo 1) then {
			ES_tagson = true;
			// ES_ID_PlayerTags = ["ES_PlayerTags","onEachFrame","ES_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
		} else {
			ES_tagson = !true;
			// [ES_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};
	
	case "objects": {
		if(_state isEqualTo 1) then {
			ES_revealObjects = true;
			ES_ID_RevealObjects = ["ES_RevealObjects","onEachFrame","ES_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			ES_revealObjects = !true;
			[ES_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};
	
	case "sidechat": {
		if(_state isEqualTo 1) then {ES_sidechat = true;} else {ES_sidechat = !true;};
		[player,ES_sidechat,playerSide] remoteExec ["ES_fnc_managesc",2];
	};
};