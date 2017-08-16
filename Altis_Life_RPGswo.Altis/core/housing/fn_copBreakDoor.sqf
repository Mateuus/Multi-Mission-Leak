#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Allows cops to 'kick' in the door?
*/
private["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_uid"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {hint "Das Haus gehört niemanden!"};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call DWEV_fnc_isUIDActive)) exitWith {hint "Die Person ist nicht Online du kannst es nicht durchsuchen!"};

if (!(([_uid] call DWEV_fnc_getActiveUIDplayer) getVariable ["restrained",false])) exitWith {hint "Der Besitzer dieses Hauses ist nicht festgenommen!";};


_door = [_house] call DWEV_fnc_nearestDoor;
if(_door == 0) exitWith {hint "Du bist nicht in der nähe einer Tür!"};
if((_house getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "Die Tür ist bereits geöffnet!"};
if(_house isKindOf "House_F" && __GETC__(DWEV_coplevel) < 3) exitWith {hint "Du musst mindestens Kommissar sein!"; closeDialog 0;};

DWEV_action_inUse = true;


disableSerialization;
_title = "Breche das Türschloss auf";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;

[2,format["%1 dein Haus wird gerade von der Polizei aufgebrochen",(_house getVariable "house_owner") select 1]] remoteExec ["DWEV_fnc_broadcast",-2];

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
			
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_interrupted) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;};
DWEV_action_inUse = false;
_house animate [format["door_%1_rot",_door],1];
_house setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.