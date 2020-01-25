/*
	File: fn_revivePlayer.sqf
	
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {};

if(player distance _target > 4) exitWith {};

if(_target getVariable ["Reviving",ObjNull] == player) exitWith {[localize "STR_Medic_AlreadyReviving", false] spawn domsg;};


//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];

 if(koil_antispam == 1) exitWith {};

[] spawn life_fnc_AntiSpam;

life_action_inUse = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;

_cP = 0;
if(karma_level > 0) then {
	_cp = karma_level / 100;
};

//Lets reuse the same thing!
while {true} do
{
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic0";
	uiSleep 0.08;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR deadPlayer) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 5) exitWith {};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

if(player distance _target > 4) exitWith { [localize "STR_Medic_TooFar", false] spawn domsg; life_action_inUse = false; };
player playActionNow "stop";
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {[localize "STR_Medic_AlreadyReviving", false] spawn domsg;};
_target setVariable["Reviving",NIL,TRUE];
if(deadPlayer OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};

if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", false] spawn domsg; life_action_inUse = false;};

[player,"defib"] spawn life_fnc_nearestSound;	

["bank","add",(call life_revive_fee)] call life_fnc_handleCash; 
life_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];

[profileName,"REVIVE"] remoteExec ["life_fnc_revived",_target];

[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call life_revive_fee)] call life_fnc_numberText], false] spawn domsg;

["Add",1] call fnc_karma;