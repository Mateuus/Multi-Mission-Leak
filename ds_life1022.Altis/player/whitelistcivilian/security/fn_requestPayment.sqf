/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Charges your cursor target for services
*/

private["_value","_reason","_action"];

if(_this select 1)exitWith
	{
	[(_this select 0),true,true] call DS_fnc_handleMoney;
	hint format ["You have been paid $%1 by the police force",[(_this select 0)] call DS_fnc_numberText];
	};

if(isNil "DS_cursorTarget") exitWith {hint "You are not currently focused on any player";closeDialog 0};
if(isNull DS_cursorTarget) exitWith {hint "You are not currently focused on any player";closeDialog 0};
_value = ctrlText 1401;
_reason = ctrlText 1400;
if(!([_value] call DS_fnc_isNumber)) exitWith {hint "Invalid input";closeDialog 0};
if((parseNumber _value) > 999999) exitWith {hint "You can not charge more than $999,999";closeDialog 0};
if((parseNumber _value) < 1) exitWith {hint "You can not charge $0";closeDialog 0};

[(parseNumber _value),true,player] remoteExec ["DS_cop_paySecurity",DS_cursorTarget];
closeDialog 0;