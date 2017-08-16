/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Catches a fish if it is the players cursorTarget
*/
private["_nearbyFish","_type","_number","_tempNum"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_nearbyFish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],50]);
DS_doingStuff = true;
titleText["Fishing Net Dropped","PLAIN"];
_number = 0;
sleep 3;
if(count _nearbyFish == 0) exitWith {titleText["You cant find any fish in this area","PLAIN"]; DS_doingStuff = false;};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch(true) do
		{
			case ((typeOf _x) == "Salema_F"): {_type = "salema";};
			case ((typeOf _x) == "Ornate_random_F") : {_type = "ornate";};
			case ((typeOf _x) == "Mackerel_F") : {_type = "mackerel";};
			case ((typeOf _x) == "Tuna_F") : {_type = "tuna";};
			case ((typeOf _x) == "Mullet_F") : {_type = "mullet";};
			case ((typeOf _x) == "CatShark_F") : {_type = "catshark";};
			default {_type = "";};
		};
		
		sleep 3;
		
		if(([_type,1] call DS_fnc_itemWeight) > (DS_maxWeight - DS_currentWeight))exitwith{titleText["You have no more space to catch anymore fish","PLAIN"];};
		[_type,true,1] call DS_fnc_handleInventory;
		deleteVehicle _x;
		titleText[format[("You have caught 1 %1"),_type],"PLAIN"];
		_number = _number + 1;
	};
	if(([_type,1] call DS_fnc_itemWeight) > (DS_maxWeight - DS_currentWeight))exitwith{};
} foreach (_nearbyFish);

sleep 1.5;
titleText["Your fishing net has been pulled up","PLAIN"];
DS_doingStuff = false;
[10,true] spawn DS_fnc_moralAlter;

if((DS_infoArray select 13) == 2)then
	{
	_tempNum = (DS_infoArray select 14) + _number;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 50)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};