/*
	File: fn_useDefibrilator.sqf
	Author: CooliMC
	
	Description:
	Starts the revive process on the player with a Defibrilator.
*/
private["_target","_player","_side","_revivable", "_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(isNull _player) exitWith {};
if(life_battery < 100) exitWith { hint "Du brauchst 100% Akku um den Defibrilator zu benutzen !!!"; };

_side = 0;
switch(side _player) do {
    case west: { _side = 3; };
    case civilian: { _side = 2; };
    case independent : { _side = 1; };
	case east : { _side = 2; };
	default { _side = 0; };
};
if(_side == 0) exitWith {};
if((_side > 1) && ((independent countSide playableUnits) > 0)) exitWith { hint "Solange Medics Online sind kann der Defibrilator nicht verwendet werden !!!"; };

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith { hint "Jemand anderes belebt die Person schon !!!"; };
if(player distance _target > 11) exitWith {};

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true;

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_time = 5;
switch(_side) do {
	case 1: { _time = 0.195; };
	case 2: { _time = 3; };
	case 3: { _time = 1.5; };
	default { _time = 3; };
};

//Lets reuse the same thing!
while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep _time;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {hint "Vorgang abgebrochen"};
	if(life_interrupted) exitWith {hint "Vorgang abgebrochen"};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 11) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"; life_action_inUse = false;};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"; life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};


if(_side == 1) then
{
	life_atmcash = life_atmcash + (call life_revive_moneyMedic);
	life_action_inUse = false;
	_target setVariable["Revive",TRUE,TRUE];
	[profileName] remoteExec ["tanoarpg_fnc_revived", _target, FALSE];
	titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call life_revive_moneyMedic)] call tanoarpg_fnc_numberText],"PLAIN"];
} else {
	life_action_inUse = false;
	_target setVariable["Revive",TRUE,TRUE];
	[profileName] remoteExec ["tanoarpg_fnc_revived", _target, FALSE];
	titleText[format["Du hast erfolgreich %1 wiederbelebt",_targetName],"PLAIN"];
};

life_battery = 0;
sleep 0.6;
player reveal _target;