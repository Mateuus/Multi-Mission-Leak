/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos","_slotName"];
_slotName = format["%1",player];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if((_slotName in ["civ_91","civ_92","civ_93","civ_94","civ_95"]) && !((getPlayerUID player) in ["76561198039781400","76561198079938959","76561197994577943","76561198068414265","76561198021048398","76561198015730869","76561198101890407","76561198042602540","76561198056412910","76561198011331330","76561198026200398","76561197974711330","76561198026200274","76561197999455942","76561198040822510","76561197993365585","76561198108898750"])) exitWith {
["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
uiSleep 35;
};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

[] call life_fnc_zoneCreator;
[player, uniform player] call life_fnc_equipGear;
[] execVM "welcome.sqf";
//sleep 10;
//[] execVM "welcomeNotification.sqf";
//sleep 2;
//[] call life_fnc_disableRope;