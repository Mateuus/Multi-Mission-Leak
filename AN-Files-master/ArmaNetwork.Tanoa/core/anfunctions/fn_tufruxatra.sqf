/*
	File: fn_progressBar.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the progress bar.
*/
private["_ui","_progressTime","_text"];
_yes = param [0,true,[true]];
_progressTime = param [1,0,[0]];
_text = param [2,"",[""]];
disableSerialization;

if(_yes) exitWith
{
	("life_progressLayer" call BIS_fnc_rscLayer) cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progressCtrl = _ui displayCtrl 38201;
	_progressCtrl progressSetPosition _progressTime;
	_titleCtrl = _ui displayCtrl 38202;
	_titleCtrl ctrlSetText _text;
	[_ui,_progressCtrl,_titleCtrl];
};

_layer = ("life_progressLayer" call BIS_fnc_rscLayer);
_layer cutFadeOut 0.5;
