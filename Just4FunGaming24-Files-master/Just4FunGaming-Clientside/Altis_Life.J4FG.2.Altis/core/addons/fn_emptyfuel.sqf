// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _position = getPos player;
private _baseConsumption = 0.001;

while{ true } do {

    uisleep 3;

    private _vehicle = (vehicle player);
    if( _vehicle != player && { isEngineOn _vehicle } &&  { driver _vehicle isEqualTo player } ) then {

        private _distance = round(player distance _position);

        // 1m distance = 0.00004 fuel consumed = 25km total Range
        private _consumption = 0.05 min ((_baseConsumption + (_distance * 0.00004)) * XY_ssv_FCF);

        // For helicopters and jets we reduce the consumption:
        if( _vehicle isKindOf "Air" ) then {
            _consumption = _consumption * XY_ssv_FCAF;
        };
        if( _vehicle isKindOf "Ship" ) then {
            _consumption = _consumption * XY_ssv_FCSF;
        };
        // For planes we further reduce consumption
        if( getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "maxSpeed") > 400 ) then {
            _consumption = _consumption * 0.25;
        };
        // Event vehicle(s) with reduced fuel consumption...
        if( (typeOf _vehicle) in ["O_Truck_03_fuel_F"] ) then {
            _consumption = _consumption * 0.5;
        };
        // Chip tuning Eco
        if( (_vehicle getVariable["chip.enabled", false]) && { (_vehicle getVariable["chip.type", 0]) isEqualTo 1 } ) then {
            _consumption = _consumption * 0.5;
        };
        if( playerSide in [ east, independent ] ) then {
            _consumption = _consumption * 0.33;
        };

        _vehicle setFuel( (fuel _vehicle) - _consumption );
    };
    _position = getPos player;
};