private ["_object", "_locked", "_numDoors"]; 
 
_object = cursorTarget; 
if (isNull _object) exitWith {}; 
 
_locked = _object getVariable ["ga_locked", 0]; 
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors"); 
if (_locked == 0) then { 
 _locked = 1; 
 _object setVariable ["ga_locked", _locked, true];      
 for "_i" from 1 to _numDoors do 
 { 
  _object animateSource [format["Door_%1_source", _i], 0]; 
  _object setVariable[format["bis_disabled_Door_%1", _i], _locked, true]; 
 }; 
} else { 
 _locked = 0; 
 _object setVariable ["ga_locked", _locked, true]; 
 for "_i" from 1 to _numDoors do 
 { 
  _object setVariable[format["bis_disabled_Door_%1", _i], _locked, true]; 
 }; 
};