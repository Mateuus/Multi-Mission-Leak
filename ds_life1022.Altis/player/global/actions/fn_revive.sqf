/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Revives a fallen player
*/

private ["_sleep","_body","_bodyName","_heading"];

_body = DS_cursorTarget;
if(isNull _body)exitwith{};
if(_body getVariable ["headShot",false])exitwith{systemchat "This person has suffered massive and irreparable damage to the Cranium"};
if(!(_body getVariable ["revive",false]))exitwith{systemchat "This person is long gone"};
if(_body getVariable ["reviving",false])exitwith{};
if(player distance _body > 5)exitwith{systemchat "You moved too far from your target"};
if((playerSide isEqualTo civilian)&&((side _body) isEqualTo west))exitwith{systemchat "Civilians can not revive police officers"};
_sleep = 0.4;
if((playerside == west)&&((DS_infoArray select 21) > 32))then {
	_sleep = 0.17;
};

if((playerside == civilian)&&((DS_infoArray select 17) > 41))then {
	_sleep = (_sleep*0.8);
};

if((playerside == civilian)&&((DS_infoArray select 15) > 29))then {
	_sleep = (_sleep*0.8);
};

_bodyName = _body getVariable ["name","Unknown"];
_heading = format ["Reviving %1",_bodyName];
DS_doingStuff = true;

_body setVariable["reviving",true,true];
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable ["DS_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_heading];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_targets = allPlayers select {(_x distance player) < 200};
[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["DS_fnc_animSync",_targets];

player playMoveNow "AmovPercMstpSnonWnonDnon";

//Lets reuse the same thing!
while {true} do
{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_heading];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DS_tazed) exitWith {}; //Tazed
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _body > 3) exitWith {};
	if(!(_body getVariable["revive",FALSE]))exitWith {};
	if(!isNull objectParent player)exitWith{};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
_body setVariable["reviving",false,true];
if(!isNull objectParent player)exitWith{};
if(!alive player OR DS_tazed) exitWith {DS_doingStuff = false;};
if(!(_body getVariable["revive",FALSE]))exitWith {DS_doingStuff = false;};
if((player getVariable["restrained",false])) exitWith {DS_doingStuff = false;};
if(player distance _body > 3) exitWith {titleText["You got too far away from the target.","PLAIN"]; DS_doingStuff = false;};
_body setVariable["revive",false,true];


if(playerSide isEqualTo independent)then{[7] call DS_fnc_alterStats;};

[player getVariable["name",name player]] remoteExec ["DS_fnc_revivedRebel",_body];
DS_doingStuff = false;
sleep 1;
player reveal _body;

if((playerside == civilian)&&((DS_infoArray select 17) == 1))then { [2] call DS_fnc_questCompleted };