private ["_return"];

if(!params [["_object", objNull, [objNull]],["_kinds", [], [[]]]])exitWith{};
    
_return = false;
{if(_object isKindOf _x) exitWith {_return = true;};} forEach _kinds;
_return;