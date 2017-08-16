/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Irgendwas ist hier schief gelaufen, denn das Menü öffnet sich nicht."};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags","_objs","_gras"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;
_gras  = _display displayCtrl 2973;

if(isNil "eM_tagson") then {
	EMonkeys_sidechat = true;
	eM_tagson = true;
	eM_revealObjects = false;
	
};

if(eM_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "ON";
	_objs buttonSetAction "[EMonkeys_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; eM_revealObjects = false; [] call EMonkeys_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "OFF";
	_objs buttonSetAction "EMonkeys_ID_RevealObjects = [""eM_revealObjects"",""onEachFrame"",""EMonkeys_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; eM_revealObjects = true; [] call EMonkeys_fnc_settingsMenu;";
};
if(eM_grasonof) then {
	_gras ctrlSetTextColor [0,1,0,1];
	_gras ctrlSetText "ON";
	_gras buttonSetAction "eM_grasonof = false; setterrainGrid 50;  [] call EMonkeys_fnc_settingsMenu";
} else {
	_gras ctrlSetTextColor [1,0,0,1];
	_gras ctrlSetText "OFF";
	_gras buttonSetAction "eM_grasonof = true; setterrainGrid 0; [] call EMonkeys_fnc_settingsMenu";
};

if(eM_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "eM_tagson = false;[] call EMonkeys_fnc_invisible;  [] call EMonkeys_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "eM_tagson = true; [] call EMonkeys_fnc_invisible; [] call EMonkeys_fnc_settingsMenu;";
};

if(EMonkeys_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
};


switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2054,false]; //Craft Icon
		ctrlShow[2055,false]; //Craft Button
	};
	case independent:
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case civilian:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case east:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
};

if((call EMonkeys_coplevel) < 3) then
{
	ctrlShow[2406,false]; //Wanted + Button
	ctrlShow[2407,false];//Wanted + Icon
};

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};



if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};