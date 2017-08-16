// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// original by Tonic
XY_sessionCompleted = false;

disableSerialization;

0 cutText["Lade AltisLife...", "BLACK FADED"];
0 cutFadeOut 9999999;

waitUntil { !(isNull player) && player isEqualTo player && time > 0 };

// Wait for name-approval by server...
waitUntil { uisleep 1; missionNamespace getVariable[ format["ALLOW_%1", getPlayerUID player], false ] };

call compile PreprocessFileLineNumbers "config\configuration.sqf";

call XY_fnc_setupEVH;

call XY_fnc_setupActions;

0 cutText ["Warte bis Server bereit ist...", "BLACK FADED"];
0 cutFadeOut 99999999;

waitUntil { !(isNil "XY_fnc_cleanup") && { !(isNil "XY_isServerReady") } && { XY_isServerReady } };

0 cutText ["Warte auf Antwort vom Server...", "BLACK FADED"];
0 cutFadeOut 99999999;

call XY_fnc_dataQuery;
waitUntil { XY_sessionCompleted };

0 cutText["Starte AltisLife...", "BLACK FADED"];
0 cutFadeOut 9999999;

[] spawn XY_fnc_cleanup;

waitUntil {!(isNull (findDisplay 46))};

switch (playerSide) do {
    case west: { call XY_fnc_initCop; };
    case independent: { call XY_fnc_initMedic; };
    case east: { call XY_fnc_initTHW; };
    default { call XY_fnc_initCiv; };
};

player setVariable["restrained", false, true];
player setVariable["escorting", false, true];
player setVariable["transporting", false, true];
player setVariable["missingOrgan", false, true];
player setVariable["steam64ID", getPlayerUID player, true];
player setVariable["realName", profileName, true];
player addRating 999999;

// Only display welcome on first connect in this server period
if( XY_spawnPos isEqualTo [] )then {
    call XY_fnc_welcome;
} else {
    // Adjust spawnpoint in case it is occupied...
    XY_spawnPos = XY_spawnPos findEmptyPosition [0, 25, "B_Quadbike_01_F"];
};

// Check if we have a spawn point...
if( XY_isArrested ) then {
    XY_spawnedOnce = true;
    XY_isArrested = false;
    [player] spawn XY_fnc_jail;
} else {
    if( XY_spawnPos isEqualTo [] )then {

        call XY_fnc_spawnMenu;

        waitUntil{ !(isNull (findDisplay 38500)) };
        waitUntil{ isNull (findDisplay 38500) };

    } else {
        // Set spawn point with short god-mode duration to prevent falling damage
        [ "<t size='0.6' color='#F0C010'>Du startest an deiner letzten bekannten Position</t>", -1, -1, 4, 1 ] spawn BIS_fnc_dynamicText;
        player allowDamage false;
        // Spawn a few cm higher to prevent bugging into stuff
        XY_spawnPos set [2, (XY_spawnPos select 2) + 0.33];
        player setPos XY_spawnPos;
        uisleep 3;
        [] spawn {
            uisleep 3;
            player allowDamage true;
            player setDamage XY_spawnHealth;
        };
    };
};

(findDisplay 46) displayAddEventHandler ["KeyDown", { _this call XY_fnc_keyHandler; } ];

XY_ID_PlayerTags = ["XY_PlayerTags", "onEachFrame", "XY_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;

[player, XY_sidechat, playerSide] remoteExec ["XY_fnc_managesc", 2];

[] call XY_fnc_settingsInit;

0 cutText ["", "BLACK IN", 2];

XY_spawnedOnce = true;
2 cutRsc ["XY_HUD", "PLAIN", 4, false];