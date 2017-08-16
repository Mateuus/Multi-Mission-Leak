/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Override BIS_fnc_MP packet EH
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call GTA_fnc_MPexec};

//--- Briefing
#include "initBriefing.hpp"

//--- Compile 3rd part KRON string functions
[] call compileFinal PreprocessFileLineNumbers "KRON_Strings.sqf"; //--- TODO: remove this dependency completely


//--- Headless client
if (!hasInterface) exitWith {
	[] call GTA_hc_fnc_init;
};

//--- Core init
if (isMultiplayer) then {
  //--- Disable sound and hide scene
  0 fadeSound 0;
  0 fadeMusic 0;
  0 fadeRadio 0;
  enableRadio false;
  enableSentences false;
  enableEnvironment false;
  ["SplashNoise", "BLACK"] call GTA_fnc_createRscLayer;
  ["GTA_RscInfoText"] call GTA_fnc_createRscLayer;
  showHud false;
  showChat false;
  showCommandingMenu "";

  onPreloadFinished {
    onPreloadFinished {};
    [player, didJIP, time] spawn compile preprocessFileLineNumbers "core\init.sqf";
  };
};
