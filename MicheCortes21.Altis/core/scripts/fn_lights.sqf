/*
 File: fn_lights.sqf
 Author: blackfisch
 Based on code by: nflug
 Description:
 Aufsteckblaulicht
*/
private _vehicle = vehicle player;
private _vehType = typeOf _vehicle;
if (isNull objectParent player) exitWith {}; //not in a vehicle
if (!alive player) exitWith {}; //not alive
if !(driver _vehicle isEqualTo player) exitWith {}; //not the driver
if !(_vehType in emergLight_vehicles) exitWith {}; //not defined vehicle
private _attachPoint = getArray(missionConfigFile >> "emergLightVehicles" >> _vehType >> "pos"); //get coordinates of attachment point
private _class = "Land_Camping_Light_off_F"; //classname of the object
if !(_vehicle getVariable ["light",false]) then {
 _vehicle setVariable ["light",true,true];
 _blaulicht = createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
 _vehicle setVariable ["lightObj",_blaulicht,true];
 _blaulicht attachTo [_vehicle, _attachPoint];
} else {
 _vehicle setVariable ["light",false,true];
 _vehicle setVariable ["lightObj",objNull,true];
 {
 if ((typeOf _x) isEqualTo _class) then {
 _vehicle setVariable ["lights",false,true];
 //detach _x;
 deleteVehicle _x;
 };
 } forEach (attachedObjects _vehicle);
};