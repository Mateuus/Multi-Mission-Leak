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
	[[player,"HubSittingChairUB_idle3"],"ES_fnc_animSync",true,false] spawn ES_fnc_MP;
	_chair setVariable ["used",true,true];
	detach player;
	player setDir (direction _chair + 180);
	ES_CurChair=_chair;
	sitStatus=1;
	_handled=true;};
	AufstehenAction = _unit addaction ["Aufstehen",ES_fnc_standup];
};