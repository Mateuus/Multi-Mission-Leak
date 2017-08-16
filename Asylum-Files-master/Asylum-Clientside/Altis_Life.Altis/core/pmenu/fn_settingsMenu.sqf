/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "ClientSettings") exitWith {hint "Something went wrong, the menu won't open?"};
};
[] spawn {
	waitUntil {isNull (findDisplay 2900)};
	profileNamespace setVariable["AsylumSettings",[tawvd_foot,tawvd_car,tawvd_air,life_ringer,life_adminReq]];
};
disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];
if(life_adminlevel == 0) then {ctrlShow[1337,false]};
//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags"];
_display = findDisplay 2900;
_side = _display displayCtrl 2926;
_admin = _display displayCtrl 1337;
_vehicle = _display displayCtrl 1338;
_tags = _display displayCtrl 2925;

if(isNil "life_ringer") then 
{
	(profileNamespace getVariable["AsylumSettings",[1200,1200,1600,true,false]]) select 3;
};

if(life_ringer) then
{
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "Ringer ON";
}
	else
{
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "Ringer OFF";
};

if(life_adminReq) then {_admin ctrlSetTextColor [1,0,0,1]; _admin ctrlSetText "Admin Requests OFF"} else {_admin ctrlSetTextColor [0,1,0,1]; _admin ctrlSetText "Admin Requests ON"};
//if(life_createVehicle) then {_vehicle ctrlSetTextColor [0,1,0,1]; _vehicle ctrlSetText "Drop Items ON"} else {_vehicle ctrlSetTextColor [1,0,0,1]; _vehicle ctrlSetText "Drop Items OFF"};