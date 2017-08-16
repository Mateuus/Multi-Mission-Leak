/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( !hasInterface ) exitWith {};

private [ "_type", "_uid", "_name", "_message", "_location" ];
_type = [ _this, 0, 0, [0] ] call GTA_fnc_param;
_uid = [ _this, 1, "", [""] ] call GTA_fnc_param;
_name = [ _this, 2, "", [""] ] call GTA_fnc_param;
_message = [ _this, 3, "", [""] ] call GTA_fnc_param;
_location = [ _this, 4, [], [[]] ] call GTA_fnc_param;

//--- Push new message
GTA_messaging_messages pushBack [ _type, _uid, _name, time, _message, _location ];

//--- Limit
if ( count GTA_messaging_messages > 30 ) then {

	//--- Delete first
	GTA_messaging_messages deleteAt 0;

};

//--- Show notification
[ switch _type do {

	case 0: { "MessagingMessage" };
	case 1: { "MessagingPoliceDispatch" };
	case 2: { "MessagingNATODispatch" };
	case 3: { "MessagingParamedicDispatch" };
	case 4: { "MessagingHATODispatch" };
	case 5: { "MessagingPSA" };
	case 6: { "MessagingVicinity" };
	case 7: { "MessagingAdminRequest" };
	case 8: { "MessagingAdminAnnouncement" };

}, [ _name ] ] call BIS_fnc_showNotification;

//--- Hint
if ( _type in [ 5, 7, 8 ] ) then {

	[ 1, [ "<t align='left'>From: %1<br /><br />%2</t>", _name, _message ], [ [ _type ] call GTA_fnc_messageTypeName, "#ff8800", 1.5 ] ] call GTA_fnc_broadcast;

};

//--- Event handler
[ missionNamespace, "GTA_messaging_onMessageReceived", [ GTA_messaging_messages ] ] call BIS_fnc_callScriptedEventHandler;
