#include <macro.h>
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title","_veh"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = _this select 1;
if(isNull _target) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
life_action_inUse = true; //Lockout the controls.
[player,"revive"] remoteExecCall ["say3D",0];
_target setVariable["Reviving",player,TRUE];

_veh = "Land_Defibrillator_F" createvehicle [0,0,0];
_veh setpos (player modelToWorld [-0.8,0.3,0]); 
_veh setdir ((getdir player) - 180);

_sleep = 0.195;
_cP = 0.01;
_upp = format[localize "STR_Medic_Progress",_targetName];

_handle = [_upp,_sleep,_cP,"AinvPknlMstpSnonWnonDnon_medic_1",_target,5] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; deletevehicle _veh; life_action_inUse = false; _target setVariable["Reviving",NIL,TRUE];};
if(life_process_bad) exitWith {life_process_bad = false; deletevehicle _veh; life_action_inUse = false; life_interrupted = false; _target setVariable["Reviving",NIL,TRUE];};

deletevehicle _veh;
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};

switch(_mode) do {

	case 0: 
	{
		life_beatbankgeld = life_beatbankgeld + (call life_revive_fee);
		titleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call life_revive_fee)] call life_fnc_numberText],"PLAIN"];
	};
	
	case 1: {titleText[format["Du hast %1 mit der dunklen Kugel wiederbelebt.",_targetName],"PLAIN"];};
	case 2: {titleText[format["Du hast %1 mit dem Defibrillator wiederbelebt.",_targetName],"PLAIN"];};
};

life_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[profileName,_mode] remoteExec ["life_fnc_revived",_target];

sleep 0.6;
player reveal _target;