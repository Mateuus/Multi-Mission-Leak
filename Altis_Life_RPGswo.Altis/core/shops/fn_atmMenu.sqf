#include "..\..\macros.hpp"
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type","_ownerID"];

if(DWEV_lock_atms) exitWith {hint "Es wurde irgendwo ein Safe geknackt. Zur Sicherheit wurden die Bankautomaten gesperrt.";};
if(!DWEV_use_atm) exitWith {hint "Wegen deinem Raub ist dein Konto für einige zeit gesperrt.";};

if(!dialog) then
{
	if(!(createDialog "DWEV_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;
_ownerID = grpPlayer getVariable["gang_owner",""];

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> %1€<br/><img size='1.6' image='icons\money.paa'/> %2€",[dwf_atmcash] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText];

{
	if(alive _x && _x != player && (_x getVariable["realname",name _x] != "HC_1")) then
	{
		
		_type = _x getVariable["playertype",""];
		_units lbAdd format["%1 (%2)",getPlayerName(_x),_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];


// GANG BEREICH
_members = grpPlayer getVariable ["gang_members",[]];
_ownRank = 0;

if(isNil {(grpPlayer getVariable "gang_bank")}) then 
{
		(getControl(2700,2705)) ctrlShow false;
		(getControl(2700,2706)) ctrlShow false;
};

{
	if (steamid IN _x) exitWith
	{
		_ownRank = (_x select 2);
	};
	false;
} count _members;

if(_ownerID != steamid && _ownRank < 6) then
{
	(getControl(2700,2706)) ctrlShow false; //Upgrade
};



//////////////////////////////////////////////////

if (__GETC__(DWEV_coplevel) >= 8) then
{
	_stateWithdrawBTN = (getControl(2700,2706));
	_stateWithdrawBTN ctrlSetText "Von Staatskonto";
	_stateWithdrawBTN ctrlShow true;
};

if (__GETC__(DWEV_coplevel) > 0) then
{
	_stateDepositBTN = (getControl(2700,2705));
	_stateDepositBTN ctrlSetText "Auf Staatskonto";
	_stateDepositBTN ctrlShow true;	
};

