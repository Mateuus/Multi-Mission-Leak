#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";ctrlShow[88885, true];};
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Du hast %1 folgende Nachricht gesendet: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";ctrlShow[888895,true];};
		[ObjNull,_msg,player,1] remoteExec ["TEX_fnc_handleMessages", 2];
		_to = "Die Polizei";
		hint format["Du hast der Polizei folgende Nachricht gesendet: %1",_msg];
		[player, ObjNull, 1, "[911CALL]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";ctrlShow[888896,true];};
		[ObjNull,_msg,player,2] remoteExec ["TEX_fnc_handleMessages", 2];
		_to = "Die Admins";
		hint format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
		[player, ObjNull, 1, "[PLAYER-TO-ADMIN]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";ctrlShow[888899,true];};
		[ObjNull,_msg,player,3] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Du hast den Sanitätern folgende Nachricht gesendet: %1",_msg];
		[player, ObjNull, 1, "[EMS-REQUEST]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";};
		[life_smartphoneTarget,_msg,player,4] remoteExec ["TEX_fnc_handleMessages", 2];
		[player, life_smartphoneTarget, 3, "[ADMIN-TO-PLAYER]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		hint format["Admin Nachricht an: %1 - Nachricht: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
		
		if((__GETC__(life_coplevel)) < 1) then
		{
			ctrlEnable[888905,false];	//CopToAll
			ctrlShow[888905,false];		//CopToAll
			ctrlEnable[888895,true];	//CopRequest
		} else {
			ctrlEnable[888905,true];	//CopToAll
			ctrlEnable[888895,false];	//CopRequest
			ctrlShow[888895,false];		//CopRequest
		};
		
		if((__GETC__(life_adaclevel)) < 1) then
		{
			ctrlEnable[888994,false];	//CopToAll
			ctrlShow[888994,false];	//ImpTOALL
			ctrlEnable[888900,true];	//ImpRequest
			ctrlShow[888900,true];		//ImpRequest
		} else {
			ctrlEnable[888994,true];	//CopToAll
			ctrlShow[888994,true];	//ImpTOALL
			ctrlEnable[888900,false];	//ImpRequest
			ctrlShow[888900,false];		//ImpRequest
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";};
		[ObjNull,_msg,player,5] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Admin Nachricht an Alle gesendet: %1",_msg];
		[player, ObjNull, 1, "[ADMIN-BROADCAST]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		closeDialog 887890;
	};

	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Imperialist verfuegbar. Bitte versuche es Spaeter noch einmal!"];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";ctrlShow[888900,true];};
		[ObjNull,_msg,player,6] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Notruf an das Imperium: %1",_msg];
		[player, ObjNull, 1, "[IMPCALL]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
	//PoliceMsgAll
	case 9:
	{
		if((call life_coplevel) < 1) exitWith {hint "Du bist kein Polizist!";};
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";};
		[ObjNull,_msg,player,7] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Polizei Nachricht an die Bevölkerung: %1",_msg];
		[player, ObjNull, 1, "[COP-BROADCAST]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		closeDialog 887890;
	};
	//ImperiumMsgAll
	case 10:
	{
		if((call life_adaclevel) < 1) exitWith {hint "Du bist kein Imperialist!";};
		if(_msg == "") exitWith {hint "Eine Nachricht eingeben zum Senden!";};
		[ObjNull,_msg,player,8] remoteExec ["TEX_fnc_handleMessages", 2];
		hint format["Imperiums Nachricht an die Bevölkerung: %1",_msg];
		[player, ObjNull, 1, "[IMP-BROADCAST]", _msg] remoteExec ["TEX_FNC_LOGIT", 2];
		closeDialog 887890;
	};
};