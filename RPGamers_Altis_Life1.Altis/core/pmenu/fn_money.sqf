#include "..\..\script_macros.hpp"

private ["_near","_near_units","_mstatus"];
disableSerialization;

_near = CONTROL(2001,2022);
_mstatus = CONTROL(2001,2015);
lbClear _near;

//Near players
_near_units = [];
{ if (player distance _x < 10) then {_near_units pushBack _x};} forEach playableUnits;
{
    if (!isNull _x && alive _x && player distance _x < 10 && !(_x isEqualTo player)) then {
        _near lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
        _near lbSetData [(lbSize _near)-1,str(_x)];
    };
} forEach _near_units;

_mstatus ctrlSetStructuredText parseText format ["<img size='2.3' image='icons\ico_bank.paa'/> <t size='1.8px'>$%1</t><br/><img size='2.2' image='icons\ico_money.paa'/> <t size='1.8'>$%2</t>",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
ctrlSetText[2009,format ["Weight: %1 / %2", life_carryWeight, life_maxWeight]];