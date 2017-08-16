/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!hasInterface) exitWith {};
params [["_type", 0, [0]], ["_unit", objNull, [objNull]], ["_message", "", ["", []]]];

//--- Localize
if (typeName _message == typeName []) then {
  if (isLocalized (_message select 0)) then {
    _message set [0, localize (_message select 0)];
  };

  //--- Format
  _message = format _message;
} else {
  if (isLocalized _message) then {
    _message = localize _message;
  };
};

//--- Type
switch _type do {
  case 0: {_unit sideChat _message};
  case 1: {_unit groupChat _message};
  case 2: {vehicle _unit vehicleChat _message};
  default {};
};
