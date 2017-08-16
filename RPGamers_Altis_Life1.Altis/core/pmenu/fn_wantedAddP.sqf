#include "..\..\script_macros.hpp"
/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
if !(playerSide isEqualTo west) exitWith {[localize "STR_Cop_wantedList_notCop",5,"gray"] call RPG_Fnc_Msg;};
if ((lbCurSel 2406) isEqualTo -1) exitWith {[localize "STR_Cop_wantedList_noPlayerSelected",5,"gray"] call RPG_Fnc_Msg;};
if ((lbCurSel 2407) isEqualTo -1) exitWith {[localize "STR_Cop_wantedList_noCrimeSelected",5,"gray"] call RPG_Fnc_Msg;};
if ((lbCurSel 2469) isEqualTo -1) exitWith {["You forgot to pick a multiplier",5,"gray"] call RPG_Fnc_Msg;};

private _unit = lbData [2406,lbCurSel 2406];
_unit = call compile format ["%1",_unit];
private _amount = lbData [2407,lbCurSel 2407];
private _multiplier = lbData [2469,lbCurSel 2469];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[1,"STR_Wanted_AddP",true,[_unit getVariable ["realname",name _unit],_amount,getPlayerUID _unit]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if (life_HC_isActive) then {
    [getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
	if (_multiplier isEqualTo "1x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "2x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "3x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "4x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "5x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "6x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "7x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "8x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "9x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "10x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "11x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "12x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "13x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "14x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "15x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "16x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "17x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "18x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "19x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
	if (_multiplier isEqualTo "20x") then {
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    	[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	};
};