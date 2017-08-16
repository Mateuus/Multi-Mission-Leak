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

switch(_type) do
{
	case 0:
	{
		//life_smsTarget = call compile format["%1",_playerData];
		ctrlSetText[3933, format["Nachricht an: %1",name life_smsTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[3934,false];
		};
	};
	
	//normal message
	case 1:
	{
		if(isNull life_smsTarget) exitWith {hint "Keinen Kontakt gewählt!"};
		ctrlShow[3932, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[3932, true];};
		[life_smsTarget,_msg,player,0] remoteExecCall ["SOA_fnc_handleMessages",2];
		hint format["Du hast an %1 geschrieben: %2",name life_smsTarget,_msg];	
		ctrlShow[3932, true];
		closeDialog 3930;
		life_battery = life_battery - (round(random 20));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//copmessage
	case 2:
	{
		if((west countside playableUnits) == 0) exitWith {hint "Die Polizei ist derzeit nicht zu erreichen."};
		ctrlShow[3962,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[3962,true];};
		[ObjNull,_msg,player,1] remoteExecCall ["SOA_fnc_handleMessages",2];
		_to = "die Polizei";
		hint format["Du hast an %1 geschrieben: %2",_to,_msg];
		ctrlShow[3962,true];
		closeDialog 3960;
		life_battery = life_battery - (round(random 20));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//msgadmin
	case 3:
	{
		if(({_x getVariable ["supporter",false]} count playableUnits) == 0) exitWith {hint "Es ist kein GameMaster online, versuch es doch mal im Teamspeak. (ts.secretsofaltis.de)"};
		ctrlShow[3962,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[3962,true];};
		[ObjNull,_msg,player,2] remoteExecCall ["SOA_fnc_handleMessages",2];
		_to = "die Admins";
		hint format["Du hast an %1 geschrieben: %2",_to,_msg];
		ctrlShow[3962,true];
		closeDialog 3960;
		life_battery = life_battery - (round(random 30));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//emsrequest
	case 4:
	{
		if((independent countside playableUnits) == 0) exitWith {hint "Zurzeit ist kein AHW-Mitarbeiter im Dienst."};
		ctrlShow[3962,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[3962,true];};
		[ObjNull,_msg,player,3] remoteExecCall ["SOA_fnc_handleMessages",2];
		hint format["Du hast einen Notruf an das Krankenhaus gesendet.",_msg];
		ctrlShow[3962,true];
		closeDialog 3960;
		life_battery = life_battery - (round(random 20));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNull life_smsTarget) exitWith {hint "Keinen Kontakt gewählt!"};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[life_smsTarget,_msg,player,4] remoteExecCall ["SOA_fnc_handleMessages",2];
		hint format["Supportnachricht gesendet an: %1 - Nachricht: %2",name life_smsTarget,_msg];
		closeDialog 3930;
	};
	
	case 6: {};
	
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Supporter!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[ObjNull,_msg,player,5] remoteExecCall ["SOA_fnc_handleMessages",2];
		closeDialog 3960;
	};
	
	//adacrequest
	case 8:
	{
		if((independent countside playableUnits) == 0) exitWith {hint "Zurzeit ist kein AHW-Mitarbeiter im Dienst."};
		ctrlShow[3962,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[3962,true];};
		[ObjNull,_msg,player,6] remoteExecCall ["SOA_fnc_handleMessages",2];
		hint format["Du hast eine Anfrage an das Mechanikzentrum gesendet.",_msg];
		ctrlShow[3962,true];
		closeDialog 3960;
		life_battery = life_battery - (round(random 20));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//copMsgAll
	case 9:
	{
		if((call life_coplevel) < 2) exitWith {hint "Du hast den notwendigen Rang dafür noch nicht!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[ObjNull,_msg,player,7] remoteExecCall ["SOA_fnc_handleMessages",2];
		closeDialog 3960;
		life_battery = life_battery - (round(random 30));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//ADACMsgAll
	case 10:
	{
		if((call life_ahwlevel) < 2) exitWith {hint "Du hast den notwendigen Rang dafür noch nicht!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[ObjNull,_msg,player,9] remoteExecCall ["SOA_fnc_handleMessages",2];
		closeDialog 3960;
		life_battery = life_battery - (round(random 30));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
	
	//SaniMsgAll
	case 11:
	{
		if((call life_ahwLevel) < 2) exitWith {hint "Du hast den notwendigen Rang dafür noch nicht!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[ObjNull,_msg,player,10] remoteExecCall ["SOA_fnc_handleMessages",2];
		closeDialog 3960;
		life_battery = life_battery - (round(random 30));
		if(life_battery < 0) then {life_battery = 0};
		[] call life_fnc_hudUpdate;
	};
};
