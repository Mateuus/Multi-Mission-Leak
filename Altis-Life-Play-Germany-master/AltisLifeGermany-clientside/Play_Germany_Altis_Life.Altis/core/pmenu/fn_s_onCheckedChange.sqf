#include <macro.h>
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
		if(EQUAL(_state,1)) then {
			life_tagson = true;
			profileNamespace setVariable["PG_life_tagson",life_tagson];
			saveProfileNamespace;
			LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_tagson = !true;
			profileNamespace setVariable["PG_life_tagson",life_tagson];
			saveProfileNamespace;
			[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};

	case "objects": {
		if(EQUAL(_state,1)) then {
			life_revealObjects = true;
			profileNamespace setVariable["PG_life_revealObjects",life_revealObjects];
			saveProfileNamespace;
			LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_revealObjects = !true;
			profileNamespace setVariable["PG_life_revealObjects",life_revealObjects];
			saveProfileNamespace;
			[LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};

	case "sidechat": {
		//if(EQUAL(_state,1)) then {life_sidechat = true;} else {life_sidechat = !true;};
		//profileNamespace setVariable["PG_life_sidechat",life_sidechat];
		//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false,true] call life_fnc_MP;
	};

	case "intro": {
		if(EQUAL(_state,1)) then {life_skipIntro = true;} else {life_skipIntro = !true;};
		profileNamespace setVariable["PG_life_skipIntro",life_skipIntro];
		saveProfileNamespace;
	};
};