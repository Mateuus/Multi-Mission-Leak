/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Runs all the players scripts needed to properly connect
*/

DS_dataReceived = false;

private ["_handle","_playTime"];
//Black out screen while player is getting set up
0 cutText["Connecting to TheDarkside Database...","BLACK FADED"];
0 cutFadeOut 9999999;
//Hold the script until the players unit has spawned in
waitUntil {((!isNull player)&&(player == player))};
//Load player variables into players memory
[] call compile PreprocessFileLineNumbers "player\global\variables.sqf";
[] call DS_fnc_setupPlayerEventHandlers;
//Just in case server is not currently ready (Still loading at server start)
0 cutText ["Server is setting up, please wait...","BLACK FADED"];
0 cutFadeOut 99999999;
//Commented out if server for local testing

//Load default vars before DB loads
[] call DS_fnc_inventoryItems;
[] call DS_fnc_setupLicenses;
[] spawn DS_fnc_cheater;

switch (playerside)do
	{
	case west:
		{
		[] call compile PreprocessFileLineNumbers "player\police\compile.sqf";
		[] call compile PreprocessFileLineNumbers "player\police\variables.sqf";
		};
	case civilian:
		{
		[] call compile PreprocessFileLineNumbers "player\civilian\compile.sqf";
		};
	};



if(!isServer)then
	{
	waitUntil{!isNil "DS_server_setup"};
	DS_player_setup = false;
	[] call DS_fnc_playerLogin;
	waitUntil {DS_player_setup};
	};



0 cutText["Client setup complete","BLACK FADED"];
0 cutFadeOut 9999999;
/*
//TESTING
DS_testing = true;
if(DS_testing)then
	{
	onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
	};
*/
//This needs to be loaded before loading in
DS_useFuel = false;
	
_playTime = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
DS_perkLevel = 0;
switch(true)do
	{
	case (_playTime > 60000):{DS_perkLevel = 5};
	case (_playTime > 45000):{DS_perkLevel = 4};
	case (_playTime > 12000):{DS_perkLevel = 3};//200 hours
	case (_playTime > 6000):{DS_perkLevel = 2};//100 hours
	case (_playTime > 3000):{DS_perkLevel = 1};//50 hours
	};

switch (playerside)do
	{
	case west:
		{
		_handle = [] execVM "player\police\setup.sqf";
		};
	case civilian:
		{
		_handle = [] execVM "player\civilian\setup.sqf";
		};
	case independent:
		{
		[] call DS_fnc_menuSpawnScreen;
		};
	};
//Wait until player setup is completed
if(playerside != independent)then
	{
	waitUntil {scriptDone _handle};
	};

//Wait until the primary display exist
waitUntil {!(isNull (findDisplay 46))};
player addRating 99999999;
//0 cutText ["","BLACK IN"];
[] call DS_fnc_setupHud;
//[player] execVM "simpleEP.sqf";
player setVariable["name",profileName,true];
//[] call DS_fnc_setupSettings;
//TODO Player Tags
//TODO reveal objects
player setVariable ["player",true,true];
player setVariable ["UID",(getPlayerUID Player),true];
DS_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";
{ _x setFuelCargo 0; } forEach (nearestObjects [player, ["Land_FS_Feed_F"], 30000]); 

if(DS_adminLevel > 0)then
	{
	player setVariable ["DSAdmin",true,true];
	};
if((getPlayerUID player) in DS_adminList1)then
	{
	player setVariable ["DSAdmin",true,true];
	};
if((getPlayerUID player) in DS_adminList2)then
	{
	DS_adminLevel = 2;
	[] execVM "admintools\loop.sqf";
	};
if((getPlayerUID player) in DS_adminList3)then
	{
	DS_adminLevel = 3;
	[] execVM "admintools\loop.sqf";
	};
if((getPlayerUID player) in DS_adminList4)then
	{
	DS_adminLevel = 4;
	[] execVM "admintools\loop.sqf";
	};
[] spawn DS_fnc_payments;
[] spawn DS_fnc_motd;
[] spawn DS_fnc_health;
[] spawn DS_fnc_useFuel;
DS_playTime = time;
[] spawn DS_fnc_onEscape;
[] call DS_fnc_stamina;

if(playerside in [civilian,west])then
	{
	[] call DS_fnc_setupPlayerActions;
	};