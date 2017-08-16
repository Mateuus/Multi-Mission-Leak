#include "..\..\script_macros.hpp"

if !(playerSide isEqualTo civilian) exitWith {[localize "STR_bounty_bountyList_notBH",5,"gray"] call RPG_Fnc_Msg;};
if ((lbCurSel 240600) isEqualTo -1) exitWith {[localize "STR_bounty_bountyList_noPlayerSelected",5,"gray"] call RPG_Fnc_Msg;};
if ((lbCurSel 240700) isEqualTo -1) exitWith {[localize "STR_bounty_bountyList_noAmountSelected",5,"gray"] call RPG_Fnc_Msg;};
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

if (life_cash < _amountP) then {
	["Not enough money",5,"gray"] call RPG_Fnc_Msg;
} else {
	[1,[_unit,60,"Mil_dot","THE BOUNTY HUNTERS TARGET LAST KNOWN POSITION"]] remoteExec ["life_fnc_markers",_unitsToNotify];
	life_cash = life_cash - _amountP;
	
	if (life_HC_isActive) then {
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_bountyAdd",HC_Life];
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_bountyAmountGather",HC_Life];
	} else {
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_bountyAdd",RSERV];
		[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_bountyAmountGather",RSERV];
	};
};

