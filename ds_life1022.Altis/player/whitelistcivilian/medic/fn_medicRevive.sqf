/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	special revive script for medics only
*/

private ["_body","_bodyName","_heading","_payment","_sleep"];
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
_body = DS_cursorTarget;
if(isNull _body)exitwith{};
if(_body getVariable ["reviving",false])exitwith{};
if(!(_body getVariable ["revive",false]))exitwith{systemchat "You may not revive this body"};
if(!(_body getVariable ["requestedMedic",false]))exitwith{systemchat "This person has not requested a medic, therefore you can not revive them"};
if(player distance _body > 5)exitwith{systemchat "You are too far from the body"};
_payment = _body getVariable ["reviveCost",25000];

_bodyName = _body getVariable ["name","Unknown"];
_heading = format ["Reviving %1",_bodyName];
DS_doingStuff = true;
_sleep = 0.3;
if((DS_infoArray select 10) > 3)then
	{
	_sleep = (_sleep*0.5);
	};

_body setVariable["Reviving",true,true];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable ["DS_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_heading];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_targets = allPlayers select {(_x distance player) < 300};
[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["DS_fnc_animSync",_targets];

player playMoveNow "AmovPercMstpSnonWnonDnon";

while {true} do
{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_heading];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DS_tazed) exitWith {}; //Tazed
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _body > 4) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
_body setVariable["reviving",false,true];
if(!alive player OR DS_tazed) exitWith {DS_doingStuff = false;};
if((player getVariable["restrained",false])) exitWith {DS_doingStuff = false;};
if(player distance _body > 4) exitWith {titleText["You got too far away from the target.","PLAIN"]; DS_doingStuff = false;};
_body setVariable["revive",false,true];
[7] spawn DS_fnc_alterStats;
[player getVariable["name",name player],_payment,player] remoteExec ["DS_fnc_revivedMedic",_body];
DS_doingStuff = false;
sleep 1;
player reveal _body;

sleep 10;

if((DS_infoArray select 10) > 12)then{_payment = (_payment*1.25);};
if((DS_infoArray select 10) > 19)then{_payment = (_payment*1.5);};

systemchat format ["For your services you were paid $%1",_payment];
hint format ["For your services you were paid $%1",_payment];
[_payment,true,true] call DS_fnc_handleMoney;

if((DS_infoArray select 10) == 3)then { [3] call DS_fnc_questCompleted };
if((DS_infoArray select 10) == 12)then { [3] call DS_fnc_questCompleted };
if((DS_infoArray select 10) == 19)then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if(((DS_infoArray select 10) == 24)&&((DS_infoArray select 7) > 19))then { [3] call DS_fnc_questCompleted };