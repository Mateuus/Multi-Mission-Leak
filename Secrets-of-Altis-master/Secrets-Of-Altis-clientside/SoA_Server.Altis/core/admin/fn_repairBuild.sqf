#include <macro.h>
/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_repairBuild.sqf
       Description: Deletes muahahaha

------------------------------------------------------------------------------*/

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private ["_yes","_object"];
_object = cursorobject;

_yes = [
		format["Möchtest du %1 wirklich entfernen?",(getModelInfo _object select 0)],
		"Objekt entfernen",
		"Ja",
		"Nein"
	] call BIS_fnc_guiMessage;

if (_yes) then {

	if(_object isKindOf "Air" OR _object isKindOf "Car" OR _object isKindOf "Ship") then {
		{deletevehicle _x} foreach (attachedObjects _object);
	};

	deletevehicle _object;
};