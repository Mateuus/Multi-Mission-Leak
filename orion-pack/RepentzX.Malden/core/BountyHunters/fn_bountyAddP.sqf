#include "..\..\script_macros.hpp"
/*
    File: fn_bountyAddP.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description: Gather the required info to send to the DB. 
*/
if !(playerSide isEqualTo civilian) exitWith {[localize "STR_bounty_bountyList_notBH",true,"slow"] call life_fnc_notificationSystem;};
if ((lbCurSel 240600) isEqualTo -1) exitWith {[localize "STR_bounty_bountyList_noPlayerSelected",true,"slow"] call life_fnc_notificationSystem;};
if ((lbCurSel 240700) isEqualTo -1) exitWith {[localize "STR_bounty_bountyList_noAmountSelected",true,"slow"] call life_fnc_notificationSystem;};
private _unit = lbData [240600,lbCurSel 240600];
_unit = call compile format ["%1",_unit];
private _amount = lbData [240700,lbCurSel 240700];
private _unitsToNotify = [];
private _amountP = parseNumber _amount;
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
{
	if(license_civ_bountyH) then {_unitsToNotify pushBack _x};
} forEach playableUnits;

if (life_houseProtect < _amountP) then {
	["You do not have the selected amount, visit an atm or select a lower bounty.",false,"slow"] call life_fnc_notificationSystem;
} else {
	[1,[_unit,60,"Mil_dot","THE BOUNTY HUNTERS TARGET LAST KNOWN POSITION"]] remoteExec ["life_fnc_markers",_unitsToNotify];
	life_houseProtect = life_houseProtect - _amountP;
	
	if (life_HC_isActive) then {
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_bountyAdd",HC_Life];
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_bountyAmountGather",HC_Life];
	} else {
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_bountyAdd",RSERV];
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_bountyAmountGather",RSERV];
	};
};

