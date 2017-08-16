/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

//Load Briefing
[] execVM "briefing.sqf"; 

//Loading Kron Settings
[] execVM "KRON_Strings.sqf";

//Calling new phone check - From Database
[] call life_fnc_cellPhoneCheck;

//Remove Snakes
[] execVM "core\Custom\removesnakes.sqf";

//DLC unlocker
//[] execVM "dlc_unlocker.sqf";

//Removes unwanted markers
[] execVM "core\Custom\removeMarkers.sqf";	

//Fixes the fog glitch
[] execVM "core\Custom\fog.sqf";

// Load no side chat script - this warns and kicks players who are abusing side chat
[] execVM "core\Custom\noSideChat.sqf";

//Load GOPRO and CCTV
//null = [] execVM "secure.sqf";
//null = [[Monitor1,Monitor2,Monitor3,Monitor4],["cctv_1","cctv_2","cctv_3","cctv_4","cctv_5"]] execVM "core\Custom\LFC\feedInit.sqf";

// Load fast rope script for helis
[] execVM "core\Custom\fastrope.sqf";

//Load Towning
//Load Color Correction
[] ExecVM "core\Custom\effectcolorcorrection.sqf";

//Weather
//[] execVM "core\Custom\DynamicWeatherEffects.sqf";


//Disable Fog
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		sleep 590;
	};
};

//Disable Rain
[] spawn {
	while{true} do {
		sleep 10;
		200 setRain 0;
		sleep 590;
	};
};


//Performance
setTerrainGrid 45;
setViewDistance 1000;
setObjectViewDistance [800,50];

StartProgress = true;

nul=[] execVM "scripts\lights.sqf";

//Dynamic market
if(isDedicated && isNil("life_market_prices")) then
{
[] call life_fnc_marketconfiguration;
diag_log "Market prices generated!";
 
"life_market_prices" addPublicVariableEventHandler
{
diag_log format["Market prices updated! %1", _this select 1];
};

//Start server fsm
[] execFSM "core\fsm\server.fsm";
diag_log "Server FSM executed";
};