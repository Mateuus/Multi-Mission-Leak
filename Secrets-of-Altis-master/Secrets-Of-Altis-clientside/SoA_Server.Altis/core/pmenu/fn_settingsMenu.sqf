/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
private["_display","_detail","_chat","_name","_hud","_mode"];
if(isNull (findDisplay 2900)) then {if(!createDialog "SettingsMenu") exitWith {hint "Irgendwas funktioniert hier nicht!?"}};
_mode = _this select 0;
_display = findDisplay 2900;
_detail = _display displayCtrl 2971;
_chat = _display displayCtrl 2970;
_name = _display displayCtrl 2972;
_hud = _display displayCtrl 2973;


disableSerialization;
ctrlSetText[2902,format["%1", tawvd_foot]];
ctrlSetText[2912,format["%1", tawvd_car]];
ctrlSetText[2922,format["%1", tawvd_air]];

{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
{sliderSetPosition[_x select 0, _x select 1];} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

_ringtones = _display displayCtrl 2974;
_hudselection = [] call life_fnc_hudcfg;

lbClear _hud;
lbClear _ringtones;
{
	_hud lbAdd format["%1",_x select 2];
	_hud lbSetData [(lbSize _hud)-1,format["%1",[_x select 0,_x select 1,_x select 3]]];
} foreach _hudselection;

{
	_ringtones lbAdd format["%1",_x select 1];
	_ringtones lbSetData [(lbSize _ringtones)-1,_x select 0];
} foreach [["phoneABBA","The winner takes it all"],["phoneDEhymne","DE-Hymne"],["phoneImpossible","Mission Impossible"],["phoneIndiana","Indiana Jones"],["phonePirates","He's a Pirate"],["phonePotter","Harry Potter"],["phoneStarWars","Star Wars"],["phoneUSAhymne","USA-Hymne"]];


if(life_name) then {
	_name cbSetChecked true;
	player setVariable ['nameanzeigen',true,true];
} else {
	_name cbSetChecked false;
	player setVariable ['nameanzeigen',false,true];
};

if(life_chat) then {
	_chat cbSetChecked true;
	showChat false;
} else {
	_chat cbSetChecked false;
	showChat true;
};

if(life_detail) then {
	_detail cbSetChecked true;

	_tmp = [];
	{if(_x isKindOf "House_F") then {_tmp pushback format["house_%1",_x getVariable "uid"]};} foreach life_vehicles;
	{_x setMarkerAlphaLocal 0} foreach _tmp;

} else {
	_detail cbSetChecked false;

	_tmp = [];
	{if(_x isKindOf "House_F") then {_tmp pushback format["house_%1",_x getVariable "uid"]};} foreach life_vehicles;
	{_x setMarkerAlphaLocal 1} foreach _tmp;
};
