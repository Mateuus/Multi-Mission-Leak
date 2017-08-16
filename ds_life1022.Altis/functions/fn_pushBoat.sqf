/*
    Darkside Life

	Author: Unknown

	Description:
	Pushes a vehicle
*/

private ["_vehicle","_dir","_speed","_vel","_vehicleType","_vehicleName","_vehicleDist","_dist","_relPosModel","_minPoints","_maxPoints","_minX","_minY","_minZ","_maxX","_maxY","_maxZ","_rpmX","_rpmY","_rpmZ","_vehicleLimits","_playerPos","_headPos","_headDir"];

_vehicle = cursorTarget;
if(isNull _vehicle)exitWith{};

_playerPos = visiblePosition player;
_dir = getDir player;

if((_vehicle getVariable ["isMCUWater",false])&&(!(_vehicle getVariable ["packed",false])))exitWith{hint "You can not push an MCU boat when it is set up"};

_vehicleType = typeOf _vehicle;
_vehicleName = (getText (configFile >> "CfgVehicles" >> (_vehicleType) >> "displayName"));

if((_vehicle isKindOf "LandVehicle")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship"))then {
    _vehicleDist = player distance _vehicle;
    _dist = 2;
    _playerPos = [(_playerPos select 0) + (_dist*sin _dir),(_playerPos select 1) + (_dist*cos _dir),_playerPos select 2];
    _relPosModel = _vehicle worldToModel _playerPos;

    _boundPoints = boundingBox _vehicle;
    _minPoints = _boundPoints select 0;
    _maxPoints = _boundPoints select 1;
    _minX = _minPoints select 0;
    _minY = _minPoints select 1;
    _minZ = _minPoints select 2;
    _maxX = _maxPoints select 0;
    _maxY = _maxPoints select 1;
    _maxZ = _maxPoints select 2;

    //Relative offset position of _mineHead from nearest vehicle in model space
    _rpmX = _relPosModel select 0;
    _rpmY = _relPosModel select 1;
    _rpmZ = _relPosModel select 2;

    if(((_rpmX > _minX)&&(_rpmX < _maxX)&&(_rpmY > _minY)&&(_rpmY < _maxY)&&(_rpmZ > _minZ)&&(_rpmZ < _maxZ))||(_vehicleDist <= 3.5))then {
        _headPos = screenToWorld [0.5,0.5];
        _headDir = [
            (_headPos select 0)-(getPos player select 0),
            (_headPos select 1)-(getPos player select 1),
            (_headPos select 2)-(getPos player select 2)
        ];
        _dir = (_headDir select 0) atan2 (_headDir select 1);
        _speed = 6;
        _vel = velocity _vehicle;

        _vehicle setVelocity [(_vel select 0)+((sin _dir)*_speed),(_vel select 1)+((cos _dir)*_speed),1];

        //If object is a kind of boat, then slow it down or it will float away forever
        if(_vehicle isKindOf "Ship")then {
            sleep 1;
            _vehicle setVelocity [0,0,0];
        };
    };
};