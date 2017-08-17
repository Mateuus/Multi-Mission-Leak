/*
	File: fn_axeUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for axe in lumberjacking.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_mine","_diff","_itemName","_val","_klarname","_axe","_resourceZones","_zone","_chopReward","_ressource"];
_resourceZones = ["logging_1","logging_2","logging_3"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {

	life_action_inUse = false;
	life_action_gathering = false;
};

switch (true) do
{
	case (_zone in _resourceZones): {_mine = "logging"; _val = [1,2] call life_fnc_randomRound; _klarname = "logging"};
	default {_mine = "";};
};

//Mine check
if(_mine == "") exitWith {};
if!(isNull objectParent player) exitWith {hint localize "STR_ISTR_Axe_MineVeh";};


_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {
hint localize "STR_NOTF_InvFull";
life_action_inUse = false;
life_action_gathering = false;
};

life_action_inUse = true;
life_action_gathering = true;

_axe = "Land_Axe_F" createvehiclelocal [0,0,0]; 
_axe attachTo [player, [0,0,0.1], "RightHand"]; 
_axe setVectorDirAndUp [[0,-0.2,0.5],[-1,0,0]];

for "_i" from 0 to 2 do
{
	player playMove "AwopPercMstpSgthWnonDnon_throw";
	[player,"AxeChop"] remoteexeccall ["say3D",0];
	sleep 2.5;
};

_chopReward = [

	"lumber",
	"lumber",
	"lumber",
	"lumber",
	"lumber",	
	"lumber",
	"lumber",	
	"lumber",
	"lumber",	
	"lumber",
	"lumber",	
	"nitroamine",
	"diamond_uncut"	
];

_ressource = _chopReward select floor random count _chopReward;
titleText[format[localize "STR_ISTR_Axe_Success",_ressource,_diff],"PLAIN"];
[true,_ressource,1] call life_fnc_handleInv;
detach _axe;
deletevehicle _axe;



life_action_inUse = false;
life_action_gathering = false;