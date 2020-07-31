/*
	File: fn_packupBarGate.sqf
	Author: sc
	
	Description:
	Packs up the nearestBarGate.
*/

private["_bargate","_bargateobjects"];
_bargate = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0;
if(isNil "_bargate") exitWith {};
if(!isnil {_bargate getVariable "bargate"}) then
{	
	if (typeOf _bargate == "RoadCone_F") then {
	_bargateobjects = _bargate getVariable "bargate";	
	if(([true,"BarGate",1] call life_fnc_handleInv)) then
	{
	["Podniosles szlaban", false] spawn domsg;
	{deleteVehicle _x} foreach _bargateobjects;
	};
};
};