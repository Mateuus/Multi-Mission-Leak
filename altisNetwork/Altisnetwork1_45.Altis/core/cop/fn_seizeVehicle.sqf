#include "..\..\script_macros.hpp"

//private["_crushRank","_Btn7"];

// -- Police Constable
//if (FETCH_CONST(life_coplevel) < _crushRank) then {_Btn7 ctrlEnable false;};
/*
// -- Only allow crushing
{
	if ( ( player distance ( getMarkerPos _x ) < 30 ) ) exitWith {};
} forEach [ "scrapyard", "scrapyard_1", "scrapyard_2" ];
*/
life_action_inuse = true;

private _text = "Crushing Vehicle";
private _vehicle = cursorTarget;

private _vehicleName = FETCH_CONFIG2(getText, "CfgVehicles",(typeOf _vehicle),"displayName");
//private _price = M_CONFIG(getNumber,"CfgVehicles",(typeOf _vehicle),"seizeValue");
_price = 10000;

private _pid = getPlayerUID player;

// -- Progress Bar
disableSerialization;

//_crushRank = LIFE_SETTINGS(getNumber,"crushing_minimum_rank");

// -- Setup Progress Bar
"vehicleSeize" cutRsc [ "progressBar", "PLAIN" ];

private "_cP";

// -- Setup Progress Bar
private _ui = uiNameSpace getVariable "progressBar";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_text];
_progress progressSetPosition 0.001;
_cP = 0.001;

private "_success";
_success = false;

// -- Loop
while { true } do {

	sleep 0.001;

	_cP = _cP + 0.001;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format [ "%3 (%1%2)...", round( _cP * 100 ), "%", _text ];

	if ( _cP >= 1 ) exitWith { _success = true; };
	if ( !alive player || !life_action_inUse ) exitWith {};

};

"vehicleSeize" cutText [ "", "PLAIN" ];
life_action_inUse = false; // -- Enable input

// -- Progress
if ( _success ) then {

	// -- Delete vehicle from world
	deleteVehicle _vehicle;

	 // -- Shoot information notification
	[ 0, format [ "You crushed a %1. You recieved a bonus of €%1. Good work!", _vehicleName, _price ] ] call life_fnc_broadcast;

};

// -- Give them the Money
life_money_bank = life_money_bank + _price;
