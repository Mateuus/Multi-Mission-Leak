#include "..\..\script_macros.hpp"

private ["_dir"];

[life_save_gear] spawn life_fnc_loadDeadGear;
life_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];

_dir = getDir life_corpse;

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];
deleteVehicle life_corpse;

life_is_alive = true;

player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
[] call life_fnc_playerSkins;
//[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest;

player setDamage 0.60;

[] spawn {
    sleep 3;
    [] call life_fnc_playerSkins;
};