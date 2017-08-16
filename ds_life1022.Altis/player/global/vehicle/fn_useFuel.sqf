/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Speeds up fuel consumption
*/

private ["_vehicle","_crash","_damage"];

waitUntil {((isEngineOn (vehicle player))&&((driver (vehicle player)) isEqualTo player)&&(((vehicle player) isKindOf "LandVehicle")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")))};

while {((isEngineOn (vehicle player))&&((driver (vehicle player)) isEqualTo player)&&(((vehicle player) isKindOf "LandVehicle")||((vehicle player) isKindOf "Air")||((vehicle player) isKindOf "Ship")))} do
	{
	_vehicle = vehicle player;
	_crash = random 100;

	//Zero for testing
	if((!(_vehicle getVariable ["vehAnimal",false]))&&(_crash > DS_crashRate)&&(DS_crashRate != 0))then
		{
		if(((date select 3) > 19)||((date select 3) < 4))then
			{
			if((!(isLightOn _vehicle))&&(_vehicle isKindOf "LandVehicle")&&(isOnRoad _vehicle)&&(speed _vehicle > 60))then
				{
				[] spawn DS_fnc_vehCrash;
				};
			};
		};

	if((isEngineOn _vehicle)&&(_vehicle isKindOf "LandVehicle"))then
		{
		if(_vehicle getVariable ["fuel",false])then
			{
			_vehicle setFuel ((fuel _vehicle) + 0.002);
			};
		if(_vehicle getVariable ["fuelAdv",false])then
			{
			_vehicle setFuel ((fuel _vehicle) + 0.004);
			};
		_vehicle setFuel ((fuel _vehicle) - 0.005);
		};

	if((isEngineOn _vehicle)&&(_vehicle isKindOf "Ship"))then
		{
		if(_vehicle getVariable ["fuel",false])then
			{
			_vehicle setFuel ((fuel _vehicle) + 0.002);
			};
		if(_vehicle getVariable ["fuelAdv",false])then
			{
			_vehicle setFuel ((fuel _vehicle) + 0.004);
			};
		_vehicle setFuel ((fuel _vehicle) - 0.005);
		};

	if((isEngineOn _vehicle)&&(_vehicle isKindOf "Air"))then
		{
		if((getPos _vehicle select 2) > 700)then
			{
			if(!((headgear player) in ["H_PilotHelmetFighter_I","H_PilotHelmetFighter_B","H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O"]))then
				{
				if(((driver _vehicle) getVariable ["policeSquad",""]) != "Coast Guard")then
					{
					_damage = (damage player);
					_damage = _damage + 0.03;
					player setDamage _damage;
					titleText [" !! ~~ You're losing health because you're flying too high without an oxygen mask on ~~ !! ","PLAIN"];
					titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
					};
				};
			};

		if((getPos _vehicle select 2) < 300)then
			{
			if(_vehicle getVariable ["fuel",false])then
				{
				_vehicle setFuel ((fuel _vehicle) + 0.001);
				};
			if(_vehicle getVariable ["fuelAdv",false])then
				{
				_vehicle setFuel ((fuel _vehicle) + 0.0025);
				};
			_vehicle setFuel ((fuel _vehicle) - 0.003);
			}
			else
			{
			if(_vehicle getVariable ["fuel",false])then
				{
				_vehicle setFuel ((fuel _vehicle) + 0.0002);
				};
			if(_vehicle getVariable ["fuelAdv",false])then
				{
				_vehicle setFuel ((fuel _vehicle) + 0.0025);
				};
			_vehicle setFuel ((fuel _vehicle) - 0.0015);
			};

		if(((driver _vehicle) isEqualTo player)&&((player getVariable ["policeSquad",""]) == "Coast Guard"))then
			{
			_vehicle setFuel ((fuel _vehicle) + 0.0025);
			};
		};

	sleep 10;
	};

[] spawn DS_fnc_useFuel;