#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt die Admin-Zuschauen-Funktion!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

if(__GETC__(life_adminlevel < 3)) then {
	createDialog "checkAdmin";
	WaitUntil{isnull (finddisplay 8600)};
};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

_unit switchCamera cameraView;
[name player, format["schaut jetzt %1 zu!",name _unit],call life_adminlevel,7,"",admingrund] remoteExecCall ["life_fnc_logdat",2];
hint format["Du schaust jetzt %1 zu \n\n Drücke F10 um aufzuhören.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Du hast aufgehört zuzuschauen';};false"];