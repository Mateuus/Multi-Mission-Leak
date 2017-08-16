#include <macro.h>
/*
      Original idea by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Script completly rewritten by Play Germany (RafiQuak, Felix)
*/

private["_vehicleToFuel","_vehicleType","_speed","_fuelConsumption","_fuelDisplay","_vehicleFuelCapacity","_fuelSpeedIncreaseMultiplier","_fuelConsumptionCorrectedByCapacity","_vehicleEnginePower","_vehicleRedRpm","_vehicleMaxSpeed","_vehicleIdleRpm","_vehicleIdleEngineRpm","_vehicleMultipliedEngineRpm","_vehicleCurrentMass","_vehicleInMovementOffset"];

while{true} do
{
    waitUntil { uiSleep 1; vehicle player != player };

    _vehicleToFuel = (vehicle player);
    _vehicleType = typeOf _vehicleToFuel;

    if (_vehicleToFuel != player && isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && _vehicleToFuel isKindOf "Car") then
    {
        _vehicleMaxSpeed = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_vehicleType,"maxSpeed");
        _vehicleEnginePower = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_vehicleType,"enginePower");
        _vehicleRedRpm = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_vehicleType,"redRpm");
        _vehicleIdleRpm = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_vehicleType,"idleRpm");
        _vehicleFuelCapacity = [_vehicleType] call PG_fnc_vehFuelCap;
        _vehicleCurrentMass = sqrt(getMass _vehicleToFuel);

        // correct the engine power depending on the mass of the vehicle
        // this is required because we do not have any information about the engine cubic capacity
        _vehicleEnginePower = (_vehicleEnginePower + (_vehicleCurrentMass * 45));

        _vehicleIdleEngineRpm = (_vehicleIdleRpm * _vehicleEnginePower) / 45000;
        _vehicleMultipliedEngineRpm = ((_vehicleRedRpm - _vehicleIdleRpm) / _vehicleMaxSpeed) * _vehicleEnginePower / 55000;

        while {_vehicleToFuel != player && isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player)} do
        {
            _speed = speed _vehicleToFuel;
            if (_speed < 0) then { _speed = _speed * (-1); };

            _fuelConsumption = (_vehicleIdleEngineRpm + _vehicleMultipliedEngineRpm * _speed) / 135000;

            _vehicleInMovementOffset = 0;
            if (_speed != 0) then { _vehicleInMovementOffset = _vehicleCurrentMass / 150000; };
            _fuelConsumption = _fuelConsumption + _vehicleInMovementOffset;

            // recognize the fuel capacity of the vehicle
            //_fuelConsumptionCorrectedByCapacity = (((((((_fuelConsumption * 200000 / 2) / 10) * 1.3) / 100)*(_speed/1800))/_vehicleFuelCapacity) * 24);  //((l/km)*km)/capacity
			//_fuelConsumptionCorrectedByCapacity = (((_fuelConsumption * 130*(_speed/1800))/_vehicleFuelCapacity) * 24);
			//_fuelConsumptionCorrectedByCapacity = ((_fuelConsumption * 3120 *(_speed/1800))/_vehicleFuelCapacity);
			_fuelConsumptionCorrectedByCapacity = ((_fuelConsumption * 347 *(_speed/200))/_vehicleFuelCapacity);
			
            // check for minimum fuel consumption
            /*if(_fuelConsumptionCorrectedByCapacity <= 0.0001) then
            {
                _fuelConsumptionCorrectedByCapacity = 0.0001;
            };*/
            [[_vehicleToFuel, ((fuel _vehicleToFuel) - _fuelConsumptionCorrectedByCapacity)],"life_fnc_setFuel",_vehicleToFuel,false] spawn life_fnc_MP;

            //_fuelDisplay = round((_fuelConsumption * 200000 / 2)* 1.3) / 10;
            _fuelDisplay = round(_fuelConsumption * 130000) / 10;

            if (!visibleMap) then {
                //hint format["Real: %1\nCorrected: %2", _fuelConsumptionCorrectedByCapacity, (_fuelConsumptionCorrectedByCapacity * 0.65)];
                //hintSilent format["Speed: %1\nMaxSpeed: %2\nEnginePower: %3\nRedRpm: %4\nIdleRpm: %5\nFuelCap: %6\n\nIdleEngineRpm: %7\nMultipliedEngineRpm: %8\nFuelConsump: %9\nCorrected FC: %10\nMove Offset: %11", _speed, _vehicleMaxSpeed, _vehicleEnginePower, _vehicleRedRpm, _vehicleIdleRpm, _vehicleFuelCapacity, _vehicleIdleEngineRpm, _vehicleMultipliedEngineRpm, _fuelConsumption,_fuelConsumptionCorrectedByCapacity,_vehicleInMovementOffset];
                [format["<t color='#ffffff' size = '.45'>%1 l/100km</t>", _fuelDisplay], -0.95, -0.295, 2.01, 0, 0, 11126] spawn BIS_fnc_dynamicText;
            };

            if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
            {
                hint "Du hast kaum noch Sprit und solltest eine Tankstelle anfahren!";
            }
            else
            {
                if(fuel _vehicleToFuel < 0.03) then
                {
                    hint "Du hast kein Sprit mehr. Entweder du rufst Hilfe oder läufst...";
                };
            };

            uiSleep 2;
        };
    };
};