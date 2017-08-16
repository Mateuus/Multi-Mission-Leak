/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Speeds up fuel consumption
*/
private ["_vehicle","_index","_className","_side","_textureList","_crash"];
waitUntil {((isEngineOn (vehicle player))&&((driver(vehicle player)) == player)&&(((vehicle player) isKindOf "LandVehicle")||((vehicle player) isKindOf "Air")))};
while {((isEngineOn (vehicle player))&&((driver(vehicle player)) == player)&&(((vehicle player) isKindOf "LandVehicle")||((vehicle player) isKindOf "Air")))} do
	{
	_crash = random 100;
	//zero for testing
	if((!((vehicle player) getVariable ["vehAnimal",false]))&&(_crash > DS_crashRate)&&(DS_crashRate != 0))then
		{
		if(((date select 3) > 19)||((date select 3) < 4))then
			{
			if((!(isLightOn (vehicle player)))&&((vehicle player) isKindOf "landVehicle")&&(isOnRoad (vehicle player))&&(speed (vehicle player) > 60))then
				{
				[] spawn DS_fnc_vehCrash;//!!! ADD A VEHICLE SPEED TEST HERE!!!!
				};
			};
		};
	if((isEngineOn (vehicle player))&&(vehicle player isKindOf "landVehicle")) then 
		{
		if((vehicle player) getVariable ["fuel",false]) then
			{
			(vehicle player) setfuel ((fuel vehicle player) + 0.002);
			};
		if((vehicle player) getVariable ["fuelAdv",false]) then
			{
			(vehicle player) setfuel ((fuel vehicle player) + 0.004);
			};
			(vehicle player) setfuel ((fuel vehicle player) - 0.005);
		};  
		
	if((isEngineOn (vehicle player))&&(vehicle player isKindOf "Air")) then 
		{
		if ((getPos (vehicle player) select 2) > 700) then
					{
					if(!((headgear player) in ["H_PilotHelmetFighter_I","H_PilotHelmetFighter_B","H_CrewHelmetHeli_B"]))then
						{
						if(((driver (vehicle player)) getVariable ["policeSquad",""]) != "Coast Guard")then
							{
							_damage = (damage player);
							_damage = _damage + 0.03;
							player setDamage _damage;
							titleText [" !! ~~ You're losing health because you're flying too high without an oxygen mask on ~~ !! ","PLAIN"];
							titleCut ["","WHITE OUT",0];sleep 0.5;titleCut ["","WHITE IN",0];
							};
						};
					};
		if ((getPos (vehicle player) select 2) < 300) then
			{
			if((vehicle player) getVariable ["fuel",false]) then
				{
				(vehicle player) setfuel ((fuel vehicle player) + 0.001);
				};
			if((vehicle player) getVariable ["fuelAdv",false]) then
				{
				(vehicle player) setfuel ((fuel vehicle player) + 0.0025);
				};
				(vehicle player) setfuel ((fuel vehicle player) - 0.003);
			}
			else
			{
				if((vehicle player) getVariable ["fuel",false]) then
					{
					(vehicle player) setfuel ((fuel vehicle player) + 0.0002);
					};
				if((vehicle player) getVariable ["fuelAdv",false]) then
					{
					(vehicle player) setfuel ((fuel vehicle player) + 0.0025);
					};
				(vehicle player) setfuel ((fuel vehicle player) - 0.0015);
			};
		if(((driver (vehicle player)) == player)&&((player getVariable ["policeSquad",""]) == "Coast Guard"))then
			{
			(vehicle player) setfuel ((fuel vehicle player) + 0.0025);
			};
		};
	sleep 10;
	};
[] spawn DS_fnc_useFuel;






