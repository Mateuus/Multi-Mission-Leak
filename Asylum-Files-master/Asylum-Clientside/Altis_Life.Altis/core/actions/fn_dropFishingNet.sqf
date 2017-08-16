/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_range","_delay"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_range = 30;
if (63 in life_talents) then { _range = 45; };
if (64 in life_talents) then { _range = 60; };
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],_range]);
life_net_dropped = true;
titleText["Dropping fishing net....","PLAIN"];
_delay = if (typeOf (vehicle player) == "CUP_C_Fishing_Boat_Chernarus") then { 3 } else { 5 };
sleep _delay;

if(count _fish == 0) exitWith {titleText["Didn't catch any fish...","PLAIN"]; life_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		_maxweight=0;
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_type = "salema";_maxweight = 1;};
			case ((typeOf _x) == "Ornate_random_F") : {_type = "ornate";_maxweight = 5;};
			case ((typeOf _x) == "Mackerel_F") : {_type = "mackerel";_maxweight = 2.5;};
			case ((typeOf _x) == "Tuna_F") : {_type = "tuna";_maxweight = 35;};
			case ((typeOf _x) == "Mullet_F") : {_type = "mullet";_maxweight = 7;};
			case ((typeOf _x) == "Catshark_F") : {_type = "catshark";_maxweight = 2;};
			default {_type = "";};
		};
		
		sleep 3;
		
		_weight = round ((random _maxweight) * 100) / 100;
		
		if (random 6000 < 1) then
		{
			_type = ["treasure_1","treasure_2","treasure_3","treasure_4","treasure_5"] call BIS_fnc_selectRandom;
			if([true,_type,1] call life_fnc_handleInv) then
			{
				titleText["YOU FOUND A TREASURE MAP!","PLAIN"];
			};
		}
		else
		{
			if (random 250 < 1) then
			{
				_type = ["lootcrate1"] call BIS_fnc_selectRandom;
				if([true,_type,1] call life_fnc_handleInv) then
				{
					titleText["You found a loot crate!","PLAIN"];
				};
			}
			else
			{
				if(([true,_type,1] call life_fnc_handleInv)) then
				{
					deleteVehicle _x;
					titleText[format["You caught a %1kg %2", _weight, [[_type,0] call life_fnc_varHandle] call life_fnc_varToStr],"PLAIN"];
					life_experience = life_experience + 2;
					if (_weight > 1 && !(10 in life_achievements)) then { [10] call life_fnc_achievementGrant };
					if (_weight > 5 && !(11 in life_achievements)) then { [11] call life_fnc_achievementGrant };
					if (_weight > 25 && !(12 in life_achievements)) then { [12] call life_fnc_achievementGrant };
				};
			};
		};
	};
} foreach (_fish);

sleep 1.5;
titleText["Fishing net pulled up.","PLAIN"];
life_net_dropped = false;