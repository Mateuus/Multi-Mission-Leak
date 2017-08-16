/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_capacity"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {hint "You need to look at the vehicle you want to refuel!"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "You need to be closer to the vehicle!"};

if(!([false,"fuelF",1] call life_fnc_handleInv)) exitWith {};
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_capacity = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
titleText[format["Refuelling %1.....",_displayName],"PLAIN"];
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;

_tick = 20 / _capacity;
_level = (fuel _vehicle) + _tick;
if (_level > 1) then { _level = 1; };

if(!local _vehicle) then
{
	[[[_vehicle,_level],{_this select 0 setFuel (_this select 1);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
}
else
{
	_vehicle setFuel _level;
};
	
titleText[format["You have added 20 litres of fuel to the %1.",_displayName],"PLAIN"];
[true,"fuelE",1] call life_fnc_handleInv;