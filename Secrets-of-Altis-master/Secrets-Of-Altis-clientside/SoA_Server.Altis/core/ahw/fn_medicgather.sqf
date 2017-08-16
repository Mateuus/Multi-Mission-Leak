/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_level","_exp","_klarname"];
_resourceZones = ["medic_farm1","adac_farm1"];
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
	case (_zone == "medic_farm1"): {_gather = "medizin"; _val = 1; _klarname = "Inhaltsstoffe"};
	case (_zone == "adac_farm1"): {_gather = "schrott"; _val = 1; _klarname = "Schrottteile"};
	default {""};
};

//gather check??
if!(isNull objectParent player) exitWith {};

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

life_action_inUse = false;
life_action_gathering = false;