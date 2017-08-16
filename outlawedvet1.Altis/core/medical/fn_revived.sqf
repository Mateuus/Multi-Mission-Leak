#include "..\..\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir","_reviveCost","_weaponholder"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");


//oldGear = [life_corpse] call life_fnc_fetchDeadGear;
life_save_gear = [life_corpse] call life_fnc_fetchDeadGear;
uiSleep 1;
[life_save_gear] spawn life_fnc_loadDeadGear; 

/*
if (count Life_containers > 0) then {
_weaponholder = createVehicle ["WeaponHolderSimulated", [0,0,0], [], 0, "CAN_COLLIDE"];
_weaponholder setPos (getPos player);
{_weaponholder addWeaponCargoGlobal [_x,1];} forEach Life_containers;
};


diag_log format["Revived killed gear: %1",life_save_gear];
diag_log format["Containers killed gear: %1",Life_containers];
*/

life_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];

_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[_reviveCost] call life_fnc_numberText];

If(playerside isequalto west) then {
if (!life_placeable_placing_active) exitWith {};

deleteVehicle life_placeable_active_object;
life_placeable_placing_active = false;
life_placeable_active_object = ObjNull;
};

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (BANK > _reviveCost) then {
    BANK = BANK - _reviveCost;
} else {
    BANK = 0;
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];
deleteVehicle life_corpse;

[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];

life_is_alive = true;

player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
[] call life_fnc_playerSkins;
[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest;
