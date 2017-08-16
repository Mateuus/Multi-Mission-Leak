/*
	File: fn_playKaraoke.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Begins some awesomeness.
*/
disableSerialization;

waitUntil {life_karaoke != ""};

with uiNamespace do {
	disableSerialization;
    _monitor = missionNamespace getVariable "kar_monitor";
	_song = missionNamespace getVariable "life_karaoke";
    _monitor setObjectTexture [0,format["video\%1.ogv", _song]]; 
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText format["video\%1.ogv", _song];
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
		kar_monitor setObjectTexture [0, "images\mission_splash.jpg"];
    }];
    _scr ctrlCommit 0;
};