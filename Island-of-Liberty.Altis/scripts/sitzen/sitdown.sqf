_chair=_this select 0;
_unit = _this select 1;

if((player distance _chair) > 2) exitWith {};
if(isNil "sitStatus")then{
sitStatus=0};
_handled=false;
if(isNil "(_chair getVariable 'used')")then{_chair setVariable ["used",false,true];};
if(_chair getVariable "used")then{exitWith};

if(sitStatus == 0)then{
if((player distance _chair) < 2)then{
	player attachTo [_chair,[0,0,0]];
	player switchMove "HubSittingChairUB_idle3";
	[player,"HubSittingChairUB_idle3"] remoteExec ["life_fnc_animSync",0];
	_chair setVariable ["used",true,true];
	detach player;
	player setDir (direction _chair + 180);
	life_CurChair=_chair;
	sitStatus=1;
	_handled=true;};
	AufstehenAction = _unit addaction ["<t color='#FF9100'>Aufstehen</t>","scripts\sitzen\standup.sqf"];
};