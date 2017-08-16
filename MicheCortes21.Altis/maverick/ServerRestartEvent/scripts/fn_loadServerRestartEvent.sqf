/*
	Author: Maverick Applications
	Desc: Altis Life ServerRestartEvent
*/

//Do not touch below
[] spawn {
    if(getNumber(missionConfigFile >> "Maverick_ServerRestartEvent" >> "AutoRestart") != 1 || !isServer) exitWith {};
    waitUntil{diag_tickTime >= (getNumber(missionConfigFile >> "Maverick_ServerRestartEvent" >> "ServerRestartTime") - 300)};
    (parseText getText(missionConfigFile >> "Maverick_ServerRestartEvent" >> "MessageRestartAnnounce")) remoteExec ["hint", -2];
    mav_restartincoming = true;
    publicVariable "mav_restartincoming";
    sleep 230;
    [0] remoteExec ["mav_ServerRestartEvent_fnc_ServerRestartEvent"];
};