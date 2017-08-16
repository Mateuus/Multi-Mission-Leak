// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

_unit = _this select 0;

_dropItem = {

    _spawn = _this select 0;
    _name = _this select 1;
    _value = _this select 2;

    _pos = _unit modelToWorld[ floor(random 4), floor(random 4), 0];
    _pos = [_pos select 0, _pos select 1, 0.15];

    _obj = _spawn createVehicle _pos;
    _obj setPos _pos;
    _obj setVariable["item", [_name, _value], true];

    "Land_ClutterCutter_small_F" createVehicle _pos;
};

{
    _value = missionNamespace getVariable [_x select 6, 0];
    if(_value > 0) then {
        [ "Land_Suitcase_F", _x select 0, _value ] call _dropItem;
        missionNamespace setVariable[_x select 6, 0];
    };
} forEach XY_virtItems;

XY_carryWeight = 0;

// Drop money
if( XY_CC > 0 ) then {
    [ "Land_Money_F", "money", XY_CC ] call _dropItem;
    XY_CC = 0;
};