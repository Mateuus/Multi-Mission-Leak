/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 *
 * Checks whether the object is (a subtype) of the given type.
 * @param {Object|String} object - Target object or typeName.
 * @param {Array|String} typeName - Types to check against.
 * @param {Config} targetConfig - Target config.
 * @returns {Boolean} TRUE if subtype matches, FALSE otherwise.
 */

 params [
  ["_object", objNull, [objNull, ""]],
  ["_class", "", ["", []]],
  ["_targetConfig", configFile >> "CfgVehicles", [configFile]]
];
private _return = false;

//--- Convert object to className
if (typeName _object == typeName objNull) then {
  _object = typeOf _object;
};

//--- Convert single type to array
if (typeName _class != typeName []) then {
  _class = [_class];
};

//--- Check until match
{
  if (_object isKindOf [_x, _targetConfig]) exitWith {_return = true};
} count _class;

_return
