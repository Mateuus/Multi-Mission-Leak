/*
    Author: Blackd0g
    File: fn_postInit.sqf

    Description:
    Inits client
*/
if (isServer) exitWith {};
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(LHM_fnc_endMission,LHM_fnc_endMission);

LHM_initDone = false;

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting Loewenherz Life Client Init --------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

if (!hasInterface) exitWith {};
enableSaving [false, false];

profileNamespace setVariable ['GUI_BCG_RGB_R',1];
profileNamespace setVariable ['GUI_BCG_RGB_G',0];
profileNamespace setVariable ['GUI_BCG_RGB_B',0];
profileNamespace setVariable ['GUI_BCG_RGB_A',0.937124];

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

KK_fnc_fileExists = {
    private ["_ctrl", "_fileExists"];
    disableSerialization;
    _ctrl = findDisplay 0 ctrlCreate ["RscHTML", -1];
    _ctrl htmlLoad _this;
    _fileExists = ctrlHTMLLoaded _ctrl;
    ctrlDelete _ctrl;
    _fileExists
};

[] call lhm_fnc_clientValidator;

lhm_firstSpawn = true;
lhm_session_completed = false;
JipDone = false;
player allowDamage false;
enableSentences false;
enableRadio false;
0 fadeRadio 0;
showChat false;
showHud false;

("lh_loadingScreen" call BIS_fnc_rscLayer) cutRsc ["lh_loadingScreen","BLACK"];

diag_log "::lhm Client:: waiting - prepare Client";

diag_log "::lhm Client:: Initialization Variables";
_handle = [] spawn lhm_fnc_configuration;
waitUntil {ScriptDone _handle};
diag_log "::lhm Client:: Variables initialized";

diag_log "::lhm Client:: checking Client Language Version..";
_passed = [] call lhm_fnc_loginCheck;
if(!_passed) exitWith {diag_log "::lhm Client:: Your Client Version is not allowed!"};

[] spawn lhm_fnc_initPlayer;
diag_log "::lhm Client:: PostInitialization complete";