/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Opens the players virtual inventory menu
*/

private ["_buttons","_display","_sync","_message","_money","_inventory","_button","_text","_lastButton","_time","_hour","_min","_admin","_gang","_keychain","_licenses","_settings","_wanted","_wanted2","_bourse","_craft","_roadblock"];

if(!alive player || dialog) exitWith {};
createDialog "ymenu";
disableSerialization;

_display = findDisplay 90000;

if((call life_adminlevel) < 1) then
{
	ctrlShow[2400,false];//Admin Button
};

switch(playerSide) do {
	case west: {
		ctrlShow[2401,false];//Economy Button
		ctrlShow[2402,false];//Gang Button
		ctrlShow[2403,false];//Skills Button
		ctrlShow[2406,false];//Government Button
		ctrlShow[1500,false];//Licenses
		ctrlShow[1004,false];//Title
	};

	case civilian: {
		ctrlShow[2416,false];//news Button
		ctrlShow[2415,false];//checkpoints Button
		ctrlShow[2414,false];//Wanted Button
		ctrlShow[2413,false];//backup
	};

	case independent: {
		ctrlShow[2401,false];//Economy Button
		ctrlShow[2402,false];//Gang Button
		ctrlShow[2403,false];//Skills Button
		ctrlShow[2406,false];//Government Button
		ctrlShow[2414,false];//Wanted Button
		ctrlShow[2413,false];//backup
		//
	};
};

if(count life_vehicles < 1) then {
	ctrlEnable[2417,false];
};
call life_fnc_p_updateMenu;
