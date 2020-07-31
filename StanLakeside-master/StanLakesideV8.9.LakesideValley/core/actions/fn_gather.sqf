/*
	File: fn_gather.sqf
	Author: Arma 3 Life [www.arma3-life.com/]
	
	Description:
	Main functionality for gathering.
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_cops"];
_resourceZones = ["coke_zone_1_1","coke_zone_1_2","coke_zone_1","meth_1","MDMA_zone_1","SHANK_1","HH_1"];
_zone = "";
_gather = "";
_val = 1;
_exit = false;
_toasters = false;
_cops = (west countSide playableUnits);
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;
if(_zone == "HH_1") exitWith {[] spawn life_fnc_hh};
if(life_spam_my_dick == 1) exitWith {};
if(vehicle player != player) exitWith {};
life_spam_my_dick = 1;
if(_cops < 2) exitWith { hint "Za malo policji aby zbierac (2+)"; }; 

//Get the resource that will be gathered from the zone name...
if(!isNil "_this" && {count _this != 0}) then {
	_curWep = currentWeapon player;
	if ( (_curWep) == "CG_SCYTHE" ) then {
		_gather = _this select 0;
		_val = _this select 1;

		player playactionnow "SledgeSwing";
		sleep 1;
		player playactionnow "SledgeSwing";
		sleep 1;
		player playactionnow "SledgeSwing";
		sleep 1;
		player playactionnow "SledgeSwing";
		sleep 1;
		player playactionnow "SledgeSwing";

		_toasters = true;
	} else {
		_exit = true;
		["Potrzebujesz sierpu aby to zrobic!", false] spawn domsg;
	};
} else {
	if(_zone == "") exitWith {_exit = true;};
	switch(true) do {
		case (_zone in ["coke_zone_1_1","coke_zone_1_2","coke_zone_1"]): {_gather = "cokeu"; _val = 1;};
		case (_zone in ["meth_1"]): {_gather = "methu"; _val = 1;};
		case (_zone in ["MDMA_zone_1"]): {_gather = "MDMAu"; _val = 1;};
		case (_zone in ["SHANK_1"]): {_gather = "shank"; _val = 1;};
		default {""};
	};
};
if(_exit) exitWith {life_spam_my_dick = 0;};
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {["Twoj ekwipunek jest pelen!", false] spawn domsg; life_action_gathering = false; life_spam_my_dick = 0;};
if(!_toasters) then {
	for "_i" from 0 to 2 do
	{
		if(speed player >= 1) exitWith {["Zbieranie zostalo anulowane przez poruszenie sie!", false] spawn domsg; _exit = true};
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		uiSleep 2.5;
	};
};
if(_exit) exitWith {life_spam_my_dick = 0};
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	[format[localize "STR_NOTF_Gather_Success",_itemName,_diff], false] spawn domsg;
};

life_spam_my_dick = 0;
