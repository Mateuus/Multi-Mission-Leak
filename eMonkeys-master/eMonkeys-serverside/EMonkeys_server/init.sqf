"ArmaLeakTeam" serverCommand "#lock";

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

EMonkeys_fnc_MPexec = compilefinal preprocessFile "\EMonkeys_server\functions\network\fn_MPexec.sqf";
altislifehive = 1;
publicVariable "altislifehive";
debug = false;
publicVariable "debug";
EMonkeys_server_firststart = true;
publicVariable "EMonkeys_server_firststart";

EMonkeys_server_isReady = false;
EMonkeys_HC_isActive = false;
EMonkeys_HC2_isActive = false;
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Ended";

publicVariable "EMonkeys_fnc_TutorialCam";
publicVariable "EMonkeys_fnc_impoundItem";
publicVariable "EMonkeys_fnc_gpsTracker";
publicVariable "EMonkeys_fnc_gpsScannerOpen";
publicVariable "EMonkeys_fnc_gpsMarker";
publicVariable "EMonkeys_fnc_gpsDelete";

publicVariable "EMonkeys_fnc_fillFuelstation";
publicVariable "EMonkeys_fnc_fuelMenu";
publicVariable "EMonkeys_fnc_fuelMenuAir";
publicVariable "EMonkeys_fnc_fuelstationOwnerMenu";
publicVariable "EMonkeys_fnc_nearestVehicleFuel";
publicVariable "EMonkeys_fnc_robFuelstation";
publicVariable "EMonkeys_fnc_startAirVehicleFueling";
publicVariable "EMonkeys_fnc_startVehicleFueling";

publicVariable "EMonkeys_HC_isActive";
publicVariable "EMonkeys_HC2_isActive";

publicVariable "EMonkeys_server_isReady";


Emonkeys_fnc_var = {uiSleep 45;

	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call 
	{
	private 	['_handled','_shift','_alt','_code','_ctrl','_alt','_ctrlKey','_veh','_locked','_interactionKey','_mapKey','_interruptionKeys'];
		_ctrl = _this select 0;
		_code = _this select 1;
		_shift = _this select 2;
		_ctrlKey = _this select 3;
		_alt = _this select 4;
		_handled = false;

		if(_code isEqualTo 210) then {
			_text = format ['<<<<Taste>>>>Playerid|%1| Playername|%2| pos|%3| cursorTarget|%4',getPlayerUID player, profileName, getpos player,str(cursorTarget)];
			[[8,_text],'TON_fnc_log',false,false] call EMonkeys_fnc_mp;
		};
		_handled
	}"];
};

publicVariable "Emonkeys_fnc_var";

[] execVM "\EMonkeys_server\functions.sqf";
[] execVM "\EMonkeys_server\eventhandlers.sqf";

__CONST__(JxMxE_PublishVehicle,"No");

EMonkeys_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

EMonkeys_gang_list = [];
publicVariable "EMonkeys_gang_list";

[8,true,12] execFSM "\EMonkeys_server\fsm\timeModule.fsm";

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn 
{
	while {true} do 
	{
		{
			if((count (units _x) == 0) && !(_x == Emonkeys_copg) && !(_x == Emonkeys_medg) ) then 
			{
				//Delete the group
				deleteGroup _x;
			};
		} forEach allGroups;
		


60 setwaves 0;
60 setfog 0.00;
60 setRain 0;
60 setOvercast 0;
60 setRainbow 0;
60 setWaves 0;
60 setLightnings 0;


		
		sleep 300;
	};
};

Emonkeys_copg = createGroup west;
Emonkeys_medg = createGroup independent;
publicVariable "Emonkeys_copg";
publicVariable "Emonkeys_medg";
[] spawn EMonkeys_fnc_Veriable;

player_DC = ["player_Disconnected","onPlayerDisconnected",{
[[_uid,_name],"EMonkeys_fnc_Playerdisconnect",HC_player,false] call EMonkeys_fnc_mp;
if(!isNil "HC_UID" && (_uid == HC_UID)) then { EMonkeys_HC_isActive = false; publicVariable "EMonkeys_HC_isActive";  HC_UID = "";};
if(!isNil "HC2_UID" && (_uid == HC2_UID)) then { EMonkeys_HC2_isActive = false; publicVariable "EMonkeys_HC2_isActive"; HC2_UID = "";};

}] call BIS_fnc_addStackedEventHandler;
 
player_con = ["player_Connected","onPlayerConnected",{[[_uid],"EMonkeys_fnc_Playerconnect",HC_player,false] call EMonkeys_fnc_mp;}] call BIS_fnc_addStackedEventHandler;

EMonkeys_server_isReady = true;

publicVariable "EMonkeys_server_isReady";

[]spawn 
{ 
	_Basis1 = [] execVM "\EMonkeys_server\global_objects.sqf";
	waitUntil {scriptDone _Basis1}; 
	diag_log "Basis Finish";
	uisleep 40;
	"ArmaLeakTeam" serverCommand "#unlock";
};