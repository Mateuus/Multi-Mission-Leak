/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Wait until player object is available
waitUntil {!isNull player};

//--- Wait for player object to be local
waitUntil {local player};

//--- Wait for SteamID
waitUntil {getPlayerUID player != ""};

//--- Wait for game display
["Waiting for 3D display."] call GTA_fnc_log;
waitUntil {!isNull findDisplay 46};

//--- Hide development watermark
{
	(findDisplay 46 displayCtrl _x) ctrlShow false;
} forEach [1000, 1001, 1002, 1200, 1202];

//--- Reset colours
/*
{
  if !(isNil {profileNamespace getVariable _x}) then {
    profileNamespace setVariable [_x, nil];
  };
} forEach ["GUI_BCG_RGB_R", "GUI_BCG_RGB_G", "GUI_BCG_RGB_B", "GUI_BCG_RGB_A"];*/

//--- Custom GUI menu colours
profileNamespace setVariable ["GUI_BCG_RGB_R", 0.85];
profileNamespace setVariable ["GUI_BCG_RGB_G", 0.05];
profileNamespace setVariable ["GUI_BCG_RGB_B", 0.05];
profileNamespace setVariable ["GUI_BCG_RGB_A", 0.8];
saveProfileNamespace;

GTA_player_received = false;
GTA_perks_received = false;
GTA_perks = [];
life_talent_talents = []; //--- Compatibility

//--- Default camera
setDefaultCamera [[3150.5, 13097.5, 71], [1, 0, 0]];

//--- Setup title
GTA_RscInfoText_title = "Initializing";
GTA_RscInfoText_subtitle = "Setting up client...";

["Initializing..."] call GTA_fnc_log;

//--- Disable unit damage
player allowDamage false;

//--- Setup initial client core functions
["Reading config."] call GTA_fnc_log;
[] call compile preprocessFileLineNumbers "core\configuration.sqf";

//--- Unit texture sync
["Syncing unit textures."] call GTA_fnc_log;
{
  if (isPlayer _x) then {
    [_x] call GTA_fnc_setUnitTextures;
};
} forEach allUnits;

//--- Vehicle sync
["Syncing vehicles."] call GTA_fnc_log;
[] call GTA_fnc_vehicleSync;

//--- Color corrections
//[] spawn GTA_fnc_colorCorrections;

//--- Request client key
GTA_RscInfoText_subtitle = "Creating client session...";
[[getPlayerUID player, player], "GTA_fnc_createSession", false] call GTA_fnc_remoteExec;
waitUntil {!isNil "GTA_session_id"};

GTA_RscInfoText_subtitle = "Transfering functions from server...";

["Waiting for vanilla functions to transfer."] call GTA_fnc_log;
waitUntil {!isNil {clientGangLeader}};

["Waiting for GTA functions to transfer."] call GTA_fnc_log;
waitUntil {!isNil "GTA_broadcastFunctions"};
[] call GTA_fnc_functionsReceived;

GTA_RscInfoText_subtitle = "Waiting for server...";

["Waiting for server to be ready."] call GTA_fnc_log;
waitUntil {!isNil "GTA_serverReady"};

GTA_RscInfoText_subtitle = "Requesting player data...";

//--- Query perks data
["Querying player perk data."] call GTA_fnc_log;
[[getPlayerUID player, player, playerSide], "GTA_db_fnc_queryPerks", false] call GTA_fnc_remoteExec;

//--- Wait for perks data to be received
waitUntil {GTA_perks_received};

//--- Player setup
["Setting up player."] call GTA_fnc_log;

//--- Query player data
["Querying player data."] call GTA_fnc_log;
[] call GTA_fnc_queryPlayer;

//--- Wait for data to be received
waitUntil {GTA_player_received};

GTA_RscInfoText_subtitle = "Finalizing client setup...";

//--- VON check
["Starting VON check system."] call GTA_fnc_log;
["GTA_fnc_voiceCheck", "onEachFrame", GTA_fnc_voiceCheck] call BIS_fnc_addStackedEventHandler;

//--- Misc checks
GTA_lastCameraView = "";
GTA_lastVisibleMap = false;

