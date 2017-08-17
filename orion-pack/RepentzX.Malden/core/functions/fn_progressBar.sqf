/*
 * Author: br1zey/Ryu
 * Special Thanks to ACE3 and Exile Team
 * Draw progress bar and execute given function if succesful.
 * Finish/Failure/Conditional are all passed [_args]
 *
 * Arguments:
 * 0: NUMBER - Total Time (in game "time" seconds)
 * 1: ARRAY - Arguments, passed to condition, fail and finish
 * 2: CODE or STRING - On Finish: Code called or STRING raised as event.
 * 3: CODE or STRING - On Failure: Code called or STRING raised as event.
 * 4: STRING - (Optional) Localized Title
 * 5: CODE - (Optional) Code to check each frame
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [5,[] {["Finished!"}, {hint "Failure!"}, "My Title",false,"slow"] call life_fnc_notificationSystem;] spawn rl_fnc_progressBar
 *
 * [5,[[false,"Test",false,5]], {(_this select 0) call life_fnc_hint},{["Abbgebrochen"},"Repariere",false,"slow"] call life_fnc_notificationSystem;] spawn rl_fnc_progressBar
 *
 * [5,[[false,"Test",false,5]], {(_this select 0) call life_fnc_hint},{["Abbgebrochen"},"Repariere",(cursorTarget isKindOf "CAR",false,"slow"] call life_fnc_notificationSystem;)] spawn rl_fnc_progressBar 
 */
private["_progress","_startTime","_sleepTime","_display","_label","_progressBarBackground","_progressBarMaxSize","_progressBar","_totalTime","_onFinish", "_onFail","_localizedTitle","_return","_condition","_lastAnimStart"];
disableSerialization;
params [
"_totalTime",
["_args",[]],
"_onFinish",
"_onFail",
["_localizedTitle", ""],
["_condition", {true}],
];
_progress = 0;
_startTime = diag_tickTime;
_sleepTime = _totalTime / 100;
_defaultVehicle = (vehicle player);
//close all Dialogs
closeDialog 0;
("RLActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscRLActionProgress", "PLAIN", 1, false];
createDialog "ProgressBar_Dialog";
_display = uiNamespace getVariable "RscRLActionProgress";
_label = _display displayCtrl 4002;
_label ctrlSetText format ["0% - %1",_localizedTitle];
_progressBarBackground = _display displayCtrl 4001;
_progressBarBackground ctrlSetBackgroundColor [0, 0, 0, 0.5];
_progressBarMaxSize = ctrlPosition _progressBarBackground;
_progressBar = _display displayCtrl 4000;
_progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3-0.01];
_progressBar ctrlSetBackgroundColor [0, 0.5, 1, 1];
_progressBar ctrlCommit 0;
_progressBar ctrlSetPosition _progressBarMaxSize;
_progressBar ctrlCommit _totalTime;
try
{
 while {_progress < 1} do{
 if !(alive player) then{
 throw false;
 };
 if !(dialog) then{
 throw false;
 };
 if (!([_args,(time - _startTime),_totalTime] call _condition)) then {
 throw false;
 };
 if( (player getVariable ["ACE_isUnconscious",false]) OR life_istazed OR (player getVariable ["restrained",false]) OR (_defaultVehicle != (vehicle player))) then{
 throw false;
 };
 if(! (_anim isEqualTo "") && time >= (_lastAnimStart + _animTime))then{
 [player, _anim] call ace_common_fnc_doAnimation;
 };
 uiSleep _sleepTime;
 _progress = ((diag_tickTime - _startTime) / _totalTime) min 1;
 _label ctrlSetText format["%1%2 - %3", round (_progress * 100), "%",_localizedTitle];
 };
 throw true;
}
catch
{
 _progressBarColor = [];
 if(_exception) then {
 _args call _onFinish;
 _return = true;
 _progressBarColor = [0.7, 0.93, 0, 1];
 }else{
 _args call _onFail;
 _return = false;
 _progressBarColor = [0.91, 0, 0, 1];
 };
 _progressBar ctrlSetBackgroundColor _progressBarColor;
 _progressBar ctrlSetPosition _progressBarMaxSize;
 _progressBar ctrlCommit 0;
};
("RLActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2;
closeDialog 24025;