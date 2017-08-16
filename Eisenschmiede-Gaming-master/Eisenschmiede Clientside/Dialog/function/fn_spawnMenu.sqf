/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(ES_is_arrested) exitWith {
	[] call ES_fnc_respawned;
};

if(ES_respawned) then {
	[] call ES_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "ES_spawn_selection")) exitWith {[] call ES_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call ES_fnc_displayHandler"];

_list = ((findDisplay 38500) displayCtrl 38510);

if (CurrentMode == "Altis") then {
	{
	    private ["_lizenz"];

	    if(getText (_x >> "lizenz") == "") then { _lizenz = true; }
	    else
	    {  _lizenz = call compile getText(_x >> "lizenz"); };

	    if(_lizenz) then
	    {
	    	_list lbAdd getText(_x >> "displayName");
	    	_list lbSetData [(lbSize _list - 1),configName(_x)];
	    	_list lbSetPicture [(lbSize _list - 1),getText(_x >> "icon")];
	    };
	} 
	forEach ("true" configClasses (missionConfigFile >> "CfgSpawnsAltis" >> str(playerSide)));
} else {
	{
	    private ["_lizenz"];

	    if(getText (_x >> "lizenz") == "") then { _lizenz = true; }
	    else
	    {  _lizenz = call compile getText(_x >> "lizenz"); };

	    if(_lizenz) then
	    {
	    	_list lbAdd getText(_x >> "displayName");
	    	_list lbSetData [(lbSize _list - 1),configName(_x)];
	    	_list lbSetPicture [(lbSize _list - 1),getText(_x >> "icon")];
	    };
	} 
	forEach ("true" configClasses (missionConfigFile >> "CfgSpawnsTanoa" >> str(playerSide)));
};

if(playerSide == civilian) then
{
	if(count ES_houses > 0) then 
	{
	    {
	        _pos = call compile format["%1",_x select 0];
			_house = nearestBuilding _pos;
			
			_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
			_marker = createMarkerLocal[format["house_spawn_%1",_forEachIndex],position _house];

			_list lbAdd _houseName;
			_list lbSetData [(lbSize _list - 1),_marker];
			_list lbSetPicture [(lbSize _list - 1),"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
	    }
		foreach ES_houses;
	};
};

_list lbSetCurSel 0;

if (CurrentMode == "Altis") then {
	ES_spawn_point = configName((missionConfigFile >> "CfgSpawnsAltis" >> str(playerSide)) select 0);
} else {
	ES_spawn_point = configName((missionConfigFile >> "CfgSpawnsTanoa" >> str(playerSide)) select 0);
};

[getMarkerPos ES_spawn_point] spawn ES_fnc_CamDiaLog;