/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Evicts the tenants of a gang hideout
*/

private["_hideout","_owners","_ownersStr","_action","_sleep","_tempNum"];

disableSerialization;
closeDialog 0;

if((player getVariable ["policeAction",""]) != "Raiding")exitwith{hint "You can not do this while your task is not set to raiding"};

_hideout = [] call DS_fnc_getNearestHideout;
if(isNull _hideout)exitwith{hint "You are not near a hideout"};

_owners = _hideout getVariable ["gangOwner",grpNull];
if(isNull _owners)exitwith{hint "There is no one to evict here"};

_ownersStr = _owners getVariable ["gangName",""];
_action = [
	format ["This gang area is currently held by %1, are you sure you want to remove their ownership over it?",_ownersStr],
	"Gang Area Owned",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};

DS_doingStuff = true;

_title = "Evict Tenants";
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable "DS_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cpRate = 0.01;
_cP = 0.01;

if((DS_infoArray select 21) > 21)then {
	_sleep = 0.2;
} else {
	_sleep = 0.3;
};

while{true}do {
	sleep _sleep;
	if(isNull _ui) then {
		"progressBar" cutRsc ["DS_progress","PLAIN"];
		_ui = uiNamespace getVariable "DS_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(player distance _hideout > 10) exitwith {};
	if(!isNull objectParent player) exitwith {};
	if(_cP >= 1 OR !alive player) exitWith {};
};
DS_doingStuff = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player distance _hideout > 10) exitwith {hint "You moved too far from the flag"};
if(!isNull objectParent player) exitwith {hint "You can not enter a vehicle while doing this"};
[] call DS_cop_addEvictMarker;
_owners = _hideout getVariable ["gangOwner",grpNull];
if(isNull _owners)exitwith{hint "There is no one to evict here"};

titleText["You have evicted the tenants from this gang hideout.","PLAIN"];
_hideout setVariable["gangOwner",grpNull,true];
[0,"The police department have just evicted a gang from a hideout",false,2] remoteExecCall ["DS_fnc_globalMessage",civilian];
[15000,true] remoteExec ["HUNT_fnc_policeBank",2];
[10000,"Evicted a gang from a hideout",name player] remoteExec ["DS_fnc_copRewards",west];

if((DS_infoArray select 21) == 21)then { [3] call DS_fnc_questCompleted };
if((DS_infoArray select 21) == 31)then {
	_tempNum = (DS_infoArray select 22) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [22,_tempNum];
	};
};