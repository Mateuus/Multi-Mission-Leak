/*
	File: fn_CPRPlayer.sqf
	
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {};
if(player distance _target > 4) exitWith {};
if(!(_target isKindOf "man")) exitWith {};
 if(koil_antispam == 1) exitWith {};

[] spawn life_fnc_AntiSpam;

_revivable = _target getVariable["revive",FALSE];
if(_revivable) exitWith {
//	["cash","add",2000] call life_fnc_handleCash;
	hideBody _target;
};

if(_target getVariable ["CPR",ObjNull] == player) exitWith {["Ktos juz wykonuje pierwsza pomoc..", false] spawn domsg;};
if(player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_ProgressCPR",_targetName];

life_action_inUse = true; //Lockout the controls.

_target setVariable["CPR",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Performing CPR (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;

_cP = 0;
if(karma_level > 0) then {
	_cp = karma_level / 100;
};


//Lets reuse the same thing!
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDr_medic0") then {
		player playMoveNow "AinvPknlMstpSnonWnonDr_medic0";
	};

	uiSleep 0.2;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Performing CPR (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR deadPlayer) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 5) exitWith {};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["CPR",ObjNull] != player) exitWith {};
};

if(player distance _target > 4) exitWith { [localize "STR_Medic_TooFar", false] spawn domsg; life_action_inUse = false; };

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];

player playActionNow "stop";

if(_target getVariable ["CPR",ObjNull] != player) exitWith { ["Ktos juz wykonuje pierwsza pomoc..", false] spawn domsg; };

_target setVariable["CPR",NIL,TRUE];

if(deadPlayer OR life_istazed) exitWith {life_action_inUse = false;};

if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};

if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};

if(life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", false] spawn domsg; life_action_inUse = false;};

_chance = round (random 1000);
if(_chance < 200) then {
	[profileName,"CPR"] remoteExec ["life_fnc_revived",_target];
	sleep 2;
	if(_target getVariable["Revive",FALSE]) then { ["Ozywiles ta osobe!", false] spawn domsg; } else { ["Ustabilizowales stan tej osoby!", false] spawn domsg; };
	_pid = _target getVariable["steam64ID",""];
	if(_targetName == "Unknown" || _targetName == "" || _pid == "") then {
		hideBody _target;
		deleteVehicle _target;
		_target hideObject true;
	} else {
		uiSleep 0.6;
		player reveal _target;
	};
};

life_action_inUse = false;