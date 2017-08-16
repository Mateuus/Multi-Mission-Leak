/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends a player to jail
*/

private["_exit","_action","_bad","_unit","_amountstring","_reasonString","_cop","_tempNum"];
_unit = cursorTarget;
_cop = player;
_exit = false;

detach _unit;
closeDialog 0;

_amountstring = ctrltext 1400;
_reasonString = ctrltext 1401;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
_jaillist =["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"];
_holdinglist = ["1","2","3","4","5"];
if((!(_amountstring in _holdinglist))&&(!(repairJail getVariable ["closed",false])))exitwith{hint "You can not send someone to the main jail while the jail doors are opened"};
if((side _unit) isEqualTo west) exitWith {}; //Not a civ
if(_unit getVariable ["security",false])exitwith{hint "You can not send a security contractor to jail, if they are breaking a major law then they are breaking the rules"};

if(_reasonString == "No reason entered") then
	{
	_reasonString = "An unknown reason";
	};

if!(_amountstring in _jaillist)exitwith{player sidechat "Enter a number between 1 and 30";};

if(_amountstring == "1")then
	{
	_action = [
		"Are you sure you want to send this person to jail for 1 minute?",
		"1 Minute?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)then
		{
		_exit = true;
		};
	};
if(_exit)exitwith{};

if((player getVariable ["security",false])&&(!(_amountstring in _holdinglist)))exitWith
	{
	hint "A security contractor may only jail somebody for small crimes, send this person to the police station for processing instead";
	systemchat "A security contractor may only jail somebody for small crimes, send this person to the police station for processing instead";
	};

if((player getVariable "security")&&((DS_infoArray select 19) == 6))then { [3] call DS_fnc_questCompleted };
if((player getVariable "security")&&((DS_infoArray select 19) == 15))then { [3] call DS_fnc_questCompleted };
if((player getVariable "security")&&((DS_infoArray select 19) == 24))then { [3] call DS_fnc_questCompleted };
if((player getVariable "security")&&((DS_infoArray select 19) == 32))then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};
	
[_unit,_amountstring,_reasonstring,false,_cop] remoteExec ["DS_fnc_jail",_unit];
[2] spawn DS_fnc_alterStats;

if(player getVariable ["security",false])exitWith
	{
	[0,format["%1 has been sent to a holding cell by Security Contractor %2 for %3 minutes, for the crime(s) (%4)",name _unit,name player,_amountString,_reasonString]] remoteExecCall ["DS_fnc_globalMessage",-2];
	_unit setPos (getMarkerPos "jail_marker_holding");
	};

if(_amountstring in _holdinglist) then
	{
	[0,format["%1 has been sent to a holding cell by %2 for %3 minutes, for the crime(s) (%4)",name _unit,name player,_amountString,_reasonString]] remoteExecCall ["DS_fnc_globalMessage",-2];
	_unit setPos (getMarkerPos "jail_marker_holding");
	}
	else
	{
	_unit setPos (getMarkerPos "jail_marker_main");
	[0,format["%1 has been sent to jail by %2 for %3 minutes, for the crime(s) (%4)",name _unit,name player,_amountString,_reasonString]] remoteExecCall ["DS_fnc_globalMessage",-2];
	};

[] call DS_fnc_copUniform;