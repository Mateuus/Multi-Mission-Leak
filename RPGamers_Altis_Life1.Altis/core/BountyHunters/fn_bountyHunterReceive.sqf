#include "..\..\script_macros.hpp"

private ["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if (_val != _total) then {
    ["You broke something xD, val should always == total",5,"red"] call RPG_Fnc_Msg;
} else {
    [format [localize "STR_Bounty_BountyKill",[_val] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
};

BANK = BANK + _val;
[1] call SOCK_fnc_updatePartial;