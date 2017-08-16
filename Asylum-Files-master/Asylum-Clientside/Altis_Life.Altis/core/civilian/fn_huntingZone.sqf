/*
	File: fn_huntingZone.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Spawns up animals local to the client.
*/
private["_enable","_presence","_total","_animals","_pos"];

_enable = [_this,0,false,[false]] call BIS_fnc_param;

if(_enable && !life_animals_spawned) then
{
	life_animals_spawned = true;
	[] spawn
	{
		private ["_alive","_total","_type","_animal"];
		//_animals = ["Cock_random_F","Goat_random_F","Goat_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Sheep_random_F","Alsatian_Random_F"]; //Array of animals to spawn
		_animals = ["Cock_random_F","Hen_random_F","Hen_random_F","Goat_random_F","Goat_random_F","Sheep_random_F","Sheep_random_F","Sheep_random_F","Alsatian_Random_F"]; //Array of animals to spawn
		while {life_animals_spawned} do
		{
			_alive = 0;
			{
				if (!isNull _x) then
				{
					if (alive _x) then
					{
						_alive = _alive + 1;
					};
				};
			} forEach life_animals_array;
			_total = 50 - _alive;
			if (time - life_animals_spawned_time > 300) then
			{
				for "_i" from 1 to _total do
				{
					_type = _animals call BIS_fnc_selectRandom;
					//_animal = life_animal_group createUnit [_type, getMarkerPos "hunting", [], 500, "NONE"];
					_pos = [getMarkerPos "hunting", [1,500] call BIS_fnc_randomInt, [0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos;
					_animal = _type createVehicleLocal _pos;
					_animal enableSimulation false;
					_z = switch (_type) do
					{
						case "Hen_random_F";
						case "Cock_random_F": { 0.3 };
						case "Alsatian_Random_F";
						case "Fin_random_F": { 0.6 };
						case "Goat_random_F": { 0.7 };
						case "Sheep_random_F": { 0.75 };
					};
					_pos set [2, _z];
					_animal setPos _pos;
					_animal setVectorUp surfaceNormal position _animal;
					_animal addEventHandler ["handleDamage", { _a = _this select 0; _d = _this select 2; _p = getPos _a; if (_d >= 1) then { _a setDamage 1; _v = vectorUp _a; _v set [2, (_v select 2) - 1]; _a setVectorUp _v; _p set [2, 0.1]; _a setPos _p; }; }];
					player reveal _animal;
					life_animals_array set[count life_animals_array,_animal];
				};
				life_animals_spawned_time = time;
			};
			sleep 300;
		};
	};
	[] spawn
	{
		while {life_animals_spawned} do
		{
			sleep 15;
			_animals = nearestObjects [getMarkerPos "hunting", ["Goat_random_F", "Cock_random_F", "Hen_random_F", "Sheep_random_F","Alsatian_Random_F"], 600];
			{ player reveal _x } forEach _animals;
		};
	};
}
else
{
	{
		if(!isNull _x) then
		{
			deleteVehicle _x;
		};
	} foreach life_animals_array;
	
	life_animals_array = [];
	life_animals_spawned = false;
	life_animals_spawned_time = time;
};