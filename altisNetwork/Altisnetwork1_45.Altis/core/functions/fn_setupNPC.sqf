#include "..\..\script_macros.hpp"

private ["_unit", "_title", "_subtitle"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_uniform = [_this, 1, "", [""]] call BIS_fnc_param;
_textures = [_this, 2, [], [[]]] call BIS_fnc_param;
_title = [_this, 3, "", [""]] call BIS_fnc_param;
_subtitle = [_this, 4, "NPC", [""]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

//Disable AI, remove weapons
removeAllWeapons _unit;

//AI sometimes get stuck in the gun holding animation
if (primaryWeapon _unit isEqualTo "") then { _unit switchmove "AmovPercMstpSnonWnonDnon" };
	
sleep 0.1;
_unit setDamage 0;
_unit allowdamage false;
_unit enableSimulation false;

//Title
if (_title != "") then {
	_unit setVariable ["nametagTitle", _title];
	_unit setVariable ["nametagSubtitle", _subtitle];
};

//Add uniform
if (_uniform != "") then {

	if (local _unit) then {
	_unit forceAddUniform _uniform;
	};
	waitUntil { uniform _unit == _uniform };
};

//If a uniform is specified, add it
{
  _unit setObjectTexture [_forEachIndex, _x];
} forEach _textures;

_unit setVariable ["NPC_UNIT",true,true];