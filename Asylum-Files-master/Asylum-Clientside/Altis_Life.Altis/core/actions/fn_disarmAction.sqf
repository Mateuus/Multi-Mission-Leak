/*
	File: fn_disarmAction.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Removes weapons from an unconscious player.
*/
private["_unit","_id","_jail","_markers"];

_unit = cursorTarget;
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (alive _unit) exitWith {};
if (_unit getVariable ["disarmed", false]) exitWith {};
if (!(cursorTarget isKindOf "Man")) exitWith {};

_targetName = _unit getVariable["name", "Unknown"];

//Setup our progress bar
_success = false;
_title = format["Disarming %1",_targetName];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

life_action_in_use = true;

[[player,"AinvPknlMstpSnonWnonDnon_medic1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
while {true} do
{
	sleep 0.038;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (isNull _unit) exitWith {};
	if (alive _unit) exitWith {};
	if(player distance _unit > 3) exitWith {};
	if(_cP >= 1) exitWith{ _success = true; };
	if (!life_action_in_use) exitWith {};
};

//Kill the UI display and check for various states
life_action_in_use = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!_success) exitWith {};

hint format["You removed all weapons from %1!", _targetName];

[[player],"life_fnc_disarmed",_unit,false] spawn life_fnc_MP;