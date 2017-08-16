/*
	File: fn_houseMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows house ownership menu
*/
private["_owners","_locked","_owner","_price"];
if(dialog) exitWith {};
life_menu_house = cursorObject;
if(isNull life_menu_house || !(life_menu_house isKindOf "House")) exitWith {systemChat "Bad House";};

if(!createDialog "HouseMenu") exitWith {"Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[12501,format["House - %1",getText(configFile >> "CfgVehicles" >> (typeOf life_menu_house) >> "displayName")]];

ctrlShow[12512,false];
ctrlShow[12516,false];
ctrlShow[12518,false];

[[[life_menu_house] call life_fnc_getBuildID,player,getPos life_menu_house],"ASY_fnc_queryHouse",false,false] spawn life_fnc_MP;