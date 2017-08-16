#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_dataCiv","_addExpAmount"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};


//SkillSystem
/* Ungenutzt 
_dataCiv = missionNamespace getVariable "Weed_Prof";
_addExpAmount = 25;_time = 0.005; _cpRate = 0.009;
if((_dataCiv select 0) > 0) then {
		_addExpAmount = _addExpAmount + round(2.5 * (_dataCiv select 0));
};

switch ( _dataCiv select 0 ) do {
	case 0: { _time = 0.005; _cpRate = 0.009; };
	case 1: { _time = 0.006; _cpRate = 0.01; };
	case 2: { _time = 0.007; _cpRate = 0.01; };
	case 3: { _time = 0.008; _cpRate = 0.01; };
	case 4: { _time = 0.009; _cpRate = 0.01; };
	case 5: { _time = 0.01; _cpRate = 0.01; };
	case 6: { _time = 0.015; _cpRate = 0.02; };
	case 7: { _time = 0.02; _cpRate = 0.03; };
	case 8: { _time = 0.025; _cpRate = 0.04; };
	case 9: { _time = 0.03; _cpRate = 0.05; };
	case 10: { _time = 0.035; _cpRate = 0.07; };
	case 11: { _time = 0.04; _cpRate = 0.08; };
	case 12: { _time = 0.045; _cpRate = 0.09; };
	case 13: { _time = 0.05; _cpRate = 0.09; };
	case 14: { _time = 0.055; _cpRate = 0.09; };
	case 15: { _time = 0.06; _cpRate = 0.10; };
	case 16: { _time = 0.065; _cpRate = 0.11; };
	case 17: { _time = 0.07; _cpRate = 0.12; };
	case 18: { _time = 0.075; _cpRate = 0.12; };
	case 19: { _time = 0.08; _cpRate = 0.13; };
	case 20: { _time = 0.085; _cpRate = 0.14; };
};
//SkillSystem
*/

if(_group == grpPlayer) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	//_cpRate = _cpRate;
} else {
	//_cpRate = _cpRate * 1.5;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
lhm_action_inUse = true;

_hideout setVariable["inCapture",true,true];
// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};

//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Capturing";
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable "lhm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_time = 0.6;

For "_i" from 0 to 1 step 0 do
{
	// Animation Fix Test
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		 player action ["SwitchWeapon", player, player, 100];
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	 };
	 // Animation Fix Test
	sleep _time;
	if(isNull _ui) then {
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNamespace getVariable "lhm_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
	if(lhm_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
	if(lhm_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR lhm_istazed) exitWith {lhm_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {lhm_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; lhm_action_inUse = false;_hideout setVariable["inCapture",false,true];};
lhm_action_inUse = false;

titleText["Hideout eingenommen.","PLAIN"];
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
[[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",grpPlayer,true];
//SkillSystem
//["Weed_Prof",_addExpAmount] call lhm_fnc_addExp;
//[[0,format["Du bekommst %1 XP für's Hideout einnehmen", _addExpAmount]],"lhm_fnc_broadcast",player,false] call lhm_fnc_mp;
//SkillSystem