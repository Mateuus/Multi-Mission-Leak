enableSaving [false, false];
disableRemoteSensors true;

// Try to fix VON Channels Local
0 enableChannel false; // Disable user ability to send voice and text on global channel
1 enableChannel false; // Disable user ability to send voice and text on Side channel
2 enableChannel false; // Disable user ability to send voice and text on Command channel
3 enableChannel false; // Disable user ability to send voice and text on Group channel
4 enableChannel false; // Disable user ability to send voice and text on Vehicle channel
5 enableChannel false; // Disable user ability to send voice and text on Direct channel

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
introSpawn = nil;
DWEV_restart_cleanup = false;
DWEV_HC_VALID = false;

if(!isDedicated) then { X_Client = true;};

DWEV_versionInfo = "Altis Life RPG v3.1.4.8";

if (hasInterface) then  // Diese SachenNUR beim Client ausführen
{
	[] execVM "briefing.sqf"; //Load Briefing	
	[] execVM "core\session\fn_sessionMenu.sqf";
	[] execVM "core\actions\fn_addKey.sqf";
};

[] execVM "KRON_Strings.sqf";

StartProgress = true;