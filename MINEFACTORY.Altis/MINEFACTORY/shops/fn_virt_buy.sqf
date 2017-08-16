#include "..\..\script_macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint  "Du musst einen Gegenstand auswählen, um ihn zu kaufen."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint  "Du hast keine echte Zahl eingegeben";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint  "Du hast für diese Menge nicht genug Platz!"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > CASH && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint  "Du hast nicht so viel Geld!"};
if((time - life_action_delay) < 0.2) exitWith {hint  "Du führst bereits eine Aktion aus. Bitte warte, bis diese beendet ist.Delay";};
life_action_delay = time;

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[( "Die Gang hat genügend Geld, um dafür zu zahlen. Willst du mit dem Geld der Gang oder deinem eigenen bezahlen?")+ "<br/><br/>" +( "Geld der Gang:")+ " <t color='#8cff9b'>$%1</t><br/>" +( "Bargeld:")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[CASH] call life_fnc_numberText
			],
			 "Mit Bargeld oder Geld der Gang bezahlen",
			 "Geld der Gang",
			 "Bargeld"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[ "Du kaufst %1 %2 für $%3 mit dem Geld der Gang",_amount,( _name),[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			
			if(life_HC_isActive) then {
				[1,grpPlayer] remoteExecCall ["HC_fnc_updateGang",HC_Life];
			} else {
				[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];
			};
			
		} else {
			if((_price * _amount) > CASH) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint  "Du hast nicht so viel Geld!";};
			hint format[ "Du kaufst %1 %2 für $%3",_amount,( _name),[(_price * _amount)] call life_fnc_numberText];
			SUB(CASH,_price * _amount);
		};
	} else {
		if((_price * _amount) > CASH) exitWith {hint  "Du hast nicht so viel Geld!"; [false,_type,_amount] call life_fnc_handleInv;};
		hint format[ "Du kaufst %1 %2 für $%3",_amount,( _name),[(_price * _amount)] call life_fnc_numberText];
		SUB(CASH,(_price * _amount));
	};
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
