#include <macro.h>
/*

	file: fn_newMsg.sqf
	Author: Silex

*/

private["_to","_type","_playerData","_msg","_providerIdx","_msgCosts","_targetProviderIdx","_transmissionStatusMsg"];
disableSerialization;

if(!("ItemRadio" in (assignedItems  player))) exitWith {hint "Du besitzt kein Handy!"; closeDialog 0;};

if((FETCH_CONST(life_adminlevel) < 1)) then
{
	ctrlShow[20211,false];
	ctrlShow[888897,false];
};

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
		ctrlSetText[88886, format["Nachricht an: %1",life_smartphoneTarget getVariable["realname",name life_smartphoneTarget]]];
		if((FETCH_CONST(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
			ctrlShow[20211,false];
		};
		if(!(life_hsd == "thw")) then {
			ctrlShow[888891,false];
			ctrlShow[20212,false];
		};
	};
	// normal message
	case 1:
	{
        if(!([] call PG_fnc_providerNetworkAvailable)) exitWith {hint "Nachricht konnte nicht versendet werden - Du hast keinen Empfang!";};
		if(isNull life_smartphoneTarget) exitWith {hint format["Keine Person ausgewählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[88885, true];};

        // money first
		if(!([] call PG_fnc_providerAvailable)) exitWith {
		    // provider is not available, should never happen here
            // because the calling dialog is not usable when no provider is available
		    hint "Fehler im System, bitte kontaktiere den Support";
		};

        // provider is already checked, so the next two statements should be safe
        _providerIdx = [player getVariable["mobile_provider", ""], PGSERV_mobile_providers] call TON_fnc_index;
        _targetProviderIdx = [life_smartphoneTarget getVariable["mobile_provider", ""], PGSERV_mobile_providers] call TON_fnc_index;

        _msgCosts = 0;
        _transmissionStatusMsg = "Übertragung der SMS an %1 für %2€: %3";

        if (_providerIdx == _targetProviderIdx) then {
            _transmissionStatusMsg = "Da %1 das gleiche Mobilfunknetz nutzt ist die Übertragung der folgenden SMS kostenlos: %3";
        } else {
        	_msgCosts = (PGSERV_mobile_providers select _providerIdx) select 9;

            //diag_log format["DEBUG: _msgCosts = %1", _msgCosts];

		    if (_msgCosts > 0) then {
		        if (BANK < _msgCosts) exitWith {
		            hint format["Du hast keine %1€ um eine SMS zu verschicken!",[_msgCosts] call life_fnc_numberText];
		        };

		        SUB(BANK, _msgCosts);
				[1] call SOCK_fnc_updatePartial;
		    };
        };

        _failChance = round(random 100);
        _failChanceProvider = (PGSERV_mobile_providers select _providerIdx) select 8;

        if (_failChance < _failChanceProvider) then
        {
            _transmissionStatusMsg = "Übertragung der SMS an %1 für %2€ fehlgeschlagen: %3";
        }
        else
        {
	        [[life_smartphoneTarget,_msg,player,0],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
        };

	    hint format[_transmissionStatusMsg, life_smartphoneTarget getVariable["realname",name life_smartphoneTarget], [_msgCosts] call life_fnc_numberText, _msg];

        ctrlShow[88885, true];
		closeDialog 88883;
	};
	// message to cops
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Notruf an die Polizei: %1",_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	// player to admin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888896,true];};
		_msg = format["%1 Melder-Position: %2",_msg,mapGridPosition player];
		[[ObjNull,_msg,player,2],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["An Administration gesendet: %1",_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	// message to medics
	case 4:
	{
		_hsd = [];
		{if (_x getVariable ["hsd","thw"] in ["med","thw"]) then {_hsd pushBack _x;};} forEach playableUnits;

		if((count _hsd) == 0) exitWith {hint format["Zurzeit ist niemand vom Hilfsdienst erreichbar. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888899,true];};
		_msg = format["%1 Melder-Position: %2",_msg,mapGridPosition player];
		{if(!isNil "_x") then {_handle = ([[_msg,player getVariable["realname",name player],getPlayerUID player,5],"PG_fnc_receiveMessage",_x,false] spawn life_fnc_MP); waitUntil {scriptDone _handle};};} forEach [PG_groupMedic,PG_groupTHW];
		hint format["Nachricht an den Hilfsdienst gesendet: %1",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	// admin to player
	case 5:
	{
		if(FETCH_CONST(life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[[life_smartphoneTarget,_msg,player,4],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Nachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	// NOT MESSAGE HANDLING: emergencyloading
	case 6:
	{
        if(!([] call PG_fnc_providerNetworkAvailable)) then {hint "Obwohl du keinen Empfang hast ist es möglich einen Notruf abzusetzen.";};

		if((FETCH_CONST(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};

		if(playerSide == west) then
		{
			ctrlShow[888895,false];
			ctrlShow[888901,true];
		} else {
			ctrlShow[888895,true];
			ctrlShow[888901,false];
		};
		
		if(life_hsd == "event") then {
			ctrlShow[888893,false];
			ctrlShow[888892,true];
		} else {
			ctrlShow[888893,true];
			ctrlShow[888892,false];
		};
	};
	// admin to all
	case 7:
	{
		if(FETCH_CONST(life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[[ObjNull,_msg,player,5],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Admin Nachricht an alle: %1",_msg];
		closeDialog 887890;
	};
	// message to ASF
	case 8:
	{
        if(!([] call PG_fnc_providerNetworkAvailable)) exitWith {hint "Nachricht konnte nicht versendet werden - Du hast keinen Empfang!";};
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist niemand der ASF im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888900,true];};
		[[ObjNull,_msg,player,6],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Nachricht an ASF gesendet: %1",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
    // cops to all
	case 9:
	{
		if(FETCH_CONST(life_coplevel) < 1) exitWith {hint "Du bist kein Polizist!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[[ObjNull,_msg,player,7],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Polizei Nachricht an alle: %1",_msg];
		closeDialog 887890;
	};
	// message to Taxi
	case 10:
	{
        if(!([] call PG_fnc_providerNetworkAvailable)) exitWith {hint "Nachricht konnte nicht versendet werden - Du hast keinen Empfang!";};

		_fahrer = [];
		{if (_x getVariable ["Taxi",false]) then {_fahrer pushBack _x;};} forEach playableUnits;

		if((count _fahrer) == 0) exitWith {hint format["Zurzeit ist niemand vom Taxi-Unternehmen im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888900,true];};

		{_handle = ([[_msg,player getVariable["realname",name player],getPlayerUID player,9],"PG_fnc_receiveMessage",_x,false] spawn life_fnc_MP); waitUntil {scriptDone _handle};} forEach _fahrer;

		hint format["Nachricht an das Taxi-Unternehmen gesendet: %1",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};

	// message to alac
	case 11:
	{
		_hsd = [];
		{if (_x getVariable ["hsd","thw"] in ["alac","thw"]) then {_hsd pushBack _x;};} forEach playableUnits;

		if((count _hsd) == 0) exitWith {hint format["Zurzeit ist niemand vom Hilfsdienst erreichbar. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888899,true];};
		_msg = format["%1 Melder-Position: %2",_msg,mapGridPosition player];
		{if(!isNil "_x") then {_handle = ([[_msg,player getVariable["realname",name player],getPlayerUID player,5],"PG_fnc_receiveMessage",_x,false] spawn life_fnc_MP); waitUntil {scriptDone _handle};};} forEach [PG_groupAlac,PG_groupTHW];
		hint format["Nachricht an den Hilfsdienst gesendet: %1",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	// message to event Team
	case 12:
	{
		_event = [];
		{if (_x getVariable ["hsd","event"] in ["event"]) then {_event pushBack _x;};} forEach playableUnits;

		if((count _event) == 0) exitWith {hint format["Zurzeit ist niemand vom Event Team erreichbar. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";ctrlShow[888899,true];};
		{if(!isNil "_x") then {_handle = ([[_msg,player getVariable["realname",name player],getPlayerUID player,10],"PG_fnc_receiveMessage",_x,false] spawn life_fnc_MP); waitUntil {scriptDone _handle};};} forEach [PG_groupEvent];
		hint format["Nachricht an das Event Team gesendet: %1",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
    // event to all
	case 13:
	{
		if(FETCH_CONST(life_eventlevel) < 1) exitWith {hint "Du bist nicht im Event Team!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[[ObjNull,_msg,player,8],"PGSERV_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Event Nachricht an alle: %1",_msg];
		closeDialog 887890;
	};
};