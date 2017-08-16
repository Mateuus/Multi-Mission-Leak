#include "..\..\script_macros.hpp"
/*
	File: fn_gangUpgrade.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer GVAR ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * ((LIFE_SETTINGS(getNumber,"gang_upgradeBase"))) / ((LIFE_SETTINGS(getNumber,"gang_upgradeMultiplier"))));

_action = [
	format[( "Du bist dabei, die maximale Anzahl an Mitgliedern zu erhöhen.")+ "<br/><br/>" +( "Aktuelles Maximum: %1")+ "<br/>" +( "Maximum erhöhen: %2")+ "<br/>" +( "Preis:")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	 "Maximale Anzahl an Gang Mitgliedern erhöhen",
	 "Kaufen",
	 "Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < _upgradePrice) exitWith {
		hint parseText format[
			( "Du hast nicht genug Geld auf deinem Bankkonto, um das Mitgliederlimit deiner Gang zu erhöhen.")+ "<br/><br/>" +( "Aktuell:")+ " <t color='#8cff9b'>$%1</t><br/>" +( "Fehlend:")+ " <t color='#FF0000'>$%2</t>",
			[BANK] call life_fnc_numberText,
			[_upgradePrice - BANK] call life_fnc_numberText
		];
	};
	SUB(BANK,_upgradePrice);
	grpPlayer SVAR ["gang_maxMembers",_slotUpgrade,true];
	hint parseText format[ "Du hast für <t color='#8cff9b'>$%3</t> von %1 auf %2 Plätze erhöht",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	
	if(life_HC_isActive) then {
		[2,grpPlayer] remoteExec ["HC_fnc_updateGang",HC_Life];
	} else {
		[2,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV];
	};
	
} else {
	hint  "Aufwertung abgebrochen.";
};