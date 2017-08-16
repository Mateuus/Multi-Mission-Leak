// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _unit = _this select 0;
private _part = _this select 1;
private _damage = _this select 2;
private _source = _this select 3;
private _projectile = _this select 4;

// dampening of crash damage
if( isNull _source && _projectile isEqualTo "" && _part isEqualTo "" && vehicle player != player && speed vehicle player > 30 ) exitWith {
    private _delta = _damage - (damage player);
    damage player + (_delta * 0.5);
};

if( isNull _source ) exitWith {
    _damage;
};

if( isPlayer _source && { _projectile isEqualTo "" } && { (vehicle _source) isKindOf "LandVehicle" } ) exitWith {
    damage player;
};

if( _source isEqualTo _unit ) exitWith {
    _damage;
};

if( (side _source) isEqualTo west && { _projectile in ["B_9x21_Ball", "B_556x45_dual"] } && { (currentWeapon _source) in ["hgun_P07_snds_F", "hgun_P07_F", "arifle_SDAR_F"] } ) then {

    _damage = damage player;

    private _distance = [35, 100] select ( _projectile isEqualTo "B_556x45_dual" );

    if( _unit distance _source < _distance && { !XY_isTazed } && { !(_unit getVariable["restrained", false]) } ) then {
        private _isVehicle = (vehicle player) != player;
        private _isQuad = _isVehicle && { typeOf (vehicle player) in [ "B_Quadbike_01_F", "C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F" ] };
        if( _isQuad ) then {
            player action ["Eject", vehicle player];
        };
        if( !_isVehicle || _isQuad ) then {
            [_unit, _source] spawn XY_fnc_tazed;
        };
    };
};

_damage;