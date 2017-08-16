#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * (__GETC__(DWEV_gangUpgradeBase)) / (__GETC__(DWEV_gangUpgradeMultipler)));
_members = grpPlayer getVariable "gang_members";
_ownRank = 0;

{
	if ((getPlayerUID player) IN _x) exitWith
	{
		_ownRank = (_x select 2);
	};
	false;
} count _members;

if (_ownRank < 2) exitWith {hint "Das Upgraden der Gang ist erst ab SERGEANT möglich"};

_action = [
	format["Du bist dabei, die maximale anzahl der Gangmitglieder zu erhöhen.<br/><br/>Aktuelles Max: %1<br/>Upgraded Max: %2<br/>Preis: <t color='#8cff9b'>%3€</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call DWEV_fnc_numberText],
	"Upgraden der maximalen Gang Mitglieder",
	"Kaufen",
	"Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	_funds = grpPlayer getVariable "gang_bank";
	if(_funds < _upgradePrice) exitWith 
	{
		hint parseText format[
			"Die Gang hat nicht genug Geld auf dem Konto um die maximale Gangmitglieder Zahl zu erhöhen.<br/><br/>Aktuell: <t color='#8cff9b'>%1€</t><br/>Fehlend: <t color='#FF0000'>%2€</t>",
			[_funds] call DWEV_fnc_numberText,
			[_upgradePrice - _funds] call DWEV_fnc_numberText
		];
	};
	
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format["Du hast die Plätze der Gang von %1 auf %2 für <t color='#8cff9b'>%3€</t> erhöht.",_maxMembers,_slotUpgrade,[_upgradePrice] call DWEV_fnc_numberText];
	[2,grpPlayer] remoteExec ["DWF_fnc_updateGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	[grpPlayer,_upgradePrice] remoteExec ["DWF_fnc_gangBankWithdraw",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
} 
else 
{
	hint "Upgrade abgebrochen.";
};