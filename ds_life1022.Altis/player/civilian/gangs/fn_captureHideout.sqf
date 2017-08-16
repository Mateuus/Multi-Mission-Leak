/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Captures a gang hideout
*/

private ["_gangName","_hideout","_owners","_ownersStr","_action","_sleep","_tempNum"];

disableSerialization;

closeDialog 0;

_gangName = (group player) getVariable ["gangName",""];
if(_gangName isEqualTo "")exitWith{hint "You must be in a gang to capture this hideout";DS_doingStuff = false;};
_action = true;
if(DS_moral < 200)then {
	_sleep = 0.5;
} else {
	_sleep = 1;
};

_hideout = [] call DS_fnc_getNearestHideout;
if(isNull _hideout)exitWith{hint "You are not near a hideout"};

_owners = _hideout getVariable ["gangOwner",grpNull];
if((!isNull _owners)&&(_owners isEqualTo (group player)))exitWith{hint "Your gang already holds this hideout"};
if(!isNull _owners)then {
	_sleep = (_sleep*2);
	_ownersStr = _owners getVariable ["gangName",""];
	_action = [
		format ["This gang hideout is currently held by %1, are you sure you want to remove their ownership over it?",_ownersStr],
		"Gang Area Owned",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
};
if(!_action)exitWith{};

if((DS_infoArray select 15) > 28)then {_sleep = (_sleep*0.8);};
if((DS_infoArray select 15) > 36)then {_sleep = (_sleep*0.8);};

DS_doingStuff = true;

_title = "Capturing Hideout";
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;

while{true}do {
	sleep _sleep;
	if(isNull _ui)then {
		"progressBar" cutRsc ["DS_progress","PLAIN"];
		_ui = uiNamespace getVariable "DS_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance _hideout > 10)exitWith{};
	if(!isNull objectParent player)exitWith{};
	if(_cP >= 1 OR !alive player)exitWith{};
	if(!alive player)exitWith{};
};
DS_doingStuff = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitWith{};
if(player distance _hideout > 10)exitWith{hint "You moved too far from the flag"};
if(!isNull objectParent player)exitWith{hint "You can not enter a vehicle while doing this"};

_owners = _hideout getVariable ["gangOwner",grpNull];
if((!isNull _owners)&&(_owners isEqualTo (group player)))exitWith{hint "Your gang already holds this hideout"};

titleText ["The gang hideout has been captured.","PLAIN"];
_hideout setVariable ["gangOwner",(group player),true];

if(!isNull _owners)then {
	{
		[0,"You have just lost a gang hideout",false,0] remoteExecCall ["DS_fnc_globalMessage",_x];
	}forEach (units _owners);
};

if((DS_infoArray select 15) == 7)then { [1] call DS_fnc_questCompleted };
if((DS_infoArray select 15) == 19)then { [1] call DS_fnc_questCompleted };