
author = "Zero-One Development";
onLoadName = "Altis Life RPG";
onLoadMission = "Altis Life - www.Zero-One.cc";
loadScreen = "Resources\Textures\Images\autohaendler.jpg";
joinUnassigned = 1;
briefing = 1;
respawnDialog = 0;
respawn = BASE;
respawndelay = 0;
disabledAI = 1;
disableChannels[]={}; 
enableDebugConsole = 1;
corpseManagerMode = 0;
corpseLimit = 30;
wreckManagerMode = 0;
forceRotorLibSimulation = 0;
onPauseScript[] = {"zero_fnc_Xnq"};
disableRandomization[] = {"All"};

class Header
{
 gameType = RPG;
 minPlayers = 1;
 maxPlayers = 311;
};

#include "CfgVehicles.h"
#include "CfgVehicleShops.h"
#include "CfgItemShops.h"
#include "CfgItems.h"
#include "CfgDialogs.h"
#include "CfgMaterials.h"

class RscTitles
{
 #include "CfgTitles.h"
};

class CfgFunctions
{
 #include "CfgFunctions.h"
};

class CfgSounds
{
 #include "CfgSounds.h"
};

class CfgDebriefing
{
 #include "CfgDebriefings.h"
};

class CfgDebriefingSections
{
 #include "CfgDebriefingSections.h"
};

class CfgNotifications
{
 #include "CfgNotifications.h"
};

class CfgremoteExec
{
 #include "CfgremoteExec.h"
};

class CfgCommands {
 allowedHTMLLoadURIs[] += {
 "http://bugtracker.zero-one.cc/api.php*"
 };
};
