/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Edited by bondz
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];

while{true} do
{
    _vehicleToFuel = (vehicle player);

    
    if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
    {
        _velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
        
        
        switch (typeOf (_vehicleToFuel)) do {
			case "B_Heli_Light_01_F":{_fuelConsumption = _velocityOfVehicle/75000 + 0.0001;};
			case "O_Heli_Light_02_unarmed_F":{_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
			case "B_Heli_Transport_01_F":{_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};
			case "I_Heli_light_03_unarmed_F":{_fuelConsumption = _velocityOfVehicle/10000 + 0.0001;};

            default {_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;}
        };
        
        if(_fuelConsumption > 0.002) then
        {
            _fuelConsumption = 0.002;
        };
        _vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
        
        //hint format["Benzinverbrauch: %1L/km",_fuelConsumption*10000/2];

        if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
        {
            hint "Tankreserve! Bitte nächstgelegene Tankstelle aufsuchen!";
        }
        else
        {
            if(fuel _vehicleToFuel < 0.03) then
            {
                hint "Ich hoffe du kannst Laufen- Du hast nähmlich keinen Sprit mehr!";
            };
        };
    };
    sleep 2;
};