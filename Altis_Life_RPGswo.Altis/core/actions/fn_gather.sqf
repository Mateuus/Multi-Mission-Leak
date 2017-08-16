#include "..\..\macros.hpp"
/*
    File: fn_gather.sqf
    Author: Devilfloh

    Description:
    Main functionality for gathering.
*/
private ["_resource","_amount","_requiredItem","_isIllegal","_illegal","_requiredSleep"];
if (DWEV_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {hint "Wie willst du mit gefesselten Händen sammeln?";};
if (player getVariable "surrender") exitWith {hint "Mit erhobenen Händen kannst du nichts sammeln!";};
if(vehicle player != player) exitWith {hint "Du kannst nicht innerhalb des Fahrezuges Sammeln.";};
DWEV_action_inUse = true;
_zone = "";
_requiredItem = "";
_exit = false;
_isIllegal = false;

_resourceCfg = missionConfigFile >> "CfgGather" >> worldName >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do
{

    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _amount = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
	_requiredSleep = getNumber(_curConfig >> "sleep");
    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {DWEV_action_inUse = false;};

if (_requiredItem != "") then
{
    _valItem = missionNamespace getVariable "DWEV_inv_" + _requiredItem;

    if (_valItem < 1) exitWith
	{
        switch (_requiredItem) do
		{
			case "pickaxe": { titleText["Du brauchst eine Spitzhacke", "PLAIN"];};
			case "shovel": { titleText["Du brauchst eine Schaufel", "PLAIN"];};
        };
        DWEV_action_inUse = false;
        _exit = true;
    };
};

if (_exit) exitWith {DWEV_action_inUse = false;};

if ((player getVariable["noobschutz",false])) then
{
			_illegal = M_CONFIG(getNumber,"VirtualItems",_resource,"illegal");
			if (_illegal isEqualTo 1 ) then
			{
			_isIllegal = true;
			};
};

if (_isIllegal) exitWith {hint "Mit deinem Anfängerschutz kannst du keine illegalen Güter sammeln";};

if (!isNil "DWEV_var_drugLevel") then 
{
	if ((DWEV_var_drugLevel > 0) && (DWEV_var_drugLevel <= 0.5)) then {_requiredSleep = (_requiredSleep * 0.8)};
	if ((DWEV_var_drugLevel > 0.5) && (DWEV_var_drugLevel <= 1)) then {_requiredSleep = (_requiredSleep * 0.7)};
	if ((DWEV_var_drugLevel > 1) && (DWEV_var_drugLevel <= 2)) then {_requiredSleep = (_requiredSleep * 0.5)};
};

_diff = [_resource,_amount,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith
{
    hint "Dein Inventar ist voll.";
    DWEV_action_inUse = false;
};

switch (_requiredItem) do
{
    case "pickaxe": {player say3D "mining";};
    default {};
};

for "_i" from 0 to 4 do
{
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    sleep _requiredSleep;
};

if ([true,_resource,_diff] call DWEV_fnc_handlelnv) then
{
    _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
    titleText[format ["Du hast %2 %1 gesammelt.",_itemName,_diff],"PLAIN"];
};

sleep 1;
DWEV_action_inUse = false;