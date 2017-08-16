#include "..\..\macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/

private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_reviveCost"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {};
_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if (DWEV_var_playerInPvpAreal) exitWith {hint "Du darfst in der PvP Zone niemanden wiederbeleben!"};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint "Jemand anderes wiederbelebt diese Person schon.";};
if(_target getVariable ["Reviving_in_process",false]) exitWith {hint "Jemand anderes wiederbelebt diese Person schon.";};
_reviveCost = DWEV_SETTINGS(getNumber,"revive_fee");


if(player distance _target > 4) exitWith {};

_targetName = _target getVariable["name","Unknown"];
_title = format["%1 wird Wiederbelebt",_targetName];
DWEV_action_inUse = true;

_target setVariable ["Reviving_in_process",true,true];

_target setVariable["Reviving",player,TRUE];

disableSerialization;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable ["DWEV_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

player playMove "AinvPknlMstpsnonWnonDr_medic0";
while {true} do
{

if (animationState player == "ainvpknlmstpsnonwnondnon_medicend") then  
{
	player playActionNow "stop";
	player playMove "AinvPknlMstpsnonWnonDr_medic0";
};
	sleep 0.195;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 5) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint "Jemand anderes belebt ihn schon wieder."};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR DWEV_istazed) exitWith {DWEV_action_inUse = false; _target setVariable ["Reviving_in_process",false,true];};
if(_target getVariable["Revive",FALSE]) exitWith {hint "Die Person sit schon respawnt oder wurde von jemand anderes Wiederbelebt."};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;_target setVariable ["Reviving_in_process",false,true];};
if(!isNil "_badDistance") exitWith {titleText["Du bist zuweit weg.","PLAIN"]; DWEV_action_inUse = false;_target setVariable ["Reviving_in_process",false,true];};
if(player distance _target > 5) exitWith {titleText["Du bist zuweit weg.","PLAIN"]; DWEV_action_inUse = false;_target setVariable ["Reviving_in_process",false,true];};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;_target setVariable ["Reviving_in_process",false,true];};


dwf_atmcash = dwf_atmcash + _reviveCost;
DWEV_action_inUse = false;

_target setVariable ["Reviving_in_process",false,true];

_target setVariable["Revive",TRUE,TRUE];
[getMyDName] remoteExec ["DWEV_fnc_revived",_target];
titleText[format["Du hast %1 Wiederbelebt und %2€ für deine Dienste erhalten.",_targetName,[_reviveCost] call DWEV_fnc_numberText],"PLAIN"];
[1] call SOCK_fnc_updatePartial;

sleep 0.6;
player reveal _target;