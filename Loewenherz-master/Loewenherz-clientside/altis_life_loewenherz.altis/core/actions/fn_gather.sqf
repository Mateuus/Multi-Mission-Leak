/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_addExpAmount","_time","_profName","_data"];
if (lhm_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};

_resourceZones = ["rye_1","hops_1","yeast_1","apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","tabak_1"];
_zone = "";

if(lhm_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
lhm_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	lhm_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	// LHM Alcohol Start
	case (_zone in ["rye_1"]): {_gather = "rye"; _val = 2;};
	case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 2;};
	case (_zone in ["hops_1"]): {_gather = "hops"; _val = 2;};
	// LHM Alcohol End
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["tabak_1"]): {_gather = "tabak"; _val = 3;}; // neu
	default {""};
};
//gather check??

if(vehicle player != player) exitWith {};

//SkillSystem
_addExpAmount = 5;
_time = 3;
_profName = [_gather] call lhm_fnc_profType;
if( _profName != "" ) then {
        _data = missionNamespace getVariable (_profName);
        _time = ( 3 - (0.25 * (_data select 0)));
        if((_data select 0) > 0) then {
                _val = _val * (_data select 0);
                _addExpAmount = _addExpAmount + round(2.5 * (_data select 0));
        };
        diag_log format["Amount to add to gather experience %1",_addExpAmount];
};
//SkillSystem

_diff = [_gather,_val,lhm_carryWeight,lhm_maxWeight] call lhm_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
lhm_action_inUse = true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep _time;
};

if(([true,_gather,_diff] call lhm_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
//SkillSystem
	if( _profName != "" ) then {
		[_profName,_addExpAmount] call lhm_fnc_addExp;
	};
//SkillSystem
};

sleep 1;
lhm_action_inUse = false;
