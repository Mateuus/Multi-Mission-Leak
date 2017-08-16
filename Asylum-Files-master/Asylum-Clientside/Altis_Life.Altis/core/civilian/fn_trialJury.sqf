/*
	File: fn_trialJury.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Jury duty has begin!
*/

_defendant = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amount = [_this,1,1,[1]] call BIS_fnc_param;

private ["_dialog","_text"];

[[0,2], format["The trial for the defendant %1 has begun. Their bail is currently $%2. YOU MUST CHOOSE YOUR VERDICT BEFORE TIME ELAPSES.  Failure to choose a verdict will result in a guilty default.", name _defendant, [_amount] call life_fnc_numberText]] spawn life_fnc_broadcast;
disableUserInput true;
life_jury_registered = nil;
life_trial_verdict = nil;
life_jury_active = true;
[] spawn
{
	waitUntil { player distance (getMarkerPos "courtroom") > 50 };
	life_jury_active = nil;
};

//Setup our progress bar
_title = "Court in session";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	sleep 0.9;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!life_trial_inprogress) exitWith {};
	if (_cP >= 1) exitWith{};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];

waitUntil {life_trial_deliberating};

life_jury_response = nil;
disableUserInput false;
hintSilent parseText "<t align='center'>Don't decide too quickly, the jury will deliberate for 2 minutes. Speak your opinion. <t color='#00FF00'>Use your action menu (scroll wheel) to choose your verdict!</t></t>";
player addAction ["Vote <t color='#00FF00'>NOT GUILTY</t>", {life_jury_response = true;},false,6,false,true,"",'isNil "life_jury_response"'];
player addAction ["Vote <t color='#FF0000'>GUILTY</t>", {life_jury_response = false},false,6,false,true,"",'isNil "life_jury_response"'];

[] spawn
{
	waitUntil {!isNil "life_jury_response" || !life_trial_deliberating || !life_trial_inprogress};
	if (!isNil "life_jury_response") then { if (life_jury_response) then { [[true],"life_fnc_juryVote",false,false] spawn life_fnc_MP; }; };
	removeAllActions player;
};

//Setup our progress bar
_title = "Jury deliberating";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	sleep 0.8;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!life_trial_deliberating || !life_trial_inprogress) exitWith {};
	if (_cP >= 1) exitWith{};
};

5 cutText ["","PLAIN"];

waitUntil {!life_trial_inprogress && !isNil "life_trial_verdict"};

_reward = 2000;
_verdict = "GUILTY";
if (life_trial_verdict) then { _verdict = "NOT GUILTY"; };
closeDialog 0;

[[0,2], format["A verdict has been reached.  The defendant, %1, was found %2. As payment for your time, the government of %3 has awarded you $%4.", name _defendant, _verdict, worldName, [_reward] call life_fnc_numberText]] spawn life_fnc_broadcast;
if (isWeaponDeployed player) then { player playMove ""; };
player setPosATL life_jury_pos;
disableUserInput false;
life_jury_active = nil;

["atm","add",_reward] call life_fnc_uC;