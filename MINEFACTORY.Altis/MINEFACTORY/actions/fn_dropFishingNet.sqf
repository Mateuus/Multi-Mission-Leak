/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_net_dropped = true;
titleText[ "Fischernetz auswerfen...","PLAIN"];
sleep 5;
if(count _fish == 0) exitWith {titleText[ "Fischernetz auswerfen...Fail","PLAIN"]; life_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_typeName =  "Salema"; _type = "salema_raw";};
			case ((typeOf _x) == "Ornate_random_F") : {_typeName =  "Ornate"; _type = "ornate_raw";};
			case ((typeOf _x) == "Mackerel_F") : {_typeName =  "Makrele"; _type = "mackerel_raw";};
			case ((typeOf _x) == "Tuna_F") : {_typeName =  "Thunfisch"; _type = "tuna_raw";};
			case ((typeOf _x) == "Mullet_F") : {_typeName =  "Barbe"; _type = "mullet_raw";};
			case ((typeOf _x) == "CatShark_F") : {_typeName =  "Katzenhai"; _type = "catshark_raw";};
			default {_type = "";};
		};

		sleep 3;

		if(([true,_type,1] call life_fnc_handleInv)) then
		{
			deleteVehicle _x;
			titleText[format[( "Du hast einen %1 gefangen"),_typeName],"PLAIN"];
		};
	};
} foreach (_fish);

sleep 1.5;
titleText[ "Fischernetz einholen.","PLAIN"];
life_net_dropped = false;