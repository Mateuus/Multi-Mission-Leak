#include <macro.h>

private["_dialog","_lic"];

disableSerialization;
waitUntil {!isNull findDisplay 2001};

[] call life_fnc_p_updateMenu;

_dialog = findDisplay 2001;
_lic = _dialog displayCtrl 2014;
_struc = "";
_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

{
	_displayName = getText(_x >> "displayName");

	if(LICENSE_VALUE(configName _x,_side)) then {
		_struc = format["%1",localize _displayName];
		_lic lbAdd _struc;
	};
} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if(EQUAL(_struc,"")) then {
        _lic = "No Licenses";
};
