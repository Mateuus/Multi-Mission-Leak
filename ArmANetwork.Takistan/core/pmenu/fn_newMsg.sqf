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
		life_smartphoneTarget = call compile format["%1",_playerData];
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Player not selected!"];};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[life_smartphoneTarget,_msg,player,0] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["You sent a message to %1 : %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//TSF Message
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["TSF Units aren't available at the moment. Try again later."];};
		if(_msg == "") exitWith {hint "No message to be sent";};
		_msg = format["%1 - Coordinates %2", _msg, mapGridPosition player];
		[ObjNull,_msg,player,1] remoteExecCall ["TON_fnc_handleMessages",2];
		_to = "TSF";
		hint format["You sent a message to %1 : %2",_to,_msg];
		closeDialog 887890;
	};
	//UN Message
	case 3:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["UN Forces aren't available at the moment. Try again later."];};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		_msg = format["%1 - Coordinates %2", _msg, mapGridPosition player];
		[ObjNull,_msg,player,2] remoteExecCall ["TON_fnc_handleMessages",2];
		_to = "UN Forces";
		hint format["You sent a message to %1 : %2",_to,_msg];
		closeDialog 887890;
	};
	//EMS Request
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["No EMS respondant is available at the moment. Try again later."];};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[ObjNull,_msg,player,3] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["You sent a message to the EMS.",_msg];
		closeDialog 887890;
	};
	//Mechanic Request
	case 5:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["No TAR respondant is available at the moment. Try again later."];};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[ObjNull,_msg,player,4] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["You sent a message to the Takistan Auto Repairs.",_msg];
		closeDialog 887890;
	};
	//Menu Permissions (DO NOT TOUCH)
	case 6:
	{
		if((call life_adminlevel) < 1) then {
			ctrlShow[12011,false];//AdminRequestOverlay
			ctrlShow[1204,false];//ServerMessageIcon
			ctrlShow[2406,false];//ServerMessageButton
		} else {
			ctrlShow[2405,false];//RequestAdminButton
			ctrlShow[1201,false];//AdminRequestIcon
			ctrlShow[12041,false];//ServerMessageOverlay
		};

		switch(playerSide) do {
			case west: {
				ctrlShow[2402,false];//UNMessage
				ctrlShow[2401,false];//TSFMessage
				ctrlShow[1205,false];//TSFMessageButton
				ctrlShow[1206,false];//UNMessageButton
				ctrlShow[12031,false];//MechanicOverlay
				ctrlShow[12021,false];//EMSRequestOverlay

				if((call life_coplevel) == 5) then {
					ctrlShow[12071,false];//TSFAnnouncementOverlay
				} else {
					ctrlShow [1207,false];//TSFAnnouncementIcon
					ctrlShow [2407,false];//TSFAnnouncement
				};
				if ((call life_coplevel) == 10) then {
					ctrlShow[12081,false];//UNAnnouncementOverlay
				}else{
					ctrlShow [1208,false];//UNAnnouncementIcon
					ctrlShow [2408,false];//UNAnnouncementButton
				};
			};
			case independent: {
				ctrlShow [1202,false];//EMSRequest
				ctrlShow [2403,false];//EMSRequestButton
				ctrlShow[12031,false];//MechanicOverlay
			};
			case civilian: {
				ctrlShow[12061,false];//TextUNOverlay
				ctrlShow[12051,false];//TextTSFOverlay
				ctrlShow[1207,false];//TSFAnnouncement
				ctrlShow[1208,false];//UNAnnouncement
				ctrlShow[2407,false];//TSFAnnouncement
				ctrlShow[2408,false];//UNAnnouncement
				ctrlShow[12031,false];//MechanicOverlay
				ctrlShow[12021,false];//EMSRequestOverlay
			};
		};
	};
	//To Admins
	case 7:
	{
			if(_msg == "") exitWith {hint "No message to be sent.";};
			_msg = format["%1 - Coordinates %2", _msg, mapGridPosition player ];
			[objNull, _msg, player,5] remoteExecCall ["TON_fnc_handleMessages",2];
			_to = "Server Admins";
			hint format["You sent a message to %1: %2",_to,_msg];
			closeDialog 887890;
	};
	//Admin Server Message
	case 8:
	{
		if((call life_adminlevel) < 1) exitWith {hint "You are not an admin!";};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[ObjNull,_msg,player,6] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["Admin Server Message : %1",_msg];
		closeDialog 887890;
	};
	//TSF Server Announcement
	case 9:
	{
		if((call life_coplevel) != 5) exitWith {hint "You are not TSF Command!";};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[ObjNull,_msg,player,7] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["TSF Announcement: %1",_msg];
		closeDialog 887890;
	};
	//UN Server Announcement
	case 10:
	{
		if((call life_coplevel) != 10) exitWith {hint "You are not UN Command!";};
		if(_msg == "") exitWith {hint "No message to be sent.";};
		[ObjNull,_msg,player,8] remoteExecCall ["TON_fnc_handleMessages",2];
		hint format["UN Forces Announcement: %1",_msg];
		closeDialog 887890;
	};
};