addMissionEventHandler ["EachFrame", {
  disableSerialization;

  private _data = cameraView;
  if !(_data isEqualTo GTA_lastCameraView) then {
    //--- Group view
    if (_data == "GROUP") then {
      cameraOn switchCamera GTA_lastCameraView;
    };

    GTA_lastCameraView = _data;
  };

  if (commandingMenu != "") then {
    showCommandingMenu "";
  };

  //--- Force groups to "stop" to prevent commanding issues
  /*if !(formationMembers player isEqualTo [player]) then {
    doStop units player;
  };*/

  //--- RscDisplayDiary
  if (!isNull findDisplay 129) then {
    findDisplay 129 closeDisplay 2;
  };

  _data = visibleMap;
  if !(_data isEqualTo GTA_lastVisibleMap) then {
    GTA_lastVisibleMap = _data;

    if (_data) then {
      //--- Center the map to the player
      private _ctrlMap = findDisplay 12 displayCtrl 51;
      _ctrlMap ctrlMapAnimAdd [0, ctrlMapScale _ctrlMap, getPosASLVisual player];
      ctrlMapAnimCommit _ctrlMap;
    };
  };
}];

//--- Camera view
//["Starting camera view check system."] call GTA_fnc_log;
//["GTA_fnc_cameraView", "onEachFrame", GTA_fnc_cameraView] call BIS_fnc_addStackedEventHandler;

//--- Welcome screen
GTA_RscInfoText_title = "";
GTA_RscInfoText_subtitle = "";
["Show welcome display."] call GTA_fnc_log;
[false] call GTA_fnc_welcome;

//--- Spawn
if (playerSide == civilian && {life_is_gta_arrested}) then {
  //--- Send to jail
  life_is_gta_arrested = false;
  [player, true] spawn life_fnc_gtaJail;
} else {
  //--- Open spawn selection
  [] call GTA_fnc_selectSpawn;
};

//--- Enable unit damage
player allowDamage true;

//--- Survival
["Initializing survival system."] call GTA_fnc_log;
[] call GTA_fnc_survival;
[] call GTA_fnc_playerEffects; //--- TODO: Implement into survival

//--- Auto save
["Starting auto save loop."] call GTA_fnc_log;
[] spawn GTA_fnc_autoSave;

//--- Set camera to 3rd person
player switchCamera "EXTERNAL";

//--- Switch to direct channel
setCurrentChannel 5;

//--- Draw map icons
//[] spawn GTA_fnc_mapDrawIcons;

//--- Disable unit conversations
player disableConversation true;
player setVariable ["BIS_noCoreConversations", true];
player setSpeaker "NoVoice";

//--- Enable sound and show scene
5 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
enableEnvironment true;
["SplashNoise"] call GTA_fnc_destroyRscLayer;
["GTA_RscInfoText"] call GTA_fnc_destroyRscLayer;
showHud true;
showChat true;
showCommandingMenu "";

//--- Play music intro
playMusic "Intro";

//--- Make the paycheck a constant
["life_paycheck", life_paycheck] call GTA_fnc_setConstant;

//--- Pay manager
["Starting pay manager."] call GTA_fnc_log;
[] spawn GTA_fnc_payManager;

//--- Programatically activate the map "texture" button
//ctrlActivate ((findDisplay 12) displayCtrl 107);

//--- Setup sound suppression/toggle
["Setting up sound suppression + toggle."] call GTA_fnc_log;
GTA_soundMuted = false;
GTA_soundSuppressed = false;
["GTA_RscSoundStatus"] call GTA_fnc_createRscLayer;

//--- Setup event handlers
["Setting up event handlers."] call GTA_fnc_log;
[] call GTA_fnc_initEventHandlers;

//--- Setup actions
["Setting up player actions."] call GTA_fnc_log;
[] call GTA_fnc_initActions;

//--- Show the HUD
["Starting HUD."] call GTA_fnc_log;
["GTA_RscHUD"] call GTA_fnc_createRscLayer;

//--- Name tags
[true] call GTA_fnc_nameTags;

//--- Map icons
[true] call GTA_fnc_mapIcons;

["Initialization complete."] call GTA_fnc_log;

//--- Init variable
GTA_init = true;
