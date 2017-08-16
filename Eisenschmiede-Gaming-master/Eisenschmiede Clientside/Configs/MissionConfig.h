author = "Tonic & Itsyuka | Eisenschmiede";
onLoadName = "Eisenschmiede";
onLoadMission = "Eisenschmiede wünscht dir viel Spass beim Gaming!";
onLoadIntro = "www.Eisenschmiede-Gaming.de";
loadScreen = "Images\Logos\Logo.jpg";
saving = 0;
joinUnassigned = 1;

disabledAI = 1;
disableChannels[]={{0,true,true},{1,true,true},{2,true,true}}; 
disableRandomization[] = {"All"};

respawn = 3;
respawnDialog = 0;
respawndelay = 0;
respawnOnStart = -1;

allowFunctionsRecompile = 0;
forceRotorLibSimulation = 0;
enableDebugConsole = 0;

showHUD[] = {true,true,false,false,true,false,false,true};
class Header { gameType = RPG; minPlayers = 1; maxPlayers = 158;};

wreckManagerMode = 0;
wreckLimit = 3;

corpseManagerMode = 0;
corpseLimit = 30;

#include "ES_CfgMaster.hpp"
#include "..\Dialog\ES_CfgDialog.hpp"
#include "..\maverick\maverick_master.cpp"