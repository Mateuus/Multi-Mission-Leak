/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs when a player gets in a vehicle
*/

params ["_player","_position","_vehicle"];

if((_position isEqualTo "cargo")&&{(typeOf _vehicle) in ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F"]}&&{(_vehicle getVariable ["setUp",0]) isEqualTo 0}&&{!(_vehicle getVariable ["policeVehicle",false])})exitWith {
	player action ["GetOut",_vehicle];
};

if((_position isEqualTo "driver")&&{(_vehicle getVariable ["isMCU",false])||(_vehicle getVariable ["isMCUWater",false])}&&{!(_vehicle getVariable ["packed",false])})exitWith {
	player action ["GetOut",_vehicle];
};

if((playerSide isEqualTo west)&&{(_vehicle getVariable ["isMCU",false])||(_vehicle getVariable ["isMCUWater",false])})exitWith {
	_vehicle setVariable ["stolen",false,true];
};

if((_position isEqualTo "driver")&&{playerSide isEqualTo civilian}&&{_vehicle getVariable ["taxi",false]})exitWith {
	hint "You are in a taxi. Press F5 to begin taxi missions";
	player say3D "dingDong";
};

if((_position isEqualTo "driver")&&{playerSide isEqualTo civilian}&&{(typeOf _vehicle) in ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F","O_SDV_01_F","I_C_Boat_Transport_02_F","C_Boat_Transport_02_F"]})exitWith {
	hint "You are in a boat. Press F5 to begin boat taxi missions";
};

if((_position isEqualTo "driver")&&{playerSide isEqualTo civilian}&&{!(_vehicle in DS_keyRing)}&&{!((typeOf _vehicle) isEqualTo "Steerable_Parachute_F")}&&{(player inArea "safezone")||(player inArea "safezone_1")})exitWith {
	player action ["GetOut",_vehicle];
	hint "You've been ejected from this vehicle because you don't have it's keys and you're in a safezone";
};