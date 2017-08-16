/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Switches the stance and shooting mode of a sharpshooter
*/

player removeAction DS_copAction1;
player removeAction DS_copAction2;
player removeAction DS_copAction3;
player removeAction DS_copAction4;

DS_copAction1 = player addAction ["<t color='#FF8000'>Switch to Diver</t>",DS_cop_switchStanceCG,[1],0,false,false,"",
	'(DS_coastGuard == 0) && {(player getVariable ["policeSquad",""]) isEqualTo "Coast Guard"} && {!DS_coastGuardAction}'];

DS_copAction2 = player addAction ["<t color='#FF8000'>Switch to Normal</t>",DS_cop_switchStanceCG,[0],0,false,false,"",
	'(DS_coastGuard == 1) && {(player getVariable ["policeSquad",""]) isEqualTo "Coast Guard"} && {DS_coastGuardAction}'];

DS_copAction3 = player addAction ["<t color='#FF8000'>Fire Fuel Dart</t>",DS_cop_fuelDart,[[],[]],0,false,false,"",
	'(!isNull cursorTarget) && {(vehicle player) isKindOf "Ship"} && {!DS_dartFired} && {(player getVariable ["policeSquad",""]) isEqualTo "Coast Guard"}'];

DS_copAction4 = player addAction ["Building Items and Shops",DS_fnc_menuShop,[[],[115,116,666,14,21,22,23,37,24,92,69,132]],0,false,false,"",
	'(!isNull cursorTarget) && {((cursorTarget) isKindOf "Air")||((cursorTarget) isKindOf "Ship")} && {(player distance cursorTarget) < 8} && {cursorTarget getVariable ["policeVehicle",false]} && {(player getVariable ["policeSquad",""]) isEqualTo "Coast Guard"}'];

DS_coastGuardItems = [];