#include "..\..\script_macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_reviveCost"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {};
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");

_revivable = _target GVAR ["Revive",FALSE];
if(_revivable) exitWith {};
if(_target GVAR ["Reviving",ObjNull] == player) exitWith {hint  "Jemand anderes belebt diese Person bereits wieder";};
if(player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target GVAR ["name","Unknown"];
_title = format[ "Wird wiederbelebt %1",_targetName];
life_action_inUse = true; //Lockout the controls.

_target SVAR ["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep .15;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if((player GVAR ["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target GVAR ["Revive",FALSE]) exitWith {};
	if(_target GVAR ["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_target GVAR ["Reviving",ObjNull] != player) exitWith {hint  "Jemand anderes belebt diese Person bereits wieder"};
_target SVAR ["Reviving",NIL,TRUE];

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if(_target GVAR ["Revive",FALSE]) exitWith {hint  "Diese Person ist entweder respawnt oder wurde bereits wiederbelebt."};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[ "Du bist zu weit vom Körper entfernt.","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[ "Aktion abgebrochen","PLAIN"]; life_action_inUse = false;};

ADD(BANK,_reviveCost);

life_action_inUse = false;
_target SVAR ["Revive",TRUE,TRUE];
[profileName] remoteExecCall ["life_fnc_revived",_target];
titleText[format[ "%1 hat dich wiederbelebt und dafür eine Gebühr von $%2 von deinem Bankkonto eingezogen.Receive",_targetName,[_reviveCost] call life_fnc_numberText],"PLAIN"];

sleep .6;
player reveal _target;
