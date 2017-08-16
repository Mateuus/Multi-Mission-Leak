#include "..\..\macros.hpp"
/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
private ["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if !(_unit isEqualTo player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;

if (!(_diff isEqualTo (parseNumber _val))) then {
    if ([true,_item,_diff] call DWEV_fnc_handlelnv) then {
        hint format["%1 hat dir %2 gegeben, aber du konntest nur %3 tragen, also wurden %4 zurückgegeben.",getPlayerDName(_from),_val,_diff,((parseNumber _val) - _diff)];
        [_from,_item,str((parseNumber _val) - _diff),_unit] remoteExec ["DWEV_fnc_giveDiff",_from];
    } else {
        [_from,_item,_val,_unit,false] remoteExec ["DWEV_fnc_giveDiff",_from];
    };
} else {
    if(([true,_item,(parseNumber _val)] call DWEV_fnc_handlelnv)) then {
        private "_type";
        _type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
        hint format["%1 hat dir %2 %3 gegeben.",getPlayerName(_from),_val,_type];
    } else {
        [_from,_item,_val,_unit,false] remoteExec ["DWEV_fnc_giveDiff",_from];
    };
};