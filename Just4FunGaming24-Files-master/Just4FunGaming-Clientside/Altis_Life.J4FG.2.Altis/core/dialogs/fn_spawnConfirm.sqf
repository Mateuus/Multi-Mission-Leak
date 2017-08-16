/*
    File: fn_spawnConfirm.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Spawns the player where he selected.
*/

closeDialog 0;

if( count XY_spawn_point == 0 ) then {
    private _sp = (call XY_fnc_spawnPointCfg) select 0;

    if(playerSide == civilian) then {
        if(isNil {(call compile format["%1", _sp select 0])}) then {
            player setPos (getMarkerPos (_sp select 0));
        } else {
            _spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (_sp select 0));
    };
    titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
} else {
    if(playerSide == civilian) then {
        if(isNil {(call compile format["%1",XY_spawn_point select 0])}) then {
            if((["house",XY_spawn_point select 0] call BIS_fnc_inString)) then {
                private["_bPos","_house","_pos"];
                _house = nearestObjects [getMarkerPos (XY_spawn_point select 0),["House_F"],10] select 0;
                _bPos = [_house] call XY_fnc_getBuildingPositions;

                if(count _bPos == 0) exitWith {
                    player setPos (getMarkerPos (XY_spawn_point select 0));
                };

                _pos = _bPos call BIS_fnc_selectRandom;
                player setPosATL _pos;
            } else {
                player setPos (getMarkerPos (XY_spawn_point select 0));
            };
        } else {
            _spawnPos = (call compile format["%1", XY_spawn_point select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (XY_spawn_point select 0));
    };
    titleText[format["%2 %1",XY_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

if( XY_isFirstJoin ) then {
   cutText ["", "BLACK IN"];
   XY_isFirstJoin = false;
} else {
    cutText [ format["Willkommen zurück, %1", profileName], "BLACK IN", 10];
};

// Use this to ensure the HUD is visible after respawn
// Spawned once is also used to initSurvival
if( XY_spawnedOnce && XY_hudON ) then {
    disableSerialization;
    2 cutRsc ["XY_HUD", "PLAIN", 4, false];
} else {
    XY_spawnedOnce = true;
};