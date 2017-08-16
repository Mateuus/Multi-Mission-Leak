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

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		lhm_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Message to: %1",name lhm_smartphoneTarget]];
		if((__GETC__(lhm_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll lhm_smartphoneTarget) exitWith {hint format["Keine Person ausgwaehlt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";ctrlShow[88885, true];};
		[[lhm_smartphoneTarget,_msg,player,0],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		hint format["Du hast %1 eine Nachricht gesendet: %2",name lhm_smartphoneTarget,_msg];
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es spaeter nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		_to = "The Police";
		hint format["Du hast %1 eine Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		_to = "The Admins";
		hint format["Du hast %1 eine Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es spaeter nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		hint format["Du hast eine Nachricht an alle Mediziner gesendet.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call lhm_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL lhm_smartphoneTarget) exitWith {hint format["Keine Person ausgwaehlt!"];};
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";};
		[[lhm_smartphoneTarget,_msg,player,4],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		hint format["Admin Nachricht gesendet an: %1 - Message: %2",name lhm_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(lhm_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call lhm_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";};
		[[1,(_msg)],'lhm_fnc_centerMsg',true] call lhm_fnc_mp; //Admin Msg centriert
		//[[ObjNull,_msg,player,5],"lhm_fnc_handleMessages",false] call lhm_fnc_mp; alte Admin Msg
		hint format["Admin Nachricht an alle: %1",_msg];
		closeDialog 887890;
	};
	//SecReq
	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Security Mitglied im Dienst. Bitte probiere es spaeter nochmal."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Um etwas zu senden musst du eine Nachricht eingeben!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,6],"lhm_fnc_handleMessages",false] call lhm_fnc_mp;
		hint format["Du hast eine Nachricht an alle Security Agents gesendet.",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};

};