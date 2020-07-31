/*
	fn_enablecollisionwith.sqf
*/

if(!hasInterface) exitWith {};

params ["_object", "_type", "_units", "_unit" , "_objects"];

_units = playableUnits;
_unit=objnull;
_objects = _object getvariable _type;
{
	_unit=_x;
	{
	//Enable collision on each object
	_unit enablecollisionwith _x;
	//Enable simulation to see if objects still glitch/fly into the air/sink into the ground
	_x enablesimulation true;
	} foreach _objects;
} foreach _units;