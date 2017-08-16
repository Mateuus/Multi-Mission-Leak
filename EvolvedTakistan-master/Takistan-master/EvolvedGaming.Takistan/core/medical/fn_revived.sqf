#include <macro.h>
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse SVAR ["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] call life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[LIFE_SETTINGS(getNumber,"revive_fee")] call life_fnc_numberText];

player setVariable ["tf_unable_to_use_radio", false];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(BANK > (LIFE_SETTINGS(getNumber,"revive_fee"))) then {
	SUB(BANK,(LIFE_SETTINGS(getNumber,"revive_fee")));
} else {
	BANK = 0;
};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	//case independent: {[[player,0,"\eg_sndimg\textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] call life_fnc_MP;};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse SVAR ["Revive",nil,TRUE];
life_corpse SVAR ["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] call life_fnc_MP;
hideBody life_corpse;
player setVariable ["tf_unable_to_use_radio", false];

player SVAR ["Revive",nil,TRUE];
player SVAR ["name",nil,TRUE];
player SVAR ["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.

disableUserInput true;
life_action_inUse = true;
[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",nil,false] call life_fnc_MP;
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
uiSleep 5;

detach player;
deleteVehicle _obj;
disableUserInput false;
life_action_inUse = false;
deleteVehicle life_corpse;
life_corpse hideObject true;
[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] call BIS_fnc_MP;

_egCount = (count eg_clothesItems) - 1; 
for "_x" from 0 to _egCount do { 
	_item = eg_clothesItems select _x;
	player addItemToUniform _item;
	systemChat format["Add items to uniform: %1", _item];
};
_egCount = (count eg_vestItems) - 1; 
for "_x" from 0 to _egCount do { 
	_item = eg_vestItems select _x;
	player addItemToVest _item;
	systemChat format["Add items to vest: %1", _item];
};
_egCount = (count eg_backpackItems) - 1; 
for "_x" from 0 to _egCount do { 
	_item = eg_backpackItems select _x;
	player addItemToBackpack _item;
	systemChat format["Add items to pack: %1", _item];
};
player addHeadgear eg_hat;
[] call life_fnc_saveGear;