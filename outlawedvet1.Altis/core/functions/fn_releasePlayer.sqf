#include "..\..\script_macros.hpp"
/*
	File: fn_releasePlayer.sqf
 
	Description: Releases selected player from jail
*/
private["_admin","_clothings"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(life_is_arrested) then {
	life_is_arrested = false;
	[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
	
	city_georgetown = nearestObjects[getMarkerPos  "city_georgetown", ["Land_School_01_F","Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Shop_Town_01_F","Land_Shop_Town_03_F","Land_Shop_City_04_F","Land_Shop_City_05_F"],250]; 
	player setPos (selectRandom city_georgetown);
	
	_clothings = ["U_C_man_sport_1_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_1_F"];
	player addUniform (selectRandom _clothings);
		/* ITEMS */
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		
};