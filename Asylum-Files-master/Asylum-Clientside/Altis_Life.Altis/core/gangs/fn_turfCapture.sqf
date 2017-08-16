/*
	File: fn_turfCapture.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Begins turf capture process
*/
private ["_point","_row"];

if (life_active_turf < 0) exitWith {};
if (life_gang == "0") exitWith {};
_exit = false;
if ((currentWeapon player) in ["","Binocular"]) exitWith { hint "You can't take turf without a weapon!"};
if (count life_turf_captor > 0) then
{
	if (life_gang == (life_turf_captor select 2)) then { _exit = true; };
};
if (_exit) exitWith { hint "Your gang is already in line to control this turf!"; };
_count = 0;
{
	if (life_gang == (_x select 1) && life_active_turf != _forEachIndex) then { _count = _count + 1; };
} forEach life_turf_list;
if (_count > 1) exitWith { hint "A gang cannot control more than two pieces of turf at a time." };

_maxDistance = if (worldName == "Stratis") then { 1000 } else { 2000 };

_members = 0; { if (_x getVariable ["gang","0"] == life_gang && player distance _x < _maxDistance) then { _members = _members + 1; }} forEach allPlayers;
if (_members > 10) exitWith { hint "Territory cannot be captured by a gang with more than 5 players nearby." };

hint format["Capturing turf. No more than 5 gang members can be within %1 kilometers of this turf during the contested time.", _maxDistance / 1000];
life_action_in_use = true;
_upp = "Capturing...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
_pos = getPos player;
while{true} do
{
	sleep 2.4;
	_cP = _cP + 0.04;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	_members = 0; { if (_x getVariable ["gang","0"] == life_gang && player distance _x < 2000) then { _members = _members + 1; }} forEach allPlayers;
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _pos > 4 || life_isdowned || !alive player || speed player > 2) exitWith {};	
	if (_members > 5) exitWith { hint "Territory cannot be captured by a gang with more than 5 players nearby." };
	if (!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	life_turf_captor = [profileName, life_gang_name, life_gang];
	publicVariable "life_turf_captor";
	hint "You have claimed this turf for your gang! If you're the last to do this when the capture time expires, it's yours!";
};