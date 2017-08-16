/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = param [0,ObjNull,[ObjNull]];
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hintSilent "You are not looking at a house door."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) isEqualTo _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["life_fnc_brusathusek",-2];
} else {
	[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",-2];
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door isEqualTo 0) exitWith {hintSilent localize "STR_Cop_NotaDoor"};
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hintSilent localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;
_title = localize "STR_ISTR_Bolt_Process";
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1",_title];
_anim = ["medic"] call call life_fnc_yufanuyaw;
_waitTime = (30 / (1 / 0.006));

for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _waitTime;
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(player distance _building > 10) exitWith {};
	if(life_istazed) exitWith {};
	if(life_interrupted) exitWith {};
};
[false] call life_fnc_tufruxatra;
terminate _anim;
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_meqafubadru;
	life_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true];
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
