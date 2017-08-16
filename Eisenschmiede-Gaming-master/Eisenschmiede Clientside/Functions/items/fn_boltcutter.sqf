#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];

if(playerside != civilian) exitWith { hint "Du bist kein Zivilist"; };

_building = param [0,ObjNull,[ObjNull]];

if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};

if(((nearestObject [[16592.863,12286.79,0]," Land_Offices_01_V1_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) && ({side _x == west} count playableUnits < (ES_SETTINGS(getNumber,"cops_online_min")))) exitWith {
	hint format [localize "STR_Civ_NotEnoughCops",(ES_SETTINGS(getNumber,"cops_online_min"))]
};
if(isNil "ES_boltcutter_uses") then {ES_boltcutter_uses = 0;};

if((nearestObject [[16592.863,12286.79,0],"Land_Offices_01_V1_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExec ["ES_fnc_broadcast",-2];
} else {
	[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExec ["ES_fnc_broadcast",-2];
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
ES_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Offices_01_V1_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.003;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["ES_fnc_animSync",-2];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["ES_progress","PLAIN"];
		_ui = uiNamespace getVariable "ES_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(ES_istazed) exitWith {}; //Tazed
	if(ES_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR ES_istazed) exitWith {ES_action_inUse = false;};
if((player getVariable ["restrained",false])) exitWith {ES_action_inUse = false;};
if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; ES_action_inUse = false;};
ES_boltcutter_uses = ES_boltcutter_uses + 1;
ES_action_inUse = false;

if(ES_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call ES_fnc_handleInv;
	ES_boltcutter_uses = 0;
};

_building setVariable [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable ["locked",false])) then {
	_building setVariable ["locked",false,true];
};
[getPlayerUID player,profileName,"459"] remoteExec ["ES_fnc_wantedAdd",2];