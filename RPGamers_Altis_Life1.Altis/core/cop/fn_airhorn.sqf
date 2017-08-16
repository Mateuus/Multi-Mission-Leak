/*private ["_hornLogic", "_vehicle"];

_vehicle = param [0,objNull,[objNull]];
_hornLogic = _this select 1;

// hide the object so no one can see it
hideObject _hornLogic;

// turn off damage and simulation on the object playing the siren
_hornLogic allowDamage false;
_hornLogic enableSimulation false;

// play the airhorn!
_hornLogic say3D "Airhorn";*/

#include "..\..\script_macros.hpp"

private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];

if (isNull _vehicle) exitWith {};

_vehicle say3D "Airhorn";//Class name specified in description.ext