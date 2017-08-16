/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs all the players scripts needed to properly connect
*/

private ["_noBlack","_handle","_playTime"];

DS_dataReceived = false;

//No black UID's
_noBlack = ["76561198038366032","76561197992718808","76561198073680229","76561198067949555","76561198088153735","76561198176900577","76561198139940358","76561198073613608","76561198144709998","76561198124984854"];

if(isServer)then {
	DS_housesLoaded = true;
	publicVariable "DS_housesLoaded";
};

//Black out screen while player is getting set up
0 cutText ["Connecting to The Darkside database...","BLACK FADED"];
0 cutFadeOut 9999999;
if((getPlayerUID player) in _noBlack)then{cutText ["Connecting to The Darkside database...","BLACK IN"];};

//Hold the script until the players unit has spawned in
_noBlack spawn {
	disableSerialization;

	while{true}do {
		if(getPlayerUID player in _this)exitWith{};
		if(player distance spawnIsland > 1000)exitWith{};
		if((!isNull findDisplay 63)&&(!isNull findDisplay 46))then {
			if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa")then {
				if (ctrlText ((findDisplay 63) displayCtrl 101) == "Direct communication")then {
					if(player distance spawnIsland < 1000)then {
						player setPos (getMarkerPos "spawnIsland2");
						systemChat "You've been moved away from the normal people since you love the sound of voices on spawn Island";
					};
				};
			};
		};
		sleep 1;
	};
};

waitUntil {((!isNull player)&&(player isEqualTo player))};

//Load player variables into players memory
[] call compile preprocessFileLineNumbers "player\global\variables.sqf";
[] call DS_fnc_setupPlayerEventHandlers;

//Just in case server is not currently ready (Still loading at server start)
0 cutText ["Server is setting up, please wait...","BLACK FADED"];
0 cutFadeOut 99999999;
if((getPlayerUID player) in _noBlack)then{cutText ["Server is setting up, please wait...","BLACK IN"];};

//Load default vars before DB loads
[] call DS_fnc_inventoryItems;
[] call DS_fnc_setupLicenses;
[] spawn DS_fnc_cheater;

switch (playerside)do {
	case west: {
		[] call compile preprocessFileLineNumbers "player\police\compile.sqf";
		[] call compile preprocessFileLineNumbers "player\police\variables.sqf";
	};
	case civilian: {
		[] call compile preprocessFileLineNumbers "player\civilian\compile.sqf";
	};
};

waitUntil{DS_housesLoaded};

if(!isServer)then {
	waitUntil {!isNil "DS_server_setup"};
	DS_player_setup = false;
	[] call DS_fnc_playerLogin;
	waitUntil {DS_player_setup};
};

0 cutText["Client setup complete","BLACK FADED"];
0 cutFadeOut 9999999;
if((getPlayerUID player) in _noBlack)then{cutText ["Client setup complete","BLACK IN"];};

//This needs to be loaded before loading in
DS_useFuel = false;

_playTime = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
DS_perkLevel = 0;
switch(true)do {
	case (_playTime > 60000): {DS_perkLevel = 5};
	case (_playTime > 45000): {DS_perkLevel = 4};
	case (_playTime > 12000): {DS_perkLevel = 3};//200 hours
	case (_playTime > 6000): {DS_perkLevel = 2};//100 hours
	case (_playTime > 3000): {DS_perkLevel = 1};//50 hours
};

DS_firstSpawn = true;

switch (playerside)do {
	case west: {
		_handle = [] execVM "player\police\setup.sqf";
	};
	case civilian: {
		_handle = [] execVM "player\civilian\setup.sqf";
	};
	case independent: {
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
	};
};

//Wait until player setup is completed
if(!(playerSide isEqualTo independent))then {
	waitUntil {scriptDone _handle};
};

//Wait until the primary display exist
waitUntil {!(isNull (findDisplay 46))};

player addRating 99999999;
[] call DS_fnc_setupHud;

player setVariable ["name",profileName,true];
player setVariable ["player",true,true];
player setVariable ["uid",(getPlayerUID player),true];

DS_fnc_moveIn = compileFinal "player moveInCargo (_this select 0);";

