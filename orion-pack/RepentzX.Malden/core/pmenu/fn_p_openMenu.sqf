/*
//--Repentz for Arma Nexus
*/

#include "..\..\script_macros.hpp"

private ["_buttons","_display","_sync","_message","_money","_inventory","_button","_text","_lastButton","_time","_hour","_min","_admin","_gang","_keychain","_licenses","_settings","_wanted","_wanted2","_bourse","_craft","_roadblock"];

if(!alive player || dialog) exitWith {};
createDialog "smartphone";
disableSerialization;

_display = findDisplay 90000;

/*
if((call life_adminlevel) < 1) then
{
	ctrlShow[1218,false];
	ctrlShow[2418,false];
} else {
	ctrlShow[12181,false];
};
*/
switch(playerSide) do {
	case west: {
		/*
		ctrlShow[1210,false]; //gang Icon
		ctrlShow[2409,false]; //gang Icon
		ctrlShow[1342,false]; //gang Icon
		ctrlShow[1211,false]; //Radio Overlay
		ctrlShow[1345,false]; //Radio Overlay
		ctrlShow[2410,false]; //Radio Overlay
		*/
	};

	case civilian: {
		/*
		ctrlShow[1212,false]; //Barrier Overlay
		ctrlShow[1348,false]; //Barrier Overlay
		ctrlShow[2411,false]; //Barrier Overlay
		*/
	};

	case independent: {
		/*
	ctrlShow[2410,false]; //Radio Overlay
	ctrlShow[1211,false]; //radio Overlay
	ctrlShow[1345,false]; //Radio Overlay
	ctrlShow[1210,false]; //gang Icon
	ctrlShow[2409,false]; //gang Icon
	ctrlShow[1342,false]; //gang Icon
	ctrlShow[1212,false]; //Barrier Overlay
	ctrlShow[2411,false]; //Barrier Overlay
	ctrlShow[1348,false]; //Barrier Overlay
	*/
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
