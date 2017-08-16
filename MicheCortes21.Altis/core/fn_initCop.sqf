#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
private "_end";
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
_backpack = "";

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

player addRating 9999999;

waitUntil {!(isNull (findDisplay 46))};


if ((FETCH_CONST(life_coplevel)) < 1) exitWith {

["Notwhitelisted",false,true] call BIS_fnc_endMission;

sleep 35;

};


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


[] spawn 
{
       while {true} do 
	    {
               waitUntil {uniform player == "U_Rangemaster"};
               player setObjectTextureGlobal [0,"textures\cop\Kleidung\polizei1.paa"];
               waitUntil {uniform player != "U_Rangemaster"};

        };
};

[] spawn 
{
       while {true} do 
	    {
               waitUntil {uniform player == "U_BG_Guerilla2_1"};
               player setObjectTextureGlobal [0,"textures\cop\Kleidung\polizei2.paa"];
               waitUntil {uniform player != "U_BG_Guerilla2_1"};

        };
};

[] spawn 
{
       while {true} do  
	    {
               waitUntil {uniform player == "U_B_CombatUniform_mcam"};
               player setObjectTextureGlobal [0,"textures\cop\Kleidung\swat1.paa"];
               waitUntil {uniform player != "U_B_CombatUniform_mcam"};

        };
};

		

[] spawn life_fnc_placeablesInit;