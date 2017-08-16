#include "..\..\script_macros.hpp"

private ["_hideoutCount","_income"];
if ((playerSide == west) || (playerSide == independent)) exitWith {}; 
_hideoutCount = 0;
_income = 0;

{
	_owner = _x getVariable ["gangOwner",grpNull];
	if (group Player == _owner) then {_hideoutCount = _hideoutCount + 1;};
}forEach [gang_flag_1,gang_flag_2,gang_flag_4];

//You dont have any hideouts :(
if (_hideoutCount <= 0) exitWith {};

_income = 0  + (2000 * _hideoutCount);

if ([life_currentExpPerks, "stronghold"] call mav_ttm_fnc_hasPerk) then {
    _income = _income + 1500;
};

life_atmbank = life_atmbank + _income;

systemChat format["You recieved an additional $%1 income from controlling %2 gang hideout(s)",_income,_hideoutCount];