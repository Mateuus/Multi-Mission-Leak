/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
if(!hasInterface && !isDedicated) exitWith {player remoteExec ["SOA_fnc_startHC",2]};

[] spawn {

	if!(profileNameSpace getvariable [format["%1_agbaccepted_%2",missionName,getplayerUID player],false]) then {
		private["_dialog","_accepted"];
		disableSerialization;
		troll = false;

		titletext ["","BLACK"];
		sleep 2;
		createDialog "agb";
	    _dialog = finddisplay 32154;
	    waitUntil{sleep 0.1; !isNull _dialog};
	    _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
	    waitUntil{sleep 0.1; isNull _dialog};
	    if(troll) exitWith {['agb',false,true] call BIS_fnc_endMission};

	    titleText ["","BLACK IN"];
	    profileNameSpace setvariable [format["%1_agbaccepted_%2",missionName,getplayerUID player],true];
	    saveProfileNamespace;
	};

	16 cutRsc ["preloadscreen","PLAIN"];
	17 cutRsc ["loadscreen","PLAIN"];

	player enableSimulation false;
	ClientOwner remoteExecCall ["crypto_fnc_init",2];

	[] execVM "KRON_Strings.sqf";
	[] execVM "IgiLoad\IgiLoadInit.sqf";

	life_revealObjects = true;
	setTerrainGrid 50;
	setObjectViewDistance [800,100];
	setViewDistance 800;
	enableEnvironment false;

	timestarted = diag_tickTime;

	#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
	__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
	//["EastWind",0,false] call bis_fnc_setppeffecttemplate;
	if(snowActive) then {[5] spawn life_fnc_snow;};
	[] execVM "core\jip.sqf";
};