#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
/*
CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};
*/

if (hasInterface) then {
    player addEventHandler ["GetOutMan", {
        life_seatbelt = false;
        player setVariable ["seatbelt",false,true];
        //[] call life_fnc_hudUpdate; //--Enable if you are putting a hud option to display when your seatbelt is on
    }];
    if (!(weaponLowered player)) then {
        player action ["WeaponOnBack", player];
    };
};

if (hasInterface) then {
    player addEventHandler ["GetInMan", {
        life_seatbelt = false;
       //[] call life_fnc_hudUpdate; //--Enable if you are putting a hud option to display when your seatbelt is on
    }];
};

//disable squad chatter
enableRadio false; 
enableSentences false; //Maxi - Add enableSentences false. Disables radio chatter fully.

[] execVM "core\init.sqf";

//-- Auto Saving
//while {true} do { sleep 300; [] call SOCK_fnc_updateRequest;};