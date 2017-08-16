/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_mine","_itemWeight","_diff","_itemName","_val","_level","_exp","_klarname"];


if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

switch (true) do
{
	case (player distance (getMarkerPos "oil_1") < 120) : {_mine = "oilu"; _val = 1; _level = 4; _exp = 150; _klarname = "Öl"};
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

for "_i" from 0 to 2 do
{
	player playMove "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";
	waitUntil{animationState player != "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";};
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pump_Success",_itemName,_diff],"PLAIN"];
};
life_action_inUse = false;
life_action_gathering = false;
life_exp = life_exp + round(random(_exp));
[] spawn life_fnc_exptolevel;