/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Messages the driver of a vehicle you are targeted on
*/

player removeAction DS_copAction1;
player removeAction DS_copAction2;

DS_copAction1 = player addAction ["<t color='#FF8000'>Fire Fuel Dart</t>",DS_cop_fuelDart,[],0,false,false,"",
	'(!DS_dartFired) && {(typeOf (vehicle player)) isEqualTo "B_MRAP_01_F"} && {driver (vehicle player) isEqualTo player} && {(player getVariable ["policeSquad",""]) isEqualTo "Highway Patrol"}'];

DS_copAction2 = player addAction ["Building Items",DS_fnc_menuShop,[[],[115,116]],0,false,false,"",
	'(!isNull cursorTarget) && {cursorTarget isKindOf "LandVehicle"} && {(player distance cursorTarget) < 8} && {cursorTarget getVariable ["policeVehicle",false]} && {(player getVariable ["policeSquad",""]) isEqualTo "Highway Patrol"}'];