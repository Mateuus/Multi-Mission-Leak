#include "..\..\script_macros.hpp"
/*
    File: fn_buyDebit.sqf
    Author: Ilusionz

    Description:
    Handles the purchase of Debit Cards from the ATM Menu.
*/
private ["_debitPrice","_id"];
_id = getPlayerUID player;
_debitPrice = LIFE_SETTINGS(getNumber,"debit_price");
if (life_has_debit isEqualTo true) exitWith {[localize "STR_Debit_AlreadyOwned",true,"slow"] call life_fnc_notificationSystem;};
if ((LIFE_SETTINGS(getNumber,"item_debit") isEqualTo 1) && (life_inv_debitcard > 0)) exitWith {[localize "STR_Debit_AlreadyOwned",true,"slow"] call life_fnc_notificationSystem;};
if (_debitPrice > civRDM) exitWith {hint format [localize "STR_Debit_NotEnoughCash",[_debitPrice - civRDM] call life_fnc_numberText];};
civRDM = civRDM - _debitPrice;

if (life_HC_isActive) then {
    [_id] remoteExecCall ["HC_fnc_debitBought",HC_Life];
} else {
    [_id] remoteExecCall ["TON_fnc_debitBought",RSERV];
};

if (LIFE_SETTINGS(getNumber,"item_debit") isEqualTo 1) then {
	[true,"debitcard",1] call life_fnc_handleInv; 
	[3] call SOCK_fnc_updatePartial;
	[] call life_fnc_atmMenu;
} else {
	life_has_debit = true;
	[8] call SOCK_fnc_updatePartial;
	[] call life_fnc_atmMenu;
};

hint format [localize "STR_Debit_Purchased",[_debitPrice] call life_fnc_numberText];