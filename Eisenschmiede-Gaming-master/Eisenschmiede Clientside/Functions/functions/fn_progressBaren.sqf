/*	File: fn_progressBaren.sqf	
	Author: Herman "Mordin" Othelius	
	Template: Tonics crap :P	
	Description: Should pop up a progressbar :)
*/

private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object"];
	_object = _this Select 0; 
	bar_cpRate = 0.0045;
	disableSerialization;
	_title = "Breaking out prisoner";
	ES_action_inUse = true;
	disableSerialization;
	_title = "Breaking out prisoner";
	5 cutRsc ["ES_progress","PLAIN"];
	_ui = uiNamespace getVariable "ES_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

while {true} do{

	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"ES_fnc_animSync",true,false] spawn ES_fnc_MP;		
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";	
	};	
		sleep 0.26;	
	if(isNull _ui) then {		
		5 cutRsc ["ES_progress","PLAIN"];		
		_ui = uiNamespace getVariable "ES_progress";		
		_progressBar = _ui displayCtrl 38201;		
		_titleText = _ui displayCtrl 38202;	
	};	
	_cP = _cP + _cpRate;	
	_progressBar progressSetPosition _cP;	
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];	
	if(_cP >= 1 OR !alive player) exitWith {};	
	if(ES_istazed) exitWith {};
	if(ES_interrupted) exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR ES_istazed) exitWith {ES_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {ES_action_inUse = false;};

if(ES_interrupted) exitWith {
	ES_interrupted = false; 
	titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; 
	ES_action_inUse = false;
};

ES_action_inUse = false;
_object setPos (getMarkerPos "jail_breakout");