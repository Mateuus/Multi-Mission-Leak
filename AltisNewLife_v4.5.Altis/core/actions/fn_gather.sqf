#include <macro.h>
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_subZones"];
_resourceZones = ["apple_1","apple_2","peaches_1","peaches_2","heroin_1","cocaine_1","weed_1","iode_1","grape_1","rye_1","yeast_1","hops_1","tabac_1","nuclear_1","phos_1","opium_1","tabac_2"];
_subZones = ["archeo_1","archeo_2","archeo_3"];
_zone = "";
if(life_action_gathering) exitWith {};
life_action_gathering = true;
{
	if(player distance (getMarkerPos _x) < 25) exitWith {_zone = _x;};
} foreach _resourceZones;
{
	if(player distance (getMarkerPos _x) < 145) exitWith {_zone = _x;};
} foreach _subZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};
switch(true) do {
	case (_zone in ["apple_1","apple_2"]): {_gather = "apple"; _val = ceil(random 4);};
	case (_zone in ["peaches_1","peaches_2"]): {_gather = "peach"; _val = ceil(random 4);};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = ceil(random 3);};
	case (_zone in ["cocaine_1"]): {_gather = "coke"; _val = ceil(random 3);};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = ceil(random 3);};
	case (_zone in ["iode_1"]): {_gather = "iode"; _val = ceil(random 6);};
	case (_zone in ["grape_1"]): {_gather = "grapes"; _val = ceil(random 4);};
	case (_zone in ["rye_1"]): {_gather = "rye"; _val = ceil(random 5);};
	case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = ceil(random 5);};
	case (_zone in ["hops_1"]): {_gather = "hops"; _val = ceil(random 5);};
	case (_zone in ["tabac_1","tabac_2"]): {_gather = "tobacco"; _val = ceil(random 4);};
	case (_zone in ["nuclear_1"]): {_gather = "uranium1"; _val = ceil(random 3);};
	case (_zone in ["phos_1"]): {_gather = "phosphore"; _val = ceil(random 5);};
	case (_zone in ["opium_1"]): {_gather = "fleur_opium"; _val = ceil(random 3);};	
	case (_zone in ["archeo_1","archeo_2","archeo_3"]): {_gather = "skull"; _val = ceil(random 3);};
	default {""};
};
if(vehicle player != player) exitWith {};
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 2.5;
};
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = ITEM_NAME(_gather);
	playSound "bag";
	titleText[format[localize "STR_NOTF_Gather_Success",localize _itemName,_diff],"PLAIN"];
};
life_action_inUse = false;