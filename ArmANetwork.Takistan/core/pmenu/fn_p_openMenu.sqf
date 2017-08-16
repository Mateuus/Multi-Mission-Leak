/*
	File: fn_p_openMenu.sqf
	Author: Fuzz

	Description:
	Opens the players smartphone
*/

private ["_buttons","_display","_sync","_message","_money","_inventory","_button","_text","_lastButton","_time","_hour","_min","_admin","_gang","_keychain","_licenses","_settings","_wanted","_wanted2","_bourse","_craft","_roadblock"];

if(!alive player || dialog) exitWith {};
createDialog "smartphone";
disableSerialization;

_display = findDisplay 90000;

if((call life_adminlevel) < 1) then
{
	ctrlShow[1218,false];
	ctrlShow[2418,false];
} else {
	ctrlShow[12181,false];
};

switch(playerSide) do {
	case west: {
		ctrlShow[1206,false];//Crafting Icon
		ctrlShow[2404,false];//Crafting Button
		ctrlShow[1202,false];//Gang Icon
		ctrlShow[2401,false];//Gang Button
		ctrlShow[12071,false];//Barrier Overlay
		ctrlShow[1210,false];//Market Icon
		ctrlShow[2405,false];//Market Button
		ctrlShow[1213,false];//Skill Icon
		ctrlShow[2406,false];//Skill Button
		ctrlShow[1215,false];//Taxi Icon
		ctrlShow[2409,false];//Taxi Button
		ctrlShow[12161,false];//Terror Overlay TODO RANKS
		ctrlShow[12191,false];//Backup Overlay
	};

	case civilian: {
		ctrlShow[12061,false];//Crafting Overlay
		ctrlShow[12021,false];//Gang Overlay
		ctrlShow[1207,false];//Barrier Icon
		ctrlShow[2410,false];//Barrier Button
		ctrlShow[12101,false];//Market Overlay
		ctrlShow[12131,false];//Skill Overlay
		ctrlShow[12151,false];//Taxi Overlay
		ctrlShow[1216,false];//Terror Icon
		ctrlShow[2402,false];//Terror Button
		ctrlShow[1219,false];//Backup Icon
		ctrlShow[2419,false];//Backup Button
	};

	case independent: {
		ctrlShow[1206,false];//Crafting Icon
		ctrlShow[2404,false];//Crafting Button
		ctrlShow[1207,false];//Barrier Icon
		ctrlShow[2410,false];//Barrier Button
		ctrlShow[1210,false];//Market Icon
		ctrlShow[2405,false];//Market Button
		ctrlShow[1213,false];//Skill Icon
		ctrlShow[2406,false];//Skill Button
		ctrlShow[1215,false];//Taxi Icon
		ctrlShow[2409,false];//Taxi Button
		ctrlShow[1216,false];//Terror Icon
		ctrlShow[2402,false];//Terror Button
		ctrlShow[1219,false];//Backup Icon
		ctrlShow[2419,false];//Backup Button
	};
};


[] spawn
{
	while {!isNull (findDisplay 90000)} do
	{
		[] call life_fnc_p_updateMenu;
		sleep 2;
	};
};
