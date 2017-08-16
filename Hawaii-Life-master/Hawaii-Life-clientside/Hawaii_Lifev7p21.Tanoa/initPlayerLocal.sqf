/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.
if(!hasInterface) exitWith {};
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

{if((typeOf _x) in ["Land_InfoStand_V2_F","Land_InfoStand_V1_F"]) then {_x setObjectTexture [0,"textures\info.paa"];_x setObjectMaterial [0, "textures\vr_white.rvmat"];};} foreach (allMissionObjects "Thing");

DYNAMICMARKET_boughtItems = [];
if (life_HC_isActive) then {
	[getPlayerUID player] remoteExecCall ["HC_fnc_playerLogged",HC_Life];
};

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

["ANTI_MAP_LINIEN","onEachFrame",{{if(markerShape _x=="POLYLINE")then{deleteMarker _x}}forEach allMapMarkers}]call BIS_fnc_addStackedEventHandler;