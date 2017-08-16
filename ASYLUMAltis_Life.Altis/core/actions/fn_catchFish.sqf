/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine & John "Paratus" VanderZwet
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type","_range"];
_range = 3;
if (62 in life_talents) then { _range = 5; };
_fish = (nearestObjects[getPos player,["Fish_Base_F"],_range]) select 0;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
_maxweight=0;
switch(true) do
{
	case ((typeOf _fish) == "Salema_F"): {_type = "salema";_maxweight = 1;};
	case ((typeOf _fish) == "Ornate_random_F") : {_type = "ornate";_maxweight = 5;};
	case ((typeOf _fish) == "Mackerel_F") : {_type = "mackerel";_maxweight = 2.5;};
	case ((typeOf _fish) == "Tuna_F") : {_type = "tuna";_maxweight = 35;};
	case ((typeOf _fish) == "Mullet_F") : {_type = "mullet";_maxweight = 7;};
	case ((typeOf _fish) == "Catshark_F") : {_type = "catshark";_maxweight = 2;};
	default {_type = "";};
};

if(_type == "") exitWith {}; //Couldn't get a type

_weight = round ((random _maxweight) * 100) / 100;

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _fish;
	titleText[format["You caught a %1kg %2", _weight, [[_type,0] call life_fnc_varHandle] call life_fnc_varToStr],"PLAIN"];
	life_experience = life_experience + 3;
};

if (_weight > 1 && !(10 in life_achievements)) then { [10] call life_fnc_achievementGrant };
if (_weight > 5 && !(11 in life_achievements)) then { [11] call life_fnc_achievementGrant };
if (_weight > 25 && !(12 in life_achievements)) then { [12] call life_fnc_achievementGrant };