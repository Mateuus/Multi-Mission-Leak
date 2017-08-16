/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Irgendwas ging falsch, das menü will nicht öffnen?"};
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

private["_display","_side","_tags","_objs"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;
_intro = _display displayCtrl 2973;
_showLogo = _display displayCtrl 2974;
_hideHud = _display displayCtrl 2975;
_extendedHud = _display displayCtrl 2976;

 
if(isNil "DWEV_tagson") then {
	DWEV_sidechat = true;
	DWEV_tagson = true;
	DWEV_revealObjects = false;
};

if(DWEV_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "AN";
	_objs buttonSetAction "[DWEV_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; DWEV_revealObjects = false; [] call DWEV_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "AUS";
	_objs buttonSetAction "DWEV_ID_RevealObjects = [""DWEV_RevealObjects"",""onEachFrame"",""DWEV_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; DWEV_revealObjects = true; [] call DWEV_fnc_settingsMenu;";
};

if(DWEV_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "AN";
	_tags buttonSetAction "[DWEV_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; DWEV_tagson = false; [] call DWEV_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "AUS";
	_tags buttonSetAction "DWEV_ID_PlayerTags = [""DWEV_PlayerTags"",""onEachFrame"",""DWEV_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; DWEV_tagson = true; [] call DWEV_fnc_settingsMenu;";
};

if(DWEV_sidechat) then 
{
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "AN";
	
} 
else 
{
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "AUS";
};

if(profileNamespace getVariable["skipIntro_new",false]) then {
	_intro ctrlSetTextColor [1,0,0,1];
	_intro ctrlSetText "SKIP";
	_intro buttonSetAction "profileNamespace setVariable[""skipIntro_new"",false]; [] call DWEV_fnc_settingsMenu;";
} else {
	_intro ctrlSetTextColor [0,1,0,1];
	_intro ctrlSetText "PLAY";
	_intro buttonSetAction "profileNamespace setVariable[""skipIntro_new"",true]; [] call DWEV_fnc_settingsMenu;";
};

if(profileNamespace getVariable["dw_show_logo",false]) then {
	_showLogo ctrlSetTextColor [0,1,0,1];
	_showLogo ctrlSetText "AN";
	_showLogo buttonSetAction "profileNamespace setVariable[""dw_show_logo"",false]; [] call DWEV_fnc_settingsMenu;";
} else {
	_showLogo ctrlSetTextColor [1,0,0,1];
	_showLogo ctrlSetText "AUS";
	_showLogo buttonSetAction "profileNamespace setVariable[""dw_show_logo"",true]; [] call DWEV_fnc_settingsMenu;";
};

if(profileNamespace getVariable["dw_hide_hud",false]) then {
	_hideHud ctrlSetTextColor [0,1,0,1];
	_hideHud ctrlSetText "AN";
	_hideHud buttonSetAction "profileNamespace setVariable[""dw_hide_hud"",false]; [] call DWEV_fnc_settingsMenu;";
} else {
	_hideHud ctrlSetTextColor [1,0,0,1];
	_hideHud ctrlSetText "AUS";
	_hideHud buttonSetAction "profileNamespace setVariable[""dw_hide_hud"",true]; [] call DWEV_fnc_settingsMenu;";
};

if(profileNamespace getVariable["dw_extended_hud",false]) then {
	_extendedHud ctrlSetTextColor [0,1,0,1];
	_extendedHud ctrlSetText "AN";
	_extendedHud buttonSetAction "profileNamespace setVariable[""dw_extended_hud"",false]; [] call DWEV_fnc_settingsMenu;";
} else {
	_extendedHud ctrlSetTextColor [1,0,0,1];
	_extendedHud ctrlSetText "AUS";
	_extendedHud buttonSetAction "profileNamespace setVariable[""dw_extended_hud"",true]; [] call DWEV_fnc_settingsMenu;";
};
