#include <macro.h>

/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Re-locks the door mainly for the federal reserve structures.
*/
private["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText"];
_building = param [0,ObjNull,[ObjNull]];
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};

_doors = 1;
_doors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,typeOf _building,"NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(EQUAL(_door,0)) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
_doorN = _building GVAR [format["bis_disabled_Door_%1",_door],0];
if(EQUAL(_doorN,1)) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairingDoor";
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.08;

for "_i" from 0 to 1 step 0 do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player playMoveNow "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_progressText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR {!alive player}) exitWith {};
	if(life_interrupted) exitWith {};
};

[false] call life_fnc_tufruxatra;
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_building animate [format["door_%1_rot",_door],0];
_building SVAR [format["bis_disabled_Door_%1",_door],1,true]; //Unlock the door.
