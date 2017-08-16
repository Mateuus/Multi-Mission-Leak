/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Revives a fallen player
*/
private ["_body","_bodyName","_heading"];

_body = DS_cursorTarget;
if(isNull _body)exitwith{};
if(_body getVariable ["headShot",false])exitwith{systemchat "This person has suffered massive and irreparable damage to the Cranium"};
if(!(_body getVariable ["revive",false]))exitwith{systemchat "This person is long gone"};
if(_body getVariable ["reviving",false])exitwith{};
if(player distance _body > 5)exitwith{systemchat "to far"};
if((playerside == civilian)&&(side _body == west))exitwith{systemchat "Civilians can not revive police officers"};

_bodyName = _body getVariable ["name","Unknown"];
_heading = format ["Reviving %1",_bodyName];
DS_doingStuff = true;

_body setVariable["Reviving",true,true];
disableSerialization;
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNamespace getVariable ["DS_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_heading];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

[[player,"AmovPercMstpSnonWnonDnon"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
player playMoveNow "AmovPercMstpSnonWnonDnon";

//Lets reuse the same thing!
while {true} do
{
	sleep 0.35;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_heading];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DS_tazed) exitWith {}; //Tazed
	if((player getVariable["cuffed",false])) exitWith {};
	if(player distance _body > 3) exitWith {};
	if(!(_body getVariable["Revive",FALSE]))exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
_body setVariable["Reviving",false,true];
if(!alive player OR DS_tazed) exitWith {DS_doingStuff = false;};
if(!(_body getVariable["Revive",FALSE]))exitWith {DS_doingStuff = false;};
if((player getVariable["cuffed",false])) exitWith {DS_doingStuff = false;};
if(player distance _body > 3) exitWith {titleText["You got too far away from the target.","PLAIN"]; DS_doingStuff = false;};
_body setVariable["revive",false,true];


if(playerside == independent)then{[7] call DS_fnc_alterStats;};

[[player getVariable["name",name player]],"DS_fnc_revivedRebel",_body,FALSE] spawn BIS_fnc_MP;
DS_doingStuff = false;
sleep 1;
player reveal _body;

if((DSL_rebelAdv)&&((DS_infoArray select 17) == 1))then
	{
	[2] call DS_fnc_questCompleted;
	};

[100,true] call DS_fnc_moralAlter;
















