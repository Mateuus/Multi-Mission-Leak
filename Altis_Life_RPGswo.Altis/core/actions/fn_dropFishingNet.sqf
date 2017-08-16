/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Drops a virtual fishing net from the boat.
*/
private ["_fish","_type","_typeName","_fail","_dice"];
if (!(vehicle player isKindOf "Ship")) exitWith {};
if (DWEV_inv_netz isEqualTo 0) exitWith {hint "Du brauchst ein Fischernetz aus dem Fischmarkt!";};

_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
_fail = 95; //5%, geht schaufel kaputt
_dice = floor (random 100);

if(_dice >= _fail) exitWith 
{
	titleText["Dein Fischernetz ist kaputt.","PLAIN"];
	[false,"netz",1] call DWEV_fnc_handlelnv;
};

DWEV_net_dropped = true;
titleText["Fischernetz ausgeworfen....","PLAIN"];
sleep 5;
if (_fish isEqualTo []) exitWith {titleText["Keinen Fisch gefangen.","PLAIN"]; DWEV_net_dropped = false;};

{
	if (_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{			
			case ((typeOf _x) isEqualTo "Salema_F"): {_typeName =  "Salemafilet"; _type = "salema";};
			case ((typeOf _x) isEqualTo "Ornate_random_F"): {_typeName =  "Ornatefilet"; _type = "ornate";};
			case ((typeOf _x) isEqualTo "Mackerel_F"): {_typeName =  "Makrelenfilet"; _type = "mackerel";};
			case ((typeOf _x) isEqualTo "Tuna_F"): {_typeName =  "Thunfisch Steak"; _type = "tuna";};
			case ((typeOf _x) isEqualTo "Mullet_F"): {_typeName =  "Meeräschenfilet"; _type = "mullet";};
			case ((typeOf _x) isEqualTo "CatShark_F"): {_typeName =  "Katzenhaifilet"; _type = "catshark";};
			default {_type = "";};
		};

		sleep 3;

		if(([true,_type,1] call DWEV_fnc_handlelnv)) then
		{
			deleteVehicle _x;
			titleText[format["Du hast ein %1 gefangen.",_typeName],"PLAIN"];
		};
	};
} foreach (_fish);

sleep 1.5;
titleText["Fischernetz eingeholt.","PLAIN"];
DWEV_net_dropped = false;
