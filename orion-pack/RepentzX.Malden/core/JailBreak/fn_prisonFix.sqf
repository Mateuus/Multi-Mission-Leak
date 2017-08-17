#include "..\..\script_macros.hpp"

_prisonvaultVariablesPos = [10044.836,6061.898,-1.612];
_prisonvaultVariables = nearestObject [_prisonvaultVariablesPos,"Land_Canal_WallSmall_10m_F"];

if(!(_prisonvaultVariables getVariable["prison_open",false])) exitWith {hint "Looks like the wall is already fixed.";};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Repairing prison wall..";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + .012;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_prisonvaultVariables setVariable["prison_open",false,true];
[_prisonvaultVariables] remoteExec ["life_fnc_JailBreakFix", RSERV];
[5,"<t color='#FFFF00'><t size='1.5'>The jail has been secured and repaired!</t></t>"] remoteExecCall ["life_fnc_broadcast",-2];
deleteMarker "MarkerJailbreak";
deleteMarker "MarkerTextJailbreak";

