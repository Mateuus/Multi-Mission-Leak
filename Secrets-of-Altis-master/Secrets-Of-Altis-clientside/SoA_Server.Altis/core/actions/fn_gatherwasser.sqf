/*
	File: fn_gatherwasser.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_zone","_level","_exp","_klarname","_unterwasserZonen"];
_unterwasserZonen = ["schatz_1","schatz_2","schatz_3","schatz_4","schatz_5"];
_zone = "";

if(life_action_gathering) exitWith {};

{
	if(player distance (getMarkerPos _x) < 200) exitWith {_zone = _x;};
} foreach _unterwasserZonen;

if(_zone == "" OR (getposATL player select 2 > 2)) exitWith {
	life_action_inUse = false;
	life_action_gathering = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["schatz_1","schatz_2","schatz_3","schatz_4","schatz_5"] && (getposATL player select 2 < 2)): {_gather = "perlen"; _val = 3; _level = 4; _exp = 150; _klarname = "Perlen"};
	default {""};
};

//gather check??
if!(isNull objectParent player) exitWith {};

//Level Checking
if(life_level < _level) then {_exp = (_exp/2)};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {
hint localize "STR_NOTF_InvFull";
life_action_inUse = false;
life_action_gathering = false;
};

life_action_inUse = true;
life_action_gathering = true;

for "_i" from 0 to 2 do
{
	player playMove "AbdvPercMstpSnonWnonDnon_putDown_AbdvPercMstpSnonWnonDnon";
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
life_action_gathering = false;
life_exp = life_exp + round(random(_exp));
[] spawn life_fnc_exptolevel;