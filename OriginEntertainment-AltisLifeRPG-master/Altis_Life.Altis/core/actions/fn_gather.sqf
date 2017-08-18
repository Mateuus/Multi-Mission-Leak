/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1",
				"lead_1","iron_1","salt_1","diamond_1","oil_1","oil_2"	
				];
_zone = "";
_tool = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};
	
//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;_tool = "";};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;_tool = "";};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;_tool = "";};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;_tool = "";};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;_tool = "";};
	
	case (_zone in ["lead_1"]): {_gather = "copperore"; _val = 2;_tool = "pickaxe";};
	case (_zone in ["iron_1"]): {_gather = "ironore"; _val = 2;_tool = "pickaxe";};
	case (_zone in ["salt_1"]): {_gather = "salt"; _val = 4;_tool = "pickaxe";};
	case (_zone in ["diamond_1"]): {_gather = "diamond"; _val = 1;_tool = "pickaxe";};
	case (_zone in ["oil_1"]): {_gather = "oilu"; _val = 1;_tool = "pickaxe";};
	case (_zone in ["oil_2"]): {_gather = "oilu"; _val = 1;_tool = "pickaxe";};
	default {""};
};

//gather check??
if(vehicle player != player) exitWith {};

if (_tool != "" && {_item = [_tool, 0] call life_fnc_varHandle;
if (missionNamespace getVariable [_item, 0] <= 0) exitWith { true };
false
}
) exitWith {titleText[format["You need a %1",[([_tool, 0] call life_fnc_varHandle)] call life_fnc_varToStr],"PLAIN"];life_action_gathering = false;};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
