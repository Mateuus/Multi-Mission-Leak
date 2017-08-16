/*
Filename: fn_copVehRadio.sqf

Author: Blackd0g

Description: creates a menu that plays sample files if player is in a vehicle.
*/
disableSerialization;

private ["_soundFile","_display","_listbox","_abspielen_BTN","_foreachindex","_conf","_what","_temp","_code"];
playPoliceSound =
{
	private ["_soundFile"];
	_soundFile = _this select 0;
	[[vehicle player,_soundFile],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
};



LHM_Police_sounds =
[
	["1 MSG: Stop Police"," ['police_speech1'] call playPoliceSound;"],
	["2 MSG: Anti Car","['police_speech2'] call playPoliceSound;"],
	["3 MSG: YELP","['police_speech3'] call playPoliceSound;"],
	["5 Police Horn ON","[] spawn lhm_fnc_poliHorn;"],
	["6 Radio/Police Horn OFF","antispamhorn = false;"]
];


if(dialog) then {
	closeDialog 0;
};

createDialog "cop_sound_menu";
waitUntil {!isnull(findDisplay 8735)};

/*Bloodwyn *work in progress*?
[]spawn{
	waituntil{(isnull (findDisplay 8735)) || (copspeechnumber != -1)};
	if(isnull (findDisplay 8735)) exitWith{};
	disableSerialization;
	if(isnull (findDisplay 8735)) exitWith {hint "Fehler: Falsches Display"};
	_display = findDisplay 8735;
	_temp = LHM_Police_sounds select (copspeechnumber - 1));
	_code = compile (_temp select 1);
	[] call _code;
};
*/

_display = findDisplay 8735;
_listbox = _display displayCtrl 1500;
_abspielen_BTN = _display displayCtrl 2400;

{
	_listbox lbadd format["%1",(_x select 0)];
	_listbox lbSetValue[_foreachindex,_foreachindex];

} foreach LHM_Police_sounds;

_abspielen_BTN buttonSetAction "
	disableSerialization;
	if(isnull (findDisplay 8735)) exitWith {hint ""Fehler: Falsches Display""};
	_display = findDisplay 8735;
	_listbox = _display displayCtrl 1500;
	if(lbCurSel _listbox == -1) exitWith {hint ""Du hast Nichts ausgewählt!""};
	_what = _listbox lbvalue (lbCurSel _listbox);
	_temp = LHM_Police_sounds select _what;
	_code = compile (_temp select 1);
	[] call _code;


";

