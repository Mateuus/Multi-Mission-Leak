/*
	fn_disablecollisonwith.sqf
*/

if(!hasInterface) exitWith {};
private ["_object","_objects","_type","_unit","_units"];
_object=_this select 0;
_type=_this select 1;
_units = playableUnits;
_unit=objnull;
_objects = _object getvariable _type;
{
	_unit=_x;
	{
	//Disable collision on each object so they can't kill players
	_unit disablecollisionwith _x;
	//Disable simulation to prevent objects glitching/flying into the air/sinking into the ground
	_x enablesimulation false;
	} foreach _objects;
} foreach _units;