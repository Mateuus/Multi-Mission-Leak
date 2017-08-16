/*
	File: fn_pickupOil.sqf
	Author: Alan

	Description:
	Pickup oil barrel for transport.
*/

_barrel = cursorTarget;
if (isNull _barrel) exitWith {};

if ((typeOf _barrel) in IL_Supported_Vehicles_BOAT && !isNull (_barrel getVariable ["oil_barrel", objNull])) then
{
	_barrel = _barrel getVariable ["oil_barrel", objNull];
	_vehicle = attachedTo _barrel;
	detach _barrel;
	_vehicle setVariable ['oil_barrel', nil, true];
};

if (typeOf _barrel != "Land_MetalBarrel_F") exitWith {};
if(!isNull (player getVariable ["currentlyEscorting",objNull])) exitWith { hint "You can't hold more than one thing at a time, silly!" };
//if(!isNull (attachedTo _barrel)) exitWith {hint "This barrel is currently being handled!"};
if(vehicle player != player) exitWith {hint "Cannot pick up oil while in a vehicle!"};
if(currentWeapon player != "") exitWith {hint "You must holster your weapon before you can pick this up!";};

_barrel attachTo [player,[0,1,1]];
player forceWalk true;
life_holding_barrel = _barrel;

[_barrel] spawn {
	_barrel = _this select 0;
	while {true} do {
		if(!alive player) exitWith {};
		if(currentWeapon player != "") exitWith {};
		if(vehicle player != player) then {player action ["Eject", vehicle player]};
		if(isNull life_holding_barrel) exitWith {};
		if(!isNull ((player getVariable ["escorted_by",[objNull, false]]) select 0)) exitWith {};
	};
	if(!isNull life_holding_barrel) exitWith {[true,true,dropOilAction,_barrel] call life_fnc_dropOil;};
};