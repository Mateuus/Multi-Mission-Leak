/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_mine","_itemWeight","_diff","_itemName","_val","_exp","_level","_klarname","_mode"];

_mode = _this select 0;

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

switch (true) do
{
	case (player distance (getMarkerPos "copper_1") < 30): {_mine = "copperore"; _val = 2; _level = 2; _exp = 50; _klarname = "Kupfererz"};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2; _level = 2; _exp = 50; _klarname = "Eisenerz"};
	//case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4; _level = 4; _exp = 100; _klarname = "Salz"};
	//case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1; _level = 6; _exp = 150; _klarname = "Diamanten"};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2; _level = 3; _exp = 75; _klarname = "Gestein"};
	//case (player distance (getMarkerPos "plutonium") < 490): {_mine = "plutoniumu"; _val = 1; _level = 8; _exp = 200; _klarname = "Plutonium"};
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

for "_i" from _mode to 2 do
{
	player playMove "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";
	sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
life_action_gathering = false;
if(_mode == 1) then {life_exp = life_exp + (round(random(_exp)) + 300)} else {life_exp = life_exp + round(random(_exp))};
[] spawn life_fnc_exptolevel;