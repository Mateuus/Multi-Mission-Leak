/*
	File: fn_pickaxeUse.sqf
	
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
if(harvesting) exitwith {};
harvesting = true;


switch (true) do
{
	case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 4;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 2;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 1;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 2;};
	default {_mine = "";};
};

_curWep = currentWeapon player;


//Mine check
if(_mine == "") exitWith {harvesting = false;};

if ( (_curWep) != "CG_PICKAXE" ) exitwith { ["Potrzebujesz kilofa w reku aby tutaj kopac!", false] spawn domsg; harvesting = false; };

player playactionnow "SledgeSwing";
sleep 1;
player playactionnow "SledgeSwing";
sleep 1;
player playactionnow "SledgeSwing";
sleep 1;
player playactionnow "SledgeSwing";

_chance = (floor random 4);
if(_chance > 1) exitwith { ["Nie udalo Ci sie czegos wykopac!", false] spawn doquickmsg; harvesting = false;harvesting = false; };


if(vehicle player != player) exitWith {[localize "STR_ISTR_Pick_MineVeh", false] spawn doquickmsg; harvesting = false;};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {[localize "STR_NOTF_InvFull", false] spawn doquickmsg; harvesting = false;};


if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	[format[localize "STR_ISTR_Pick_Success",_itemName,_diff], false] spawn doquickmsg;
};

harvesting = false;