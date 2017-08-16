/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copper_u"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "iron_u"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt_u"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond_u"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	case (player distance (getMarkerPos "silver_1") < 50): {_mine = "silver_u"; _val = 1;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};

if((life_action_gather)) exitWith { };
life_action_gather = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	
	switch ( "farmer" call GTA_fnc_perkRank ) do {

		case 1: { sleep 2.25 };
		case 2: { sleep 2 };
		case 3: { sleep 1.75 };
		default { sleep 2.5 };

	};

};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];

	//--- Add experience
	[ "gather", "Mining" ] call GTA_fnc_addExp;
	
};

life_action_gather = false;