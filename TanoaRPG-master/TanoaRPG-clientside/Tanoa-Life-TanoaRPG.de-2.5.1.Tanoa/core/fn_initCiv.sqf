/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_georgetown = nearestObjects[getMarkerPos  "civ_spawn_georgetown", ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_School_01_F","Land_Cathedral_01_F","Land_GuardHose_01_F","Land_Supermarket_01_F"],250];
civ_spawn_larochelle = nearestObjects[getMarkerPos  "civ_spawn_larochelle", ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_School_01_F","Land_Cathedral_01_F","Land_GuardHose_01_F","Land_Supermarket_01_F"],250];
civ_spawn_oumere = nearestObjects[getMarkerPos  "civ_spawn_oumere", ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_School_01_F","Land_Cathedral_01_F","Land_GuardHose_01_F","Land_Supermarket_01_F"],250];
civ_spawn_lijnhafen = nearestObjects[getMarkerPos  "civ_spawn_lijnhafen", ["Land_Shop_City_01_F","Land_Shop_City_02_F","Land_School_01_F","Land_Cathedral_01_F","Land_GuardHose_01_F","Land_Supermarket_01_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn tanoarpg_fnc_jail;
}
	else
{
	[] call tanoarpg_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

[] call tanoarpg_fnc_setSkinns;
//[] execVM "IgiLoad_Civ\IgiLoadInit.sqf";
player addRating 9999999;