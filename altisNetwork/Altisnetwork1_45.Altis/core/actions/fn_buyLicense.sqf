#include "..\..\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when purchasing a license. May need to be revised.
*/
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_varName,_sideFlag);

if (CASH < _price) exitWith {
    [format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName],false,"fast"] call life_fnc_notification_system;
};
CASH = CASH - _price;

[format[localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable [_varName,true];
