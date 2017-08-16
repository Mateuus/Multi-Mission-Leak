/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Re-locks the door mainly for various entries...
*/
private["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "In dieser Richtung steht kein Haus."};
_door = [_building] call life_fnc_nearestDoor;

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 1) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

closeDialog 0;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.008; [150000,"der Altis Bank",0,true] remoteExecCall ["life_fnc_moneytransfer",west]};
	case "Land_MilOffices_V1_F": {_cpRate = 0.010; [150000,"der Altis Bank",0,true] remoteExecCall ["life_fnc_moneytransfer",west]};
	default {_cpRate = 0.08;}
};

_sleep = 0.195;
_cP = _cpRate;
_upp = localize "STR_Cop_RepairingDoor";

_handle = [_upp,_sleep,_cP,"AinvPknlMstpSnonWnonDnon_medic_1",nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_building animate [format["door_%1_rot",_door],0];
_building setVariable[format["bis_disabled_Door_%1",_door],1,true];