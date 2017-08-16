/*
	File: fn_axeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for axe in lumberjacking.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_mine","_diff","_itemName","_val","_exp","_level","_klarname","_axt","_resourceZones","_zone"];
_resourceZones = ["holz_1","holz_2","holz_3","holz_4","holz_5","holz_6","holz_7"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {

	life_action_inUse = false;
	life_action_gathering = false;
};

switch (true) do
{
	case (_zone in _resourceZones): {_mine = "holz"; _val = [1,4] call life_fnc_randomRound; _level = 3; _exp = 80; _klarname = "Holz"};
	default {_mine = "";};
};

//Mine check
if(_mine == "") exitWith {};
if!(isNull objectParent player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

//level checking
if(life_level < _level) then {_exp = (_exp/2)};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {
hint localize "STR_NOTF_InvFull";
life_action_inUse = false;
life_action_gathering = false;
};

life_action_inUse = true;
life_action_gathering = true;

_axt = "Land_Axe_F" createvehiclelocal [0,0,0]; 
_axt attachTo [player, [0,0,0.1], "RightHand"]; 
_axt setVectorDirAndUp [[0,-0.2,0.5],[-1,0,0]];

for "_i" from 0 to 2 do
{
	player playMove "AwopPercMstpSgthWnonDnon_throw";
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
	detach _axt;
	deletevehicle _axt;
};

life_action_inUse = false;
life_action_gathering = false;
life_exp = life_exp + round(random(_exp));
[] spawn life_fnc_exptolevel;