#include "..\..\script_macros.hpp"

private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];

if (isNull _vehicle) exitWith {};

_vehicle say3D "caralarm";//Class name specified in description.ext

sleep 9.3;

_vehicle say3D "caralarm";//Class name specified in description.ext

sleep 9.3;

_vehicle say3D "caralarm";//Class name specified in description.ext