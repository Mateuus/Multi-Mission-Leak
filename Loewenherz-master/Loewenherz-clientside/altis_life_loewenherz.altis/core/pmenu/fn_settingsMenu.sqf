/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", LHM_settings_viewDistanceFoot]];
ctrlSetText[2912, format["%1", LHM_settings_viewDistanceCar]];
ctrlSetText[2922, format["%1", LHM_settings_viewDistanceAir]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,LHM_settings_viewDistanceFoot],[2911,LHM_settings_viewDistanceCar],[2921,LHM_settings_viewDistanceAir]];

private ["_display","_side","_tags","_objs","_CFS","_CFM","_auto"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;
_auto = _display displayCtrl 2975;
_combo = _display displayCtrl 2100;
_comboBTN = _display displayCtrl 2400;
_own_tags = _display displayCtrl 3125;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

lbClear _combo;

{
	_combo lbadd _x;
	_combo lbsetValue[_foreachindex,_foreachindex];

} foreach ["Sommer","Mediteran","HCC","Schwarz/Weiß","Dark-CC","L-Dark-CC","Movie N-Style","Wasteland","High Contrast","LOL","Roehre","Blue","Grey","Green","Arma 2","Aus"];


_comboBTN buttonSetAction "_display1 = findDisplay 2900; _combo1 = _display1 displayCtrl 2100; _what = lbCurSel _combo1; if(_what == -1) exitWith {}; [_what] call lhm_fnc_colorFilter;";

/*
if(isNil "lhm_tagson") then {
	lhm_sidechat = true;
	lhm_tagson = true;
	lhm_revealObjects = true;
	LHM_colorC_sommer = true;
	LHM_colorC_mediteran = true;
};
*/
if(LHM_settings_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText localize"STR_SM_ON";
	_objs buttonSetAction "[lhm_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; LHM_settings_revealObjects = false; profileNamespace setVariable[""LHM_settings_revealObjects"",false]; [] call lhm_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText localize"STR_SM_OFF";
	_objs buttonSetAction "lhm_ID_RevealObjects = [""lhm_RevealObjects"",""onEachFrame"",""lhm_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; LHM_settings_revealObjects = true; profileNamespace setVariable[""LHM_settings_revealObjects"",true]; [] call lhm_fnc_settingsMenu;";
};

if(LHM_settings_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText localize"STR_SM_ON";
	_tags buttonSetAction "[lhm_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; LHM_settings_tagson = false; profileNamespace setVariable[""LHM_settings_tagson"",false]; [] call lhm_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText localize"STR_SM_OFF";
	_tags buttonSetAction "lhm_ID_PlayerTags = [""lhm_PlayerTags"",""onEachFrame"",""lhm_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; LHM_settings_tagson = true; profileNamespace setVariable[""LHM_settings_tagson"",true]; [] call lhm_fnc_settingsMenu;";
};

if(LHM_settings_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText localize"STR_SM_ON";
	_side buttonSetAction "LHM_settings_sidechat = false; profileNamespace setVariable[""LHM_settings_sidechat"",false]; [] call lhm_fnc_sidechat;"; // work in progress ???
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText localize"STR_SM_OFF";
	_side buttonSetAction "LHM_settings_sidechat = true; profileNamespace setVariable[""LHM_settings_sidechat"",true]; [] call lhm_fnc_sidechat;"; // work in progress ???
};


if(LHM_settings_AutoViewDistance) then {
	_auto ctrlSetTextColor [0,1,0,1];
	_auto ctrlSetText localize"STR_SM_ON";
	_auto buttonSetAction "LHM_settings_AutoViewDistance = false; profileNamespace setVariable[""LHM_settings_AutoViewDistance"",false]; [] call lhm_fnc_settingsMenu;";
} else {
	_auto ctrlSetTextColor [1,0,0,1];
	_auto ctrlSetText localize"STR_SM_OFF";
	_auto buttonSetAction "LHM_settings_AutoViewDistance = true; profileNamespace setVariable[""LHM_settings_AutoViewDistance"",true]; [] call lhm_fnc_settingsMenu;";
};

