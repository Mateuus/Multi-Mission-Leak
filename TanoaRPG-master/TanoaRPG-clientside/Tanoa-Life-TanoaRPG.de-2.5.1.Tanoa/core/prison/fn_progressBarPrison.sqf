/*
	File: fn_progressBarPrison.sqf
	Author: Herman "Mordin" Othelius
	Modified: Tim "cat24max" Vogler && CooliMC

	Description: Should pop up a progressbar :)
*/

private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _object) exitWith {};

//Setup the progress bar
_cpRate = 0.0045;
disableSerialization;
_title = "Zellentuer wird gehackt...";
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;


[[0,1,2],format["%1 wird aus dem Gefägnis ausgebrochen!!!", (name _object)]] remoteExec ["tanoarpg_fnc_broadcast", -2];

while {true} do
{	
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then { [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["tanoarpg_fnc_animSync", -2, false]; };	
	sleep 3;
	
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};//Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {
	life_interrupted = false;
	titleText[localize "STR_NOTF_ActionCancel","PLAIN"];
	life_action_inUse = false;
};
life_action_inUse = false;
//_object setPos (getMarkerPos "jail_release");
//_object setPosASL [(getMarkerPos "jail_release" select 0),(getMarkerPos "jail_marker" select 1),4];

_object setPosASL [11151.4,5413.56,4]; //Position for Jail Release because marker getPos doesnt fucking work what the fuck

[getPlayerUID player,profileName,"902"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];