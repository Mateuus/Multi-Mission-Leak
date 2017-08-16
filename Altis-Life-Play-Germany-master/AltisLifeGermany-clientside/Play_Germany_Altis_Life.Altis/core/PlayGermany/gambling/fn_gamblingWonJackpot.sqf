#include <macro.h>
/*
	File: fn_gamblingSetBlockerVariable.sqf
	Author: Wolfgang Bahmüller

	Description:
	Gambling Gambling Gambling!!!
*/

private["_jackpot"];

_jackpot = [_this,0,0,[0]] call BIS_fnc_param;
if(_jackpot <= 0) exitWith {};

ADD(CASH, _jackpot);
[] call life_fnc_hudUpdate;
//save data to db
//[1,true] call SOCK_fnc_updateRequest;

//hint format["Won the Jackpot=%1", _jackpot];

[objNull,"Jackpot", true] call life_fnc_globalSound;
[[2,"Der Jackpot wurde geknackt!",false],"life_fnc_broadcast",true,false] spawn life_fnc_MP;