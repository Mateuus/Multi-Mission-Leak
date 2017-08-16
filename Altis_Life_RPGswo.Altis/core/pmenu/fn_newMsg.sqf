#include "..\..\macros.hpp"
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
		DWEV_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",getPlayerDName(DWEV_smartphoneTarget)]];
		if((__GETC__(DWEV_adminlevel) < 2)) then //Ab S
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll DWEV_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";ctrlShow[88885, true];};

		[DWEV_smartphoneTarget,_msg,player,0] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		hint format["Du hast %1 eine Nachricht geschickt: %2",getPlayerDName(DWEV_smartphoneTarget),_msg];
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";ctrlShow[888895,true];};


		[ObjNull,_msg,player,1] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];


		_to = "An die Polizei";
		hint format["Du hast %1 eine Nachricht geschickt: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";ctrlShow[888896,true];};

		[ObjNull,_msg,player,2] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];



		_to = "An die Admins";
		hint format["Du hast %1 eine Nachricht geschickt: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";ctrlShow[888899,true];};

		[ObjNull,_msg,player,3] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];


		_to = "An die Feuerwehr";
		hint format["Du hast %1 eine Nachricht geschickt: %2",_to,_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
		[] spawn
				{
				player setVariable ["needMedic",true,true];
				sleep 300;
				player setVariable ["needMedic",nil,true];
				};
	};

	//adminToPerson
	case 5:
	{
		if((call DWEV_adminlevel) < 2) exitWith {hint "Du bist kein Admin!";}; //Ab S
		if(isNULL DWEV_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};

		[DWEV_smartphoneTarget,_msg,player,4] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];


		hint format["Admin Nachricht gesendet an: %1 - Nachricht: %2",getPlayerDName(DWEV_smartphoneTarget),_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(DWEV_adminlevel) < 2)) then //Ab S
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};

		if((__GETC__(DWEV_adminlevel) < 1)) then //Ab E
		{
			ctrlShow[888901,false];
		} else {
			ctrlShow[888901,true];
		};

		if((__GETC__(DWEV_coplevel) < 5)) then
		{
			ctrlShow[888893,false];
			ctrlShow[888895,true];
		} else {
			ctrlShow[888893,true];
			ctrlShow[888895,false];
		};
		if((__GETC__(DWEV_mediclevel) < 7)) then
		{
			ctrlShow[888891,false];
			ctrlShow[888899,true];
		} else {
			ctrlShow[888891,true];
			ctrlShow[888899,false];
		};
		if((__GETC__(DWEV_opforlevel) < 2)) then
		{
			ctrlShow[888889,false];
			ctrlShow[888890,true];
		} else {
			ctrlShow[888889,true];
			ctrlShow[888890,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call DWEV_adminlevel) < 2) exitWith {hint "Du bist kein Admin!";}; //Ab S
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};

		[ObjNull,_msg,player,5] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];



		hint format["Admin Nachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};
	//feuerwehrMsgAll
	case 8:
	{
		if((call DWEV_mediclevel) < 7) exitWith {hint "Du musst min. Hauptfeuerwehrmann sein!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};

		[ObjNull,_msg,player,6] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		hint format["Feuerwehr Nachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};
	//polzeiMsgAll
	case 9:
	{
		if((call DWEV_coplevel) < 5) exitWith {hint "Du musst min. Kommissar sein!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};

		[ObjNull,_msg,player,7] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		hint format["Polizei Nachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};

	//sicherheitsdienst
	case 10:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Sicherheitsbeamter im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888890,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";ctrlShow[888890,true];};

		[ObjNull,_msg,player,8] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		_to = "An den Sicherheitsdienst";
		hint format["Du hast %1 eine Nachricht geschickt: %2",_to,_msg];
		ctrlShow[888890,true];
		closeDialog 887890;
		[] spawn
		{
			player setVariable ["needOpfor",true,true];
			sleep 300;
			player setVariable ["needOpfor",nil,true];
		};
	};

	//opforMsgAll
	case 11:
	{
		if((call DWEV_opforlevel) < 2) exitWith {hint "Du bist keine Leitung!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};

		[ObjNull,_msg,player,10] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

		hint format["Sicherheitsdienst Nachricht gesendet an alle: %1",_msg];
		closeDialog 887890;
	};

	//EventMsgAll
	case 12:
	{
		if((call DWEV_adminlevel) < 1) exitWith { hint "Du hast dazu keine Berechtigung!";}; //Ab E
		if(_msg == "") exitWith {hint "Du musst eine Nachricht schreiben, die du senden möchtes!";};	
			[ObjNull,_msg,player,11] remoteExec ["GHB_fnc_handleMessages",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
			hint format["Event-Nachricht gesendet an alle: %1",_msg];	
		closeDialog 887890;
	};
};
