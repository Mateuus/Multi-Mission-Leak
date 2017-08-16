enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
RscSpectator_allowFreeCam = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG LoP-V 4.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "core\functions\fn_jetmode.sqf";

StartProgress = true;
// Disable fucking AI Voice and Chat Spam yeah :)
player disableConversation true;
enableSentences false;
enableRadio false;
0 fadeRadio 0;

setTerrainGrid 50;