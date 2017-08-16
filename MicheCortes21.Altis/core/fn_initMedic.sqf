#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
private ["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
_backpack = "";

if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

if (LIFE_SETTINGS(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            waitUntil {sleep 3; currentWeapon player != ""};
            removeAllWeapons player;
        };
    };
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.


[] spawn 
{
       while {true} do 
	    {
               waitUntil {uniform player == "U_Rangemaster"};
               player setObjectTextureGlobal [0,"textures\med\Kleidung\fara.paa"];
               waitUntil {uniform player != "U_Rangemaster"};

        };
};


[] spawn 
{
       while {true} do  
	    {
               waitUntil {uniform player == "U_BG_Guerilla2_1"};
               player setObjectTextureGlobal [0,"textures\med\Kleidung\paramedic.paa"];
               waitUntil {uniform player != "U_BG_Guerilla2_1"};

        };
};

[] spawn 
{
       while {true} do   
	    {waitUntil {backpack player != _backpack};
		 _backpack = backpack player;
		(unitBackpack player) setObjectTextureGlobal [0,""];
		};
};

[] spawn life_fnc_medicPlaceablesInit;