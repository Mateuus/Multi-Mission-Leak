/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
eM_net_dropped = true;
titleText["Fangnetz ausgeworfen","PLAIN"];
uisleep 5;
if(count _fish == 0) exitWith {titleText["Keine Fische gefangen! :(","PLAIN"]; eM_net_dropped = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_typeName = "Goldstrieme"; _type = "salema";};
			case ((typeOf _x) == "Ornate_random_F") : {_typeName = "Meerpfau"; _type = "ornate";};
			case ((typeOf _x) == "Mackerel_F") : {_typeName = "Makrele"; _type = "mackerel";};
			case ((typeOf _x) == "Tuna_F") : {_typeName = "Thunfisch"; _type = "tuna";};
			case ((typeOf _x) == "Mullet_F") : {_typeName = "Meeräsche"; _type = "mullet";};
			case ((typeOf _x) == "CatShark_F") : {_typeName = "Katzenhai"; _type = "catshark";};
			default {_type = "";};
		};
		
		uisleep 3;
		
		if(([true,_type,1] call EMonkeys_fnc_handleInv)) then
		{
			deleteVehicle _x;
			titleText[format["Du hast eine(n) %1 gefangen.",_typeName],"PLAIN"];
		};
	};
} foreach (_fish);

uisleep 1.5;
titleText["Fangnetz hochgezogen.","PLAIN"];
eM_net_dropped = false;