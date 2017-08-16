#include "..\..\macros.hpp"
    /*
        File: fn_mine.sqf
        Author: Devilfloh
        Editor: Dardo

        Description:
        Same as fn_gather,but it allows use of probabilities for mining.
    */
private ["_maxGather", "_resource", "_amount", "_requiredItem", "_mined","_requiredSleep","_fail","_dice"];
if (DWEV_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {hint "Wie willst du mit gefesselten Händen sammeln?";};
if (player getVariable "surrender") exitWith {hint "Mit erhobenen Händen kannst du nichts sammeln!";};
if(vehicle player != player) exitWith {hint "Du kannst nicht innerhalb des Fahrezuges Sammeln.";};

_exit = false;
DWEV_action_inUse = true;
_zone = "";
_requiredItem = "";
_fail = 90; //10%, geht schaufel kaputt
_dice = floor (random 100);

_resourceCfg = missionConfigFile >> "CfgGather" >> worldName >> "Minerals";
_percent = (floor random 100) + 1; //Make sure it's not 0

for "_i" from 0 to count(_resourceCfg)-1 do
{
    _curConfig = _resourceCfg select _i;
    _resources = getArray(_curConfig >> "mined");
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
	_requiredSleep = getNumber(_curConfig >> "sleep");
    _mined = "";

    if (_resources isEqualTo []) exitWith {}; //Smart guy :O
    for "_i" from 0 to count (_resources) do
	{
        if (count _resources isEqualTo 1) exitWith
		{
            if (!((_resources select 0) isEqualType [])) then
			{
                _mined = _resources select 0;
            } else
			{
                _mined = (_resources select 0) select 0;
            };
        };
        _resource = (_resources select _i) select 0;
        _prob = (_resources select _i) select 1;
        _probdiff = (_resources select _i) select 2;
        if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith { _mined = _resource; };
    };

    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith { _zone = _x; };
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith { DWEV_action_inUse = false; };

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

if((_dice >= _fail) && (_requiredItem isEqualTo "shovel")) exitWith 
{
	titleText["Deine Schaufel ist kaputt.","PLAIN"];
	[false,"shovel",1] call DWEV_fnc_handlelnv;
};

if (_exit) exitWith { DWEV_action_inUse = false; };

_amount = round(random(_maxGather)) + 1;
_diff = [_mined, _amount, DWEV_carryWeight, DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith
{
	hint "Dein Inventar ist voll.";
    DWEV_action_inUse = false;
};

switch (_requiredItem) do
{
    case "pickaxe": {player say3D "mining";};
};

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    };
    sleep _requiredSleep;
};

if (_zone isEqualTo "schatzinsel_1" || _zone isEqualTo "schatzinsel_2") then
{
	if (([true, _mined, _diff] call DWEV_fnc_handlelnv)) then
	{
    _itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
    titleText[format ["Du hast %2 %1 gefunden.", _itemName, _diff], "PLAIN"];
	};
}
else
{
	if (([true, _mined, _diff] call DWEV_fnc_handlelnv)) then
	{
		_itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
		titleText[format ["Du hast %2 %1 abgebaut.", _itemName, _diff], "PLAIN"];
	};
};

sleep 2.5;
DWEV_action_inUse = false;
