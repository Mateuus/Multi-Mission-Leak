#include "..\..\script_macros.hpp"
/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
if !(playerSide isEqualTo west) exitWith {hint localize "STR_Cop_wantedList_notCop";};
if ((lbCurSel 2406) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noPlayerSelected";};
if ((lbCurSel 2407) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noCrimeSelected";};
private _unit = lbData [2406,lbCurSel 2406];
_unit = call compile format ["%1",_unit];
private _amount = lbData [2407,lbCurSel 2407];
private _fahndungstext = lbText [2407,lbCurSel 2407];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

parseText format ["<t size='1.5' align='center' font='TahomaB'>Fahndung</t><br/><br/><t align='center' font='PuristaBold'>Gefahndete Person:</t><br/><t align='left'>%1</t><br/><br/><t align='center' font='PuristaBold'>Verbrechen:</t><br/><t align='left'>%2</t><br/><br/><t align='center' font='PuristaBold'>Ausgeschrieben von:</t><br/><t align='left'>%3</t>",_unit getVariable ["realname",name _unit],_fahndungstext,player getVariable ["realname",name player]] remoteExec ["hint",west];
[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];