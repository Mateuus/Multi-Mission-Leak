/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	Edit:Avanix Gaming Community
	
	Description:
	Main functionality for gathering.
*/
if(isNil "eM_action_gather") then {eM_action_gather = false;};
private["_ok","_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = [["holz_1",30],["lead_1",30],["iron_1",30],["salt_1",30],["sand_1",30],["diamond_1",30],["oil_1",70],["rock_1",30],["silver_1",30],["hops_1",30],["fruit_1",30],["fruit_2",30],["fruit_3",30],["fruit_4",30],["fruit_5",30],["fruit_ff",30],["bananas_1",30],["bananas_2",30],["bananas_3",30],["bananas_4",30],["heroin_1",30],["cocaine_1",30],["weed_1",30],["rye_1",30],["yeast_1",30],["holz_1",30],["mine_1",30],["trash_1",5],["trash_2",5],["cotton_1",30],["cotton_2",30],["tobacco_1",9],["tobacco_2",9],["rape_1",30],["waterplace_1",30]];
_zone = "";
_ok = true;
if(eM_action_gather) exitWith {};
eM_action_gather = true;

{
	if(player distance (getMarkerPos (_x select 0)) < (_x select 1)) exitWith {_zone = _x select 0;};
} foreach _resourceZones;


if(vehicle player != player) exitWith {["Information",["Du kannst nicht in deinem","Fahrzeug abbauen"],"#0090ff"] call EMonkeys_fnc_specialText; eM_action_gather = false;};


switch(true) do {
	case (_zone in ["fruit_1","fruit_2","fruit_3","fruit_4","fruit_5"]): {["fruit"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["fruit_ff"]): {["fruitSpecial"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["bananas_1","bananas_2","bananas_3","bananas_4"]): {["banana"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["trash_1","trash_2"]): {[] call EMonkeys_fnc_gathertrash; _ok = false;};
	case (_zone in ["cotton_1","cotton_2"]): {["cotton"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["hops_1"]): {["hops"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["heroin_1"]): {["heroin"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["cocaine_1"]): {["cocaine"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["weed_1"]): {["cannabis"] call EMonkeys_fnc_gatherSystem;  _ok = false;};
	case (_zone in ["rye_1"]): {["rye"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["yeast_1"]): {["yeast"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["mine_1"]): {[] call EMonkeys_fnc_gathermine; _ok = false;};
	case (_zone in ["holz_1"]): {["wood"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["tobacco_1","tobacco_2"]): {["tobacco"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["rape_1"]): {["rape"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["lead_1"]): {["copper"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["iron_1"]): {["iron"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["salt_1"]): {["salt"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["sand_1"]): {["sand"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["diamond_1"]): {["diamond"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["rock_1"]): {["rock"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["silver_1"]): {["silver"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["oil_1"]): {["oil"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	case (_zone in ["waterplace_1"]): {["water"] call EMonkeys_fnc_gatherSystem; _ok = false;};
	default {""};
};
if(_ok) exitWith {eM_action_gather = false; eM_action_inUse = false;};
