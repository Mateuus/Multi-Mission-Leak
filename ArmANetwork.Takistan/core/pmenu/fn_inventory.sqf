#include <macro.h>

/*
        File: fn_inventory.sqf
        Author: Fuzz

        Description:
        Opens player inventory
*/
private["_display","_near","_icon"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

[] call life_fnc_p_updateMenu;

_display = findDisplay 2001;
_near = _display displayCtrl 2023;
_inv = _display displayCtrl 2005;
_weight = _display displayCtrl 2009;

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"medic"};};

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
        if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
        {
                _near lbAdd format["%1 - %2",name _x, side _x];
                _near lbSetData [(lbSize _near)-1,str(_x)];
        };
} forEach _near_units;

lbClear _inv;
{
  _displayName = getText(_x >> "displayName");
	if(ITEM_VALUE(configName _x) > 0) then {
		_inv lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),localize _displayName];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
    _icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

_weight ctrlSetText format["%1 / %2", life_carryWeight, life_maxWeight];
