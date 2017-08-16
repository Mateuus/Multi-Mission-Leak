/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
params [
  ["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};
_drink = (_unit getVariable["BAC",0]);
if(_drink > 0.1) then {
  hintSilent format["BAC: %2\n\n They are at, or over the legal limit!",[_drink] call life_fnc_rupadudejat];
} else {
  hintSilent format["BAC: %2\n\n Under the legal limit!",[_drink] call life_fnc_rupadudejat];
};
