enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

RscSpectator_allowFreeCam = false;
if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

EMonkeys_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "core\briefing.sqf";
[] execVM "core\KRON_Strings.sqf";

StartProgress = true;