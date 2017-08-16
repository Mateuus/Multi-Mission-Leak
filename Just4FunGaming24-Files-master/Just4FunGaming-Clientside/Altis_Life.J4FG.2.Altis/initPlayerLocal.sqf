// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( !hasInterface ) exitWith {};

removeAllWeapons player;
removeBackpack player;
removeAllAssignedItems player;
removeGoggles player;
removeHeadgear player;
removeUniform player;
removeVest player;

removeAllMissionEventHandlers "draw3D";

_whitelist = [
    "rscrespawncounter_script",
    "rscdebugconsole_watchsave",
    "rscstanceinfo_script",
    "rscdiary_playerpos",
    "rscrevive_script",
    "rscunitinfo_script",
    "rscslingloadassistant_script",
    "rsctestcontrolstyles_script",
    "igui_displays",
    "rscphaserules_script",
    "rscadvancedhint_script",
    "rscfiringdrilltime_script",
    "rscdiary_script",
    "mpmarkdisplays_displays",
    "loading_classes",
    "rscunitinfo",
    "rscminimap_script",
    "rscstatic_script",
    "rscmissiontext_script",
    "rscdiary",
    "rscmsgbox",
    "rscprocedurevisualization_script",
    "igui_classes",
    "gui_classes",
    "rscavcamera_script",
    "rscfunctionsviewer_script",
    "rscspectator_script",
    "rscfiringdrillcheckpoint_script",
    "rscmsgbox3_script",
    "rscvrmeta_script",
    "loading_displays",
    "rscrecruitstatus_script",
    "rscestablishingshot_script",
    "rsccuratorping_script",
    "rscmsgbox_script",
    "rsctestcontroltypes_script",
    "rsctilesgroup_script",
    "mpmarkdisplays_classes",
    "rscstanceinfo",
    "rsccuratorvisionmodes_script",
    "rscnoise_script",
    "rscnotification_script",
    "rscmissionstatus_script",
    "rscdiary_playerpostime",
    "rsccommmenuitems_script",
    "gui_displays",
    "rschvtphase_script",
    "rscdiary_playeralpha"
];

{
    if( _x find "bis_" == -1 && { _x find "rscdisplay" == -1 } && { !(_x in _whitelist) } )then {
        uiNamespace setVariable [_x, nil];
    };
} forEach (allVariables uiNamespace);

enableSentences false;
enableRadio false;
0 fadeRadio 0;

player setVariable ["BIS_enableRandomization", false, true];
player setVariable ["BIS_noCoreConversations", true];

// market price listener
"XY_marketPrices" addPublicVariableEventHandler { _this call XY_fnc_marketUpdate; };

// Execute AL main init...
call XY_fnc_init;

player setVariable["copLevel", XY_copLevel, true];
player setVariable["medicLevel", XY_medicLevel, true];
player setVariable["thwLevel", XY_thwLevel, true];

private _side = switch( playerSide ) do {
    case west: {"COP"};
    case east: {"THW"};
    case independent: {"MEDIC"};
    case civilian: {"CIV"};
    default {"ERR"};
};
[ getPlayerUID player, 15, format["Anmeldung als %1, Name %2", _side, profileName] ] remoteExec ["XYDB_fnc_log", XYDB];

if( license_cop_air_small && license_cop_air ) then {
    license_cop_air_small = false;
};

[] spawn XY_fnc_initSurvival;

// init addons
[] spawn XY_fnc_allergy;
[] spawn XY_fnc_autosave;
[] spawn XY_fnc_briefing;
[] spawn XY_fnc_emptyfuel;
[] spawn XY_fnc_equipCarrier;
[] spawn XY_fnc_disableThermal;
[] spawn XY_fnc_playerMarkers;
["init"] spawn XY_fnc_markerManager;
[] spawn XY_fnc_market;
[] spawn XY_fnc_noside;
[] spawn XY_fnc_paycheck;
[] spawn XY_fnc_speedtrap;
[] spawn XY_fnc_racingSupport;
[] spawn XY_fnc_radiation;
[] spawn XY_fnc_refuelSupport;
[] spawn XY_fnc_safezone;
[] spawn XY_fnc_spikestripEffect;
// [] spawn XY_fnc_snow;
[] spawn XY_fnc_teargas;
[] spawn XY_fnc_textures;

[] spawn XY_fnc_diagnoseFPS;
[] spawn XY_fnc_cashCheck;

("SplashNoise" call BIS_fnc_rscLayer) cutRsc ["SplashNoise", "BLACK IN", 10, false];

[] spawn { scriptName "HUDupdate";
    while { true } do {
        uisleep 1;
        if( alive player ) then {
            [] call XY_fnc_updateHUD;
        };
    };
};

[player] remoteExec ["XY_fnc_pollMarketPrices", 2];
[player] remoteExec ["XYDB_fnc_uidToName", XYDB];

// -- Oil Rig --

private _tower = nearestObject [[19604, 21918, 0], "Land_TTowerBig_2_F"];

private _firePos = (getPos _tower);
_firePos set[2, 53];

private _source = "#particlesource" createVehicleLocal _firePos;
_source setParticleClass "BigDestructionFire";
_source setParticleFire [0.15, 5, 0.75];

_source = "#particlesource" createVehicleLocal _firePos;
_source setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48],
    "",
    "Billboard",
    1,
    30,
    [0, 0, 0],
    [0, 0, 3],
    0,
    1.2,
    1,
    0.025,
    [3, 15, 50],
    [[0, 0, 0, 0.05], [0.05, 0.05, 0.05, 0.6], [0.07, 0.07, 0.07, 0.3], [0.1, 0.1, 0.1, 0]],
    [0.5],
    0,
    0,
    "",
    "",
    _firePos,
    0
];
_source setParticleRandom [6, [2, 2, 1], [0.1, 0.1, 0.1], 0, 0.25, [0.1, 0.1, 0.1, 0.05], 0, 0, 90];
_source setDropInterval 0.085;