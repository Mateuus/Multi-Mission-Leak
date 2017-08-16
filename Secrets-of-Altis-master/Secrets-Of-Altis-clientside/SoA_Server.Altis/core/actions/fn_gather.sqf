/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_level","_exp","_klarname"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","eis_1","eis_2","rye_1","hops_1","yeast_1","sand_1","indigo_1","indigo_2","wolle_1","wolle_2","kakao_1","salat_1","tomate_1"];
_zone = "";

if(life_action_gathering) exitWith {};

{
	if(player distance (getMarkerPos _x) < 45) exitWith {_zone = _x;};
} foreach _resourceZones;


if(_zone == "") exitWith {
	life_action_inUse = false;
	life_action_gathering = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3; _level = 1; _exp = 25; _klarname = "Orangen"};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3; _level = 1; _exp = 25; _klarname = "Oliven"};
	//case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1; _level = 5; _exp = 150; _klarname = "Heroin"};
	//case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1; _level = 7; _exp = 200; _klarname = "Kokain"};
	//case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1; _level = 6; _exp = 100; _klarname = "Marihuana"};
	case (_zone in ["eis_1","eis_2"]): {_gather = "eis"; _val = 2; _level = 2; _exp = 50; _klarname = "Eis"};
	case (_zone in ["rye_1"]): {_gather = "rye"; _val = 2; _level = 10; _exp = 150; _klarname = "Roggen"};
	case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 2; _level = 9; _exp = 150; _klarname = "Hefe"};
	case (_zone in ["hops_1"]): {_gather = "hops"; _val = 2; _level = 9; _exp = 150; _klarname = "Hopfen";};
	case (_zone in ["sand_1"]): {_gather = "sand"; _val = 2; _level = 3; _exp = 70; _klarname = "Quarzsand"};
	case (_zone in ["indigo_1","indigo_2"]): {_gather = "indigo"; _val = 2; _level = 2; _exp = 15; _klarname = "Indigo"};
	case (_zone in ["wolle_1","wolle_2"]): {_gather = "baumwolle"; _val = [1,10] call life_fnc_randomRound; _level = 1; _exp = 10; _klarname = "Baumwolle"};
	case (_zone in ["kakao_1"]): {_gather = "kakaobohne"; _val = 2; _level = 3; _exp = 100; _klarname = "Kakaobohne"};
	//case (_zone in ["salat_1"]): {_gather = "salat"; _val = [1,3] call life_fnc_randomRound; _level = 1; _exp = 30; _klarname = "Salat"};	
	//case (_zone in ["tomate_1"]): {_gather = "tomate"; _val = [1,3] call life_fnc_randomRound; _level = 1; _exp = 30; _klarname = "Tomate"};
	default {""};
};

//gather check??
if(!isNull objectParent player) exitWith {};

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
	player playMove "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown";
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_exp = life_exp + round(random(_exp));
[] spawn life_fnc_exptolevel;

life_action_inUse = false;
life_action_gathering = false;