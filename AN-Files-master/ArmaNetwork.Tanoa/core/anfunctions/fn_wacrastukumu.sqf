#include <macro.h>
/*
	File: fn_gather.sqf
	Author: Devilfloh
	Modified by Rathbone for ArmA.Network
	Description:
	Main functionality for gathering.
*/
private["_maxGather","_resource","_amount","_maxGather","_requiredItem"];
if(life_action_inUse) exitWith {};
if(life_is_processing) exitWith {};
if(vehicle player != player) exitWith {};
if(player getVariable ["restrained",false]) exitWith {hintSilent localize "STR_NOTF_isrestrained";};
if(animationState player isEqualTo "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") exitWith {hintSilent "How do you think you're going to gather?";};
life_action_inUse = true;
_zone = "";
_requiredItem = "";
_itemSelect = [];
_receiveExp = 0;
_level = 0;
_zoneSize = getNumber(missionConfigFile >> "CfgGather" >> "zoneSize");
_exit = false;
_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {
	_curConfig = (_resourceCfg select _i);
	_itemSelect = getArray(_curConfig >> "items");
	_maxGather = getNumber(_curConfig >> "amount");
	_resourceZones = getArray(_curConfig >> "zones");
	_requiredItem = getText(_curConfig >> "item");
	_receiveExp = getNumber(_curConfig >> "exp");
	_level = getNumber(_curConfig >> "level");
	{
		if(player inArea _x) exitWith {_zone = _x;};
	} forEach _resourceZones;
	if(_zone != "") exitWith {};
};

if(_zone isEqualTo "") exitWith {life_action_inUse = false;};
if(count _itemSelect isEqualTo 0) exitWith {life_action_inUse = false;};
if(_level > LEVEL) exitWith {hintSilent "Not high enough experience to mine/gather here!"; life_action_inUse = false;};
if (_requiredItem != "") then {
	_valItem = [AN_Inventory,_requiredItem,0] call life_fnc_arrayGetValue;
	if (_valItem < 1) exitWith {
		switch (_requiredItem) do {
			case "pickaxe": {titleText[(localize "STR_NOTF_Pickaxe"),"PLAIN"];};
		};
		life_action_inUse = false;
		_exit = true;
	};
};
if(_exit) exitWith {life_action_inUse = false;};
_resource = selectRandom _itemSelect;
_amount = round(random(_maxGather)) + 1;
_carryWeight = call life_fnc_virtualInventoryWeight;
_diff = [_resource,_amount,_carryWeight,life_maxWeight] call life_fnc_wacruspekuc;
if(_diff isEqualTo 0) exitWith {
	hintSilent localize "STR_NOTF_InvFull";
	life_action_inUse = false;
};

switch (_requiredItem) do {
	case "pickaxe": {player say3D "mining";};
	default {player say3D "harvest";};
};
_sleep = 3.5;
if("gathering" in AN_Skills) then {_sleep = 1.5};
for "_i" from 0 to 2 do {
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _sleep;
};

if([_resource,_diff] call life_fnc_virtualItemAdd) then {
	_itemName = getText (missionConfigFile >> "VirtualItems" >> _resource >> "displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
};
sleep 1;
life_action_inUse = false;
_exp = round(random(_receiveExp));
[true,_exp] call life_fnc_thagayazapu;