_list = [[25704.5,21378.5,0.00145912],[3757.14,13477.9,-0.0540276],[3757.54,13485.9,-0.010498],[4001.12,12592.1,-0.0966625],[5023.26,14429.6,-0.0978947],[5019.68,14436.7,-0.0114822],[5267.8,11046.5,0.000553131],[5269.46,11040.9,0.00164413],[6198.83,15081.4,-0.0912418],[6798.15,15561.6,-0.0441437],[9205.75,12112.2,-0.0487232],[9021.82,15728.7,-0.0293427],[9023.75,15729,-0.0271606],[9025.78,15729.4,-0.0206528],[8481.69,18260.7,-0.0266876],[5769,20085.7,-0.0156555],[11831.6,14155.9,-0.0342016],[12024.7,15830,-0.0298138],[12026.6,15830.1,-0.0342979],[12028.4,15830,-0.0388737],[13550.5,10170.2,-3.91006e-005],[13556.5,10173.1,0.00147057],[13561.6,10176,0.00102425],[13569.1,10138.2,-0.0015316],[13573.3,10140.3,0.000606537],[13577.9,10142.7,-2.38419e-005],[14173.2,16541.8,-0.0946102],[14586.3,16653.3,0],[15342.7,12919.4,-0.313377],[15343.4,12937.1,-0.140732],[15347.9,12919.3,-0.089879],[15349.1,12936.6,-0.125686],[14221.4,18302.5,-0.0697155],[14065,18788.3,0],[15297.1,17565.9,-0.283808],[15781,17453.2,-0.285281],[16750.9,12513.1,-0.0525198],[16871.7,15476.6,0.010293],[16875.2,15469.4,0.037343],[17417.2,13936.7,-0.10652],[19961.3,11454.6,-0.0349236],[19965.1,11447.6,-0.0483704],[20784.8,16665.9,-0.0521202],[20789.6,16672.3,-0.0213318],[21230.4,7116.56,-0.0604229],[23379.4,19799,-0.0544052],[25693.6,21389.5,0],[25701.2,21372.5,0.207661],[25697.1,21393.1,0],[25701.9,21385.3,0],[25705.5,21376.6,0],[25710.6,21381.7,0]];
{
	{
		_x setFuelCargo 0;
	} forEach (nearestObjects [_x,["Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FS_Feed_F"],40]);
}forEach _list;

if(DS_adminLevel > 0)then {player setVariable ["DSAdmin",true,true];};
if((getPlayerUID player) in DS_adminList1)then {player setVariable ["DSAdmin",true,true];};
if((getPlayerUID player) in DS_adminList2)then {DS_adminLevel = 2;};
if((getPlayerUID player) in DS_adminList3)then {DS_adminLevel = 3;};
if((getPlayerUID player) in DS_adminList4)then {DS_adminLevel = 4;};

[] spawn DS_fnc_payments;
[] spawn DS_fnc_motd;
[] spawn DS_fnc_health;
[] spawn DS_fnc_useFuel;
DS_playTime = time;
[] spawn DS_fnc_onEscape;
[] call DS_fnc_stamina;

if(playerside in [civilian,west])then {
	[] call DS_fnc_setupPlayerActions;
};

/*
[] spawn {
	_lastMenu = "";

	while{true}do {
		waitUntil {!(commandingMenu isEqualTo _lastMenu)};

		_lastMenu = commandingMenu;

		if(commandingMenu isEqualTo "#CUSTOM_RADIO")then {
			//Perform some checks
			if(DS_donorLevel < 1)exitWith{showCommandingMenu "";hint "You can't play custom sounds as a non-donor";};
			if(DS_soundPlayed)exitWith{showCommandingMenu "";hint "You can't play custom sounds right now as you are currently on a cooldown";};
			if(DS_jailed)exitWith{showCommandingMenu "";hint "You can't play custom sounds while in jail";};
			if(player getVariable ["restrained",false])exitWith{showCommandingMenu "";hint "You can't play custom sounds while restrained";};
			if(currentChannel in [0,1,2,6,7,8])exitWith {showCommandingMenu "";hint "You can't play custom sounds in your current channel";};

			//Allow the sound menu to be used
			DS_soundPlayed = true;

			[] spawn {
				sleep 20;
				DS_soundPlayed = false;
			};
		};
	};
};
*/