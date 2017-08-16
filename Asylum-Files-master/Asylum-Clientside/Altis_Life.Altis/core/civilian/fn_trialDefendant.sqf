/*
	File: fn_trialDefendant.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Your trial has begun!
*/

[[0,1,2], "Your trial has begun. You have three minutes to convince the jury of your innocence. Good luck."] spawn life_fnc_broadcast;

[player,player,true] spawn life_fnc_restrainAction;

[] spawn
{
	waitUntil { player distance (getMarkerPos "courtroom") > 50 };
};

//Setup our progress bar
_title = "Plead your innocence";
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
[[0,1,2], "The jury is now deliberating.  You will have the verdict soon."] spawn life_fnc_broadcast;
[nil,nil,nil,player] spawn life_fnc_unrestrain;

waitUntil {!life_trial_inprogress && !isNil "life_trial_verdict"};

_verdict = "GUILTY";
if (life_trial_verdict) then
{
	_verdict = "NOT GUILTY";
	life_bail_paid = true;
	if (!(8 in life_achievements)) then { [8] call life_fnc_achievementGrant };
};

[[0,1,2], format["A verdict has been reached.  You, the defendant, were found %1.", _verdict]] spawn life_fnc_broadcast;