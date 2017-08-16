/*
	File: fn_openBankVault.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Start drilling the bank vault door.
*/

if (life_action_in_use) exitWith {};
if (life_bank_drilling) exitWith {hint "The bank vault is already being drilled!"};
if (life_bank_last > serverTime - 1800) exitWith {hint format["The bank has recently been robbed and is on lockdown! Try again in %1 minute(s).", ceil( ((life_bank_last + 1800) - serverTime) / 60 ) ]};
if (!([4] call life_fnc_policeRequired)) exitWith {};

_doorPos = getMarkerPos "life_bank_door";
if ((player distance _doorPos) > 3) exitWith {};

[[player],"ASY_fnc_bankDrillVault",false,false] spawn life_fnc_MP;

hint "You have begun drilling the vault door! Drilling will complete in 10 minutes and will fail if you are killed or restrained within that time. You must stay within 60 meters.";