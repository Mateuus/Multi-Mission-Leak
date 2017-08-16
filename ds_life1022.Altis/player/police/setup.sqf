/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up a police officer
*/

private ["_noBlack"];

waitUntil {!(isNull (findDisplay 46))};
waitUntil {player distance spawnIsland < 500};

if(!isServer)then {
	if(isNil "DS_gear")then{DS_gear = [];};
	if(DS_gear isEqualTo [])then {[] spawn DS_cop_copDefault;};
} else {
	[] spawn DS_cop_copDefault;
};

//No black UID's
_noBlack = ["76561198038366032","76561197992718808","76561198073680229","76561198067949555","76561198088153735","76561198176900577","76561198139940358","76561198073613608","76561198144709998","76561198124984854"];

if((getPlayerUID player) in _noBlack)then {
	DS_teleportAction = player addAction ["<t color='#5dde1c'>Switch Islands</t>",{
		if(player distance spawnIsland < 1000)then {
			player setPos (getMarkerPos "spawnIsland2");
			systemChat "You teleported to voice spawn island.";
		} else {
			player setPos (getPos spawnIsland);
			systemChat "You teleported to main spawn island.";
		};
	}];

	DS_spawnInAction = player addAction ["<t color='#5dde1c'>Open Spawn Menu</t>",{
		[] call DS_fnc_menuSpawnScreen;
		player removeAction DS_spawnInAction;
		player removeAction DS_teleportAction;
	}];
} else {
	[] call DS_fnc_menuSpawnScreen;
};

[] call DS_fnc_copUniform;

if((getPlayerUID player) in DS_tempBans)exitWith {
	player setPos (getMarkerPos "chopDrop");
	["tempBan",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(DS_blacklisted)exitWith {
	player setPos (getMarkerPos "chopDrop");
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((getPlayerUID player) in firedCops)exitWith {
	player setPos (getMarkerPos "chopDrop");
	["officerKick",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"])) then {
	if(DS_copLevel == 0)then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if(((str(player) in ["cop_4","cop_1","cop_3","cop_5","cop_6","cop_7"]))&&((DS_infoArray select 1) < 300))exitWith {
	player setPos (getMarkerPos "chopDrop");
	["NotEnoughHours",false,true] call BIS_fnc_endMission;
	sleep 30;
};

[west,player] remoteExec ["HUNT_fnc_setupChat",2];
player setVariable ["stunAmmo",true,true];
player setVariable ["policeAction","",true];

[] spawn DS_cop_pubcopLoop;
[] call DS_cop_addToSquad;

//Evict markers
[] call DS_cop_loadEvictMarkers;

//Police mission & convoys markers
if((DS_copMissionsActive)&&!(isNil "DS_currentCopMission"))then {
	[DS_currentCopMission,false] call DS_cop_missionMarkers;
};

if((police_convoy)&&!(isNil "DS_policeConvoyPhase"))then {
	if(DS_policeConvoyPhase == 4)then {
		[DS_policeConvoyPoint,true,false] call DS_cop_convoyMarkers;
	} else {
		[DS_policeConvoyPoint,false,false] call DS_cop_convoyMarkers;
	};
};