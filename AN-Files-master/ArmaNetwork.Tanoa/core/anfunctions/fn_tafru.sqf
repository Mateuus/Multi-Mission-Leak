#include <macro.h>
/*

	file: fn_newMsg.sqf
	Author: Silex

*/

private["_to","_type","_playerData","_msg"];
disableSerialization;
_type = param [0,-1];
_playerData = param [1,-1];
_msg = param [2,"",[""]];
if([":",_msg] call BIS_fnc_inString) exitWith {hintSilent "A bad character was found"};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
	};
	//normal message
	case 1:
	{
		if(isNull life_smartphoneTarget) exitWith {hintSilent format["Either player wasn't selected or Player isn't online!"];};
		if(isNil "life_smartphoneTarget") exitWith {hintSilent format["Either player wasn't selected or Player isn't online!"];};
		if(_msg isEqualTo "") exitWith {hint "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};
		[life_smartphoneTarget,_msg,player,0] remoteExecCall ["TON_fnc_handleMessages",2];
		hintSilent format["You sent a message to %1 : %2",name life_smartphoneTarget,_msg];
		closeDialog 0;
	};
	//Police Message
	case 2:
	{
		if(({side _x isEqualTo west} count playableUnits) isEqualTo 0) exitWith {hintSilent format["TSO isn't available at the moment. Try again later."];};
		if(_msg isEqualTo "") exitWith {hintSilent "No message to be sent.";};
		_msg = format["%1", _msg];
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};
		[ObjNull,_msg,player,1] remoteExecCall ["TON_fnc_handleMessages",2];
		_to = "Tanoa Police Dept";
		hintSilent format["You sent a message to %1 : %2",_to,_msg];
		closeDialog 0;
	};
	//EMS Request
	case 3:
	{
		if(({side _x isEqualTo independent} count playableUnits) isEqualTo 0) exitWith {hint format["No EMS respondant is available at the moment. Try again later."];};
		if(_msg isEqualTo "") exitWith {hint "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hint "The maximum character limit for a message is 150."};
		[ObjNull,_msg,player,2] remoteExecCall ["TON_fnc_handleMessages",2];
		hintSilent format["You sent a message to the EMS.",_msg];
		closeDialog 0;
	};
	//Mechanic Request
	case 4:
	{
		if(({side _x isEqualTo east} count playableUnits) isEqualTo 0) exitWith {hint format["No Mechanic is available at the moment. Try again later."];};
		if(_msg isEqualTo "") exitWith {hint "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hint "The maximum character limit for a message is 150."};
		[ObjNull,_msg,player,3] remoteExecCall ["TON_fnc_handleMessages",2];
		hintSilent format["You sent a message to the Mechanic Auto Repairs.",_msg];
		closeDialog 0;
	};
	//Menu Permissions (DO NOT TOUCH)
	case 5:
	{
		if((call life_adminlevel) < 1) then {
			ctrlShow[2405,false];
		} else {
			ctrlShow[2403,false];
		};
		ctrlEnable[2402,false];
		switch(playerSide) do {
			case west: {
				ctrlShow[2400,false];
				if ((call life_coplevel) < 9) then {
					ctrlShow[2406,false];
				};
			};
			case independent: {
				ctrlShow[2401,false];
				ctrlShow[2406,false];
			};
			case civilian: {
				ctrlShow[2406,false];
			};
		};
	};
	//To Admins
	case 6:
	{
		if(_msg isEqualTo "") exitWith {hintSilent "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {closeDialog 0; hintSilent "The maximum character limit for a message is 150."};
		_msg = format["%1 - Coordinates %2", _msg, mapGridPosition player ];
		[objNull, _msg, player,4] remoteExecCall ["TON_fnc_handleMessages",2];
		hintSilent "You sent a Message to the Admins!";
		closeDialog 0;
	};
	//Admin Server Message
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hintSilent "You are not an admin!";};
		if(_msg isEqualTo "") exitWith {hintSilent "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};
		[ObjNull,_msg,player,5] remoteExecCall ["TON_fnc_handleMessages",2];
		closeDialog 0;
	};
	//Police Message
	case 8:
	{
		if((call life_coplevel) < 5) exitWith {hintSilent "You are not Police Command!";};
		if(_msg isEqualTo "") exitWith {hintSilent "No message to be sent.";};
		_len = [_msg] call KRON_StrLen;
		if(_len > 150) exitWith {hintSilent "The maximum character limit for a message is 150."};
		[ObjNull,_msg,player,6] remoteExecCall ["TON_fnc_handleMessages",2];
		closeDialog 0;
	};
};
