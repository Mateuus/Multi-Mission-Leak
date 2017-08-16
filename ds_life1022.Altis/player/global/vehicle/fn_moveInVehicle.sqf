/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Moves the player into an available seat of a vehicle
*/

params [["_vehicle",objNull,[objNull]]];

if(isNull _vehicle)exitWith{};

private _exit = false;
private _wasLocked = ((locked _vehicle) isEqualTo 2);

//Check for an available driver position
if((_vehicle emptyPositions "Driver") > 0)exitWith {
    [_vehicle,true] spawn DS_fnc_vehDoors;

    if(_wasLocked)then{_vehicle lock false;};
    player action ["GetInDriver",_vehicle];
    if(_wasLocked)then{_vehicle lock true;};
};

//Check for an available cargo position
{
    _x params ["_unit","_role","_cargoIndex","_turretPath","_personTurret"];

    if(isNull _unit)exitWith {
        [_vehicle,false] spawn DS_fnc_vehDoors;

        if(_wasLocked)then{_vehicle lock false;};
        player action ["GetInCargo",_vehicle,_cargoIndex];
        if(_wasLocked)then{_vehicle lock true;};

        _exit = true;
    };
} forEach (fullCrew [_vehicle,"cargo",true]);

if(_exit)exitWith{};

//Check for an available gunner position
if((_vehicle emptyPositions "Gunner") > 0)exitWith {
    [_vehicle,false] spawn DS_fnc_vehDoors;

    if(_wasLocked)then{_vehicle lock false;};
    player action ["GetInGunner",_vehicle];
    if(_wasLocked)then{_vehicle lock true;};
};

//Check for an available commander position
if((_vehicle emptyPositions "Commander") > 0)exitWith {
    [_vehicle,false] spawn DS_fnc_vehDoors;

    if(_wasLocked)then{_vehicle lock false;};
    player action ["GetInCommander",_vehicle];
    if(_wasLocked)then{_vehicle lock true;};
};

//Check for an available turret position
{
    _x params ["_unit","_role","_cargoIndex","_turretPath","_personTurret"];

    if((isNull _unit)&&(!(_vehicle lockedTurret _turretPath)))exitWith {
        [_vehicle,false] spawn DS_fnc_vehDoors;

        if(_wasLocked)then{_vehicle lock false;};
        player action ["GetInTurret",_vehicle,_turretPath];
        if(_wasLocked)then{_vehicle lock true;};

        _exit = true;
    };
} forEach fullCrew [_vehicle,"turret",true];

if(_exit)exitWith{};