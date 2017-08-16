/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;

private ["_mine","_val","_addExpAmount","_time","_profName","_data","_diff","_pos","_distance","_itemName"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	default {_mine = "";};
};
//Mine check

if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

//SkillSystem
_addExpAmount = 5;
_time = 3;
_profName = [_mine] call lhm_fnc_profType;
if( _profName != "" ) then {
        _data = missionNamespace getVariable (_profName);
        _time = ( 3 - (0.25 * (_data select 0)));
        if((_data select 0) > 0) then {
                _val = _val * (_data select 0);
                _addExpAmount = _addExpAmount + round(2.5 * (_data select 0));
        };
        diag_log format["Amount to add to mine experience %1",_addExpAmount];
};
//SkillSystem

_diff = [_mine,_val,lhm_carryWeight,lhm_maxWeight] call lhm_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
lhm_action_inUse = true;
playSound "mining"; // LHM
_pos = getposatl player;
while{true} do {
	_distance = player distance _pos;
	if(_distance > 1) exitWith {hint "Mining abgebrochen, du hast dich bewegt!"};
	for "_i" from 0 to 2 do
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep _time;
		_distance = player distance _pos;
		if(_distance > 1) exitWith {hint "Mining abgebrochen, du hast dich bewegt!"};
	};
	if(!alive player) exitWith {};

	if(_distance > 1) exitWith {hint "Mining abgebrochen, du hast dich bewegt!"};

	if(([true,_mine,_diff] call lhm_fnc_handleInv)) then
	{
		_itemName = [([_mine,0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr;
		titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
	// papabears-persistent-proficiency-system //
		if( _profName != "" ) then
		{
			[_profName,_addExpAmount] call lhm_fnc_addExp;
		};
	// papabears-persistent-proficiency-system //
	};
	_diff = [_mine,_val,lhm_carryWeight,lhm_maxWeight] call lhm_fnc_calWeightDiff;
	if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
	sleep 2;
	if(!alive player) exitWith {};
};

lhm_action_inUse = false;