/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Defuses blasting charges for the cops?
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {};
if(!(_vault getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};

life_action_inUse = true;

_sleep = 0.195;
_cP = 0.0035;
_upp = localize "STR_ISTR_Defuse_Process";

_handle = [_upp,_sleep,_cP,"AinvPknlMstpsnonWnonDnon_medic_1",nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_vault setVariable["chargeplaced",false,true];
[0,"STR_ISTR_Defuse_Success"] remoteExecCall ["life_fnc_broadcast",west];