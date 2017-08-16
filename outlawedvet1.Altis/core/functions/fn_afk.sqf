#include "..\..\script_macros.hpp"
/*
	File: fn_afk.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	
	Description:
	Makes the AFK people go bye bye to the lobby!
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/

private ["_NewTime","_OldTime","_IsAFK","_markerstrnew","_markerstrold"];
_NewTime = [0,0,0];
_OldTime = getPos player;
_IsAFK = false;
if (FETCH_CONST(life_adminlevel) isequalto 5) exitWith {};


while {true} do {
	uiSleep (4*60);
	_NewTime = getPos player;
			if ((_NewTime select 0 == _OldTime select 0) && (_NewTime select 1 == _OldTime select 1)) then {
				if (_IsAFK) then {
				[] call SOCK_fnc_updatePartial;
				uiSleep 5;
				["AFK",false,true] call BIS_fnc_endMission;
				} else {
				_IsAFK = true;
				hint "You will be kicked in 4 minutes for being AFK.";
				hint parseText format["<t color='#ff0000'><t align='center'><t size='1'>AFK WARNING<br/><br/></t><t color='#FFFFFF'>You will be kicked in:</t><br/><br/><t color='#FF0000'>4 </t><t color='#FFFFFF'>minutes!</t>"];
				};
				} else {
					_IsAFK = false;
			};
		_OldTime = _NewTime;
};

//Only applicable for Cops
/*
while {true} do {
			uiSleep (3*60);
			_markerstrold = createMarkerLocal ["afkposition",_OldTime];
			_NewTime = getPos player;
			_markerstrnew = createMarkerLocal ["afkpositionnew",_NewTime];

			if (((getMarkerPos "afkpositionnew") distance (getMarkerPos "afkposition")) < 2.1) then {
				if (_IsAFK) then {
				["AFK",false,true] call BIS_fnc_endMission;
				} else {
				_IsAFK = true;
				hint "You will be kicked in 3 minutes for being AFK!";
				hint parseText format["<t color='#ff0000'><t align='center'><t size='1'>AFK WARNING<br/><br/></t><t color='#FFFFFF'>You will be kicked in:</t><br/><br/><t color='#FF0000'>3 </t><t color='#FFFFFF'>minutes!</t>"];
				};
				} else {
					_IsAFK = false;
					};
					_OldTime = _NewTime;
};*/

