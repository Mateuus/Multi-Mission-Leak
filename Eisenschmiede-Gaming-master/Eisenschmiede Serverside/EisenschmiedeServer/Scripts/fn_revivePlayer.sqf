#include "..\script_macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = param [0,ObjNull,[ObjNull]];
if(isNull _target) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

if!(_target getVariable "Revivable") exitWith { hint format ["%1 hat keine Feuerwehr angefordert und kann somit nicht wiederbelebt werden",_target getVariable "realname"] };
_revivable = _target getVariable ["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

_BloodBag = "Land_BloodBag_F" createVehicle position player;
_BloodBag attachTo [player,[0.439175,0.384279,0.01]];
_Bandage = "Land_Bandage_F" createVehicle position player;
_Bandage attachTo [player,[0.768556,0.439175,0.01]];
_Defibrillator = "Land_Defibrillator_F" createVehicle position player;
_Defibrillator attachTo [player,[0.439175,0,0.01]];


//Fetch their name so we can shout it.
_targetName = _target getVariable ["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
ES_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable ["ES_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_xpLvl = 1;
if(ES_xp_lvl >= 6) then {_xpLvl = 0.8;};
if(ES_xp_lvl >= 11) then {_xpLvl = 0.7;};
if(ES_xp_lvl >= 14) then {_xpLvl = 0.6;};
if(ES_xp_lvl >= 18) then {_xpLvl = 0.3;};
if(ES_xp_lvl >= 20) then {_xpLvl = 0.2;};


//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	sleep .30 * _xpLvl;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
	if(ES_istazed) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;}; //Tazed
	if(ES_interrupted) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
	if((player getVariable ["restrained",false])) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
	if(player distance _target > 4) exitWith {_badDistance = true; deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
	if(_target getVariable ["Revive",FALSE]) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
	if(_target getVariable ["Reviving",ObjNull] != player) exitWith {deleteVehicle _BloodBag; deleteVehicle _Bandage; deleteVehicle _Defibrillator;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable ["Reviving",NIL,TRUE];

if(!alive player OR ES_istazed) exitWith {ES_action_inUse = false;};
if(_target getVariable ["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if((player getVariable ["restrained",false])) exitWith {ES_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; ES_action_inUse = false;};
if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; ES_action_inUse = false;};

ES_atmbank = ES_atmbank + (ES_SETTINGS(getNumber,"revive_fee"));

["Wiederbeleben"] call ES_fnc_xp_add;

ES_action_inUse = false;
_target setVariable ["Revive",TRUE,TRUE];
[profileName] remoteExec ["ES_fnc_revived",_target];
titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(ES_SETTINGS(getNumber,"revive_fee"))] call ES_fnc_numberText],"PLAIN"];

deleteVehicle _BloodBag;
deleteVehicle _Bandage;
deleteVehicle _Defibrillator;

sleep .6;
player reveal _target;