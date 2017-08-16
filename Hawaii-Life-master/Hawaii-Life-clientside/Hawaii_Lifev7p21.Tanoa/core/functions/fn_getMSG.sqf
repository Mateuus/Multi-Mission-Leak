#include "..\..\script_macros.hpp"
private["_type"];
_msg = [_this,0,"",[""]] call BIS_fnc_param;
_from = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,0,[0]] call BIS_fnc_param;
if(_from isEqualTo "") exitWith {};


switch (_type) do {
	case 0 : {
		private["_message"];
		_back = [_this,3,objNull,[objNull]] call BIS_fnc_param;
		if(!("ItemRadio" in (assignedItems  player))) exitWith {["1",player,6] remoteExecCall ["life_fnc_getMSG",_back];};
		_message = format[">>>NACHRICHT VON %1: %2",_from,_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>Dich<br/><t color='#33CC33'>VON: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

		["TextMessage",[format["Du hast von %1 eine neue Nachricht bekommen",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 1: {
		if(side player != independent) exitWith {};
		private["_message","_loc","_unit"];
		_loc = [_this,3,"",[""]] call BIS_fnc_param;
		_unit = [_this,4,objNull,[objNull]] call BIS_fnc_param;
		_message = format["!!!THW ANFRAGE: %1",_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>THW Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>Alle THWs<br/><t color='#33CC33'>VON: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%3",_from,_loc,_msg];

		["TextMessage",[format["THW Anfrage von %1",_from]]] call bis_fnc_showNotification;
	};

	case 2 : {
		if(side player != west) exitWith {};
		private["_message","_loc","_unit"];
		_loc = [_this,3,"",[""]] call BIS_fnc_param;
		_unit = [_this,4,objNull,[objNull]] call BIS_fnc_param;
		_message = format["---911 MELDUNG VON %1: %2",_from,_msg];
		if(isNil "_loc") then {_loc = "Unknown";};
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Neue Meldung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>VON: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",_from,_loc,_msg];

		["PoliceDispatch",[format["Eine Neue Meldung von: %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 3 : {
		if(FETCH_CONST(life_adminlevel) < 1) exitWith {};
		private["_message","_loc","_unit"];
		_loc = [_this,3,"",[""]] call BIS_fnc_param;
		_unit = [_this,4,objNull,[objNull]] call BIS_fnc_param;
		_message = format["???ADMIN ANFRAGE VON %1: %2",_from,_msg];
		if(isNil "_loc") then {_loc = "Unknown";};
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>Admins<br/><t color='#33CC33'>VON: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%3",_from,_loc,_msg];

		["AdminDispatch",[format["%1 hat einen Admin Angefragt!",_from]]] call bis_fnc_showNotification;
		systemChat _message;
	};

	case 4 : {
		private["_message"];
		_message = format["!!! ADMIN NACHRICHT: %1",_msg];
		_admin = format["Gesendet von: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>You<br/><t color='#33CC33'>VON: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["Du hast eine Adminnachricht bekommen!"]] call bis_fnc_showNotification;
		systemChat _message;
		if(FETCH_CONST(life_adminlevel) > 0) then {systemChat _admin;};
	};

	case 5 : {
		private["_message","_admin"];
		_message = format["!!!ADMIN MESSAGE: %1",_msg];
		_admin = format["Gesendet von: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>AN: <t color='#ffffff'>All Players<br/><t color='#33CC33'>VON: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];

		["AdminMessage",["You Have Received A Message From An Admin!"]] call bis_fnc_showNotification;
		systemChat _message;
		if(FETCH_CONST(life_adminlevel) > 0) then {systemChat _admin;};
	};

	case 6: {
		hint parseText "<t color='#FF0000'>Peep, peep.. Kein Anschluss unter dieser Nummer.</t><br/>Bitte versuchen sie es spaeter erneut!";
	};
};