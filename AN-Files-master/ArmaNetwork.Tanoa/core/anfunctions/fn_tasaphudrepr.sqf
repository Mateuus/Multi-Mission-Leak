/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Catches a fish that is near by.'
*/
private _fish = param [0,ObjNull,[ObjNull]];

if (player distance _fish > 3.5) exitWith {};
private _type = switch (typeOf _fish) do
{
	case ("Salema_F"): {"salemaRaw"};
	case ("Ornate_random_F") : {"ornateRaw"};
	case ("Mackerel_F") : {"mackerelRaw"};
	case ("Tuna_F") : {"tunaRaw"};
	case ("Mullet_F") : {"mulletRaw"};
	case ("CatShark_F") : {"catsharkRaw"};
	case ("Turtle_F") : {"turtleRaw"};
	default {""};
};

if (_type isEqualTo "") exitWith {};
if (_type isEqualTo "Turtle_F" && {(alive _object)}) exitWith {};

if ([_type,1] call life_fnc_virtualItemAdd) then
{
	deleteVehicle _fish;
	titleText["You successfully caught something!","PLAIN"];
};
