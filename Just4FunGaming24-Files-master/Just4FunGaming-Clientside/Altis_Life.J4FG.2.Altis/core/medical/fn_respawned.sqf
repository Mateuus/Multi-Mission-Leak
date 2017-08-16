/*
    File: fn_respawned.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sets the player up if he/she used the respawn option.
*/
//Reset our weight and other stuff
XY_atmUsable = true;
XY_actionInUse = false;
XY_trackerVehicle = objNull;
XY_trackerTimeout = 0;
XY_hunger = 0;
XY_thirst = 0;
XY_carryWeight = 0;
XY_CC = 0;
XY_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

deleteVehicle XY_corpse;
XY_corpse = nil;

player setVariable["revive", nil, true];
player setVariable["name", nil, true];
player setVariable["reviving", nil, true];

call (switch(playerSide) do {
    case west: { XY_fnc_copLoadout };
    case civilian: { XY_fnc_civLoadout };
    case independent: { XY_fnc_medicLoadout };
    case east: { XY_fnc_thwLoadout };
});

//Destroy our camera...
XY_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy XY_deathCamera;

if( XY_removeWanted ) then {
    XY_removeWanted = false;
    [getPlayerUID player] remoteExec ["XY_fnc_wantedRemove", 2];
};

if( XY_isArrested ) exitWith {
    hint "Selbstmord wird dich nicht hier raus bringen";
    XY_isArrested = false;
    [player] call XY_fnc_jail;
};

[] call XY_fnc_updateRequest;