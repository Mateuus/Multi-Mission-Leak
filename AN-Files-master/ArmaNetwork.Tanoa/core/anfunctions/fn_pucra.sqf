/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
	Terror = 2402
	Spectate = 2403
	Teleport = 2404
	Teleport Player to Admin = 2405
	Teleport Admin To Player = 2406
	Freeze Player = 2407
	God Mode = 2408
	Map Markers = 2409
	Cleanup = 2410
*/
private["_display","_list","_side"];
if((call life_adminlevel) < 1) exitWith {};
createDialog "an_admin_menu";
disableSerialization;
(findDisplay 2900) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 1) then {true}"];
/*
switch(call life_adminlevel) do
{
	case 1: {ctrlEnable [2402,false];ctrlEnable [2403,false];ctrlEnable [2404,false];ctrlEnable [2405,false];ctrlEnable [2406,false];ctrlShow [2407,false];ctrlEnable [2408,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 2: {ctrlEnable [2402,false];ctrlEnable [2404,false];ctrlEnable [2405,false];ctrlEnable [2406,false];ctrlEnable [2408,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 3: {ctrlEnable [2402,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 4: {ctrlEnable [2402,false];ctrlEnable [2410,false];};
	case 5: {ctrlEnable [2410,true];};
};
*/
call life_fnc_brucr;
