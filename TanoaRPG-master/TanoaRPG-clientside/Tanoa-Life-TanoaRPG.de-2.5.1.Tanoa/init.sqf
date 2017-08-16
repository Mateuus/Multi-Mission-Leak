enableSaving [false, false];
disableRemoteSensors true;
enableSaving[false,false];

if(!isServer && isMultiplayer && !hasInterface) exitWith
{
	diag_log "---------------- Headless Client dected, exit Client Init and Start HC Init !!! -----------";
	[] execVM "KRON_Strings.sqf"; //Load the Server Strings
	[] spawn compile PreprocessFileLineNumbers "\Headless_Client\init.sqf";
};

if (isServer) then { {[_x, [-1, -2, 0]] call bis_fnc_setCuratorVisionModes;} forEach allCurators; };

//Exec Scripts and more...
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf"; //Load the Server Strings

if(isDedicated && isNil("life_market_prices")) then
{
	[] call tanoarpg_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
	//Start server fsm
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

[] execVM "script\welcome.sqf"; //Load Welcome Intro
[] execVM "script\teargas.sqf"; //Load Teargas Script for Cops
[] execVM "script\statusBar.sqf"; //Load the Statusbar

enableEnvironment true;


//Scripts For Client ONLY
if(!isServer) then
{	
	[] spawn {
		waitUntil {!isNull player && player == player};
		
		//Allgemeiner Log
		[[getPlayerUid player, name player], [-1, "SERVER"], 4, "[CONNECT]", "Hat sich eingeloggt"] remoteExec ["TEX_FNC_LOGIT", 2];
		
		//Log Player Cash all 10 minutes
		waitUntil {!isNil "life_cash" && !isNil "life_atmcash"};
		while {true} do 
		{
			sleep 10;
			[player, player, 0, "10MINUTELOG", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];
			sleep 590;
		};
	};
};


//hide Windmills so no synch over the network
{
    hideObject _x;
} foreach (nearestObjects [[8000,8000,0], ["Land_wpp_Turbine_V1_F","Land_wpp_Turbine_V2_F"], 12000]);


//Performance
setTerrainGrid 50;
setViewDistance 1000;
setObjectViewDistance [800,50];


MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};

//BLOCK SIDE
[] execVM "script\nichtimside.sqf";
//Advanced Towing
execVM "script\fn_advancedTowingInit.sqf";