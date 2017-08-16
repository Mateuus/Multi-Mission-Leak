#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];
if(ES_xp_lvl < 10) exitWith {hint "Du kannst Gangverstecke erst ab Level 10 einnehmen.";};
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {group player getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
if(_group == group player) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
ES_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Capturing";
5 cutRsc ["ES_progress","PLAIN"];
_ui = uiNamespace getVariable "ES_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExec ["ES_fnc_animSync",-2];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
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
	_hideout setVariable ["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable ["inCapture",false,true];};
	if(ES_istazed) exitWith {_hideout setVariable ["inCapture",false,true];}; //Tazed
	if(ES_interrupted) exitWith {_hideout setVariable ["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR ES_istazed) exitWith {ES_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {ES_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if(ES_interrupted) exitWith {ES_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; ES_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
ES_action_inUse = false;

titleText["Hideout has been captured.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]] remoteExec ["ES_fnc_broadcast",-2];
_hideout setVariable ["inCapture",false,true];
_hideout setVariable ["gangOwner",group player,true];

 
_markername = str(getPos _hideout);
_gangname2 = formatText["Erobert von: %1",(group player) getVariable "gang_name"];
if (getMarkerColor _markername == "") then 
{
	gang_owner_marker = createMarker [_markername, position player]; 
	_markername setMarkerShape "ICON"; 
	_markername setMarkerType "hd_warning"; 
	_markername setMarkerColor "ColorBlue"; 
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else 
{
	_markername setMarkerText str(_gangname2);
};