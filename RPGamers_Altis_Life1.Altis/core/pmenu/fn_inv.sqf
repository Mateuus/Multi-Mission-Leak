#include "..\..\script_macros.hpp"

private ["_inv","_near_units","_shrt"];
disableSerialization;

_inv = CONTROL(5502,2005);
_near_i = CONTROL(5502,2023);
lbClear _inv;
lbClear _near;
lbClear _near_i;

//Near players
_near_units = [];
{ if (player distance _x < 10) then {_near_units pushBack _x};} forEach playableUnits;
{
    if (!isNull _x && alive _x && player distance _x < 10 && !(_x isEqualTo player)) then {
        _near_i lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
        _near_i lbSetData [(lbSize _near_i)-1,str(_x)];
    };
} forEach _near_units;

ctrlSetText[2009,format ["Weight: %1 / %2", life_carryWeight, life_maxWeight]];

{
    if (ITEM_VALUE(configName _x) > 0) then {
        _inv lbAdd format ["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
        _inv lbSetData [(lbSize _inv)-1,configName _x];
        _icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
        if (!(_icon isEqualTo "")) then {
            _inv lbSetPicture [(lbSize _inv)-1,_icon];
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));