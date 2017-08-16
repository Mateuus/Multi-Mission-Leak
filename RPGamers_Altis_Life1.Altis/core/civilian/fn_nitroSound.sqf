#include "..\..\script_macros.hpp"

private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];

if (isNull _vehicle) exitWith {};

_vehicle say3D "nitro";//Class name specified in description.ext