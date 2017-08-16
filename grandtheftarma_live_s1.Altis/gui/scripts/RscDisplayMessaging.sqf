/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"

private [ "_mode", "_params" ];
_mode = _this select 0;
_params = _this select 1;

switch _mode do {

	case "onLoad": {

		//--- Define variables
		GTA_RscDisplayMessaging_messageData = [];
		GTA_RscDisplayMessaging_composeType = [ -1, [] ];

		//--- Controls
		_display = _params select 0;

		//--- Event handlers
		GTA_RscDisplayMessaging_messageReceivedHndl = [ missionNamespace, "GTA_messaging_onMessageReceived", { [ "onMessageReceived", [] ] call GTA_RscDisplayMessaging_script } ] call BIS_fnc_addScriptedEventHandler;

		//--- Control GroupMessage
		_ctrlGroupMessage = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPMESSAGE;
		_ctrlGroupMessage ctrlShow true;

		//--- Control GroupCompose
		_ctrlGroupCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPCOMPOSE;
		_ctrlGroupCompose ctrlShow false;

		//--- Control ListInbox
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;
		_ctrlListInbox ctrlAddEventHandler [ "LBSelChanged",  { [ "onSelChangedInbox", _this ] call GTA_RscDisplayMessaging_script } ];

		//--- Control EditCompose
		_ctrlEditCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;
		_ctrlEditCompose ctrlAddEventHandler [ "KeyDown",  { [ "onKeyDownCompose", _this ] call GTA_RscDisplayMessaging_script } ];
		_ctrlEditCompose ctrlAddEventHandler [ "KeyUp",  { [ "onKeyDownCompose", _this ] call GTA_RscDisplayMessaging_script } ];
		_ctrlEditCompose ctrlAddEventHandler [ "SetFocus",  { [ "onComposeSetFocus", _this ] call GTA_RscDisplayMessaging_script; } ];
		_ctrlEditCompose ctrlAddEventHandler [ "KillFocus",  { [ "onComposeKillFocus", _this ] call GTA_RscDisplayMessaging_script; } ];

		//--- Control ButtonReply
		_ctrlButtonReply = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONREPLY;
		_ctrlButtonReply ctrlAddEventHandler [ "ButtonClick",  { [ "onClickReply", _this ] call GTA_RscDisplayMessaging_script } ];
		_ctrlButtonReply ctrlEnable false;

		//--- Control ButtonNew
		_ctrlButtonNew = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONNEW;
		_ctrlButtonNew ctrlAddEventHandler [ "ButtonClick",  { [ "onClickNew", _this ] call GTA_RscDisplayMessaging_script } ];

		//--- Control ButtonDiscard
		_ctrlButtonDiscard = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONDISCARD;
		_ctrlButtonDiscard ctrlAddEventHandler [ "ButtonClick",  { [ "onClickDiscard", _this ] call GTA_RscDisplayMessaging_script } ];

		//--- Control ButtonSend
		_ctrlButtonSend = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONSEND;
		_ctrlButtonSend ctrlAddEventHandler [ "ButtonClick",  { [ "onClickSend", _this ] call GTA_RscDisplayMessaging_script } ];

		//--- Refresh inbox
		[ "refreshInbox", [ _display ] ] call GTA_RscDisplayMessaging_script;

	};

	case "onUnload": {

		//--- Remove event handlers
		[ missionNamespace, "GTA_messaging_onMessageReceived", GTA_RscDisplayMessaging_messageReceivedHndl ] call BIS_fnc_removeScriptedEventHandler;

		//--- Dispose
		GTA_RscDisplayMessaging_messageData = [];
		GTA_RscDisplayMessaging_composeType = nil;

	};

	case "onSelChangedInbox": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;
		_ctrlValueFrom = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUEFROM;
		_ctrlValueDate = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUEDATE;
		_ctrlValueLocation = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUELOCATION;
		_ctrlTextMessage = _display displayCtrl IDC_RSCDISPLAYMESSAGING_TEXTMESSAGE;
		_ctrlButtonReply = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONREPLY;

		//--- Vars
		_index = _params select 1;
		_data = _ctrlListInbox lbData _index;
		_months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];

		//--- Convert data string to array
		_data = call compile _data;
		_type = _data select 0;
		_name = _data select 2;
		_time = _data select 3;
		_message = _data select 4;
		_location = _data select 5;

		//--- Set global data variable
		GTA_RscDisplayMessaging_messageData = _data;

		//--- Location
		_location = if ( count _location > 0 ) then {

			format [ "Grid %1 - %2", mapGridPosition _location, _location call GTA_fnc_locationDescription ]

		} else { "Location unavailable" };

		//--- Display message
		_ctrlValueFrom ctrlSetText _name;
		_ctrlValueDate ctrlSetText (["timeToHMS", [time - _time]] call GTA_RscDisplayMessaging_script);
		_ctrlValueLocation ctrlSetText _location;
		_ctrlTextMessage ctrlSetText _message;

		//--- Enable/disable reply
		_ctrlButtonReply ctrlEnable ( _type in [ 0, 1, 2, 3, 4, 7 ] && { _data select 1 != "" } );

	};

	case "onMessageReceived": {

		disableSerialization;

		//--- Get display
		_display = [ "GTA_RscDisplayMessaging" ] call GTA_fnc_getDisplay;

		//--- Exit if display does not exist
		if ( isNull _display ) exitWith {};

		//--- Refresh inbox
		[ "refreshInbox", [ _display ] ] call GTA_RscDisplayMessaging_script;

	};

	case "onClickReply": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;

		//--- Vars
		_data = GTA_RscDisplayMessaging_messageData;
		_uid = _data select 1;
		_unit = [ _uid ] call GTA_fnc_unitByUID;

		//--- Error check
		if ( isNull _unit ) exitWith { hint "Player no longer exists" };

		//--- Compose message
		[ "composeMessage", [ _display, [ 0, [ _unit ] ] ] ] call GTA_RscDisplayMessaging_script;

	};

	case "onClickNew": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );
		_ctrlGroupMessage = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPMESSAGE;
		_ctrlGroupCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPCOMPOSE;

		[ _display ] spawn {

			disableSerialization;

			_display = _this select 0;

			//--- Select type
			_type = [] call GTA_fnc_selectMessageType;

			//--- Compose
			if ( _type select 0 != -1 ) then {

				//--- Error checks (params)
				if ( _type select 0 == 0 && { isNull ( ( _type select 1 ) select 0 ) } ) exitWith { hint "No player selected" };

				//--- Compose message
				[ "composeMessage", [ _display, _type ] ] call GTA_RscDisplayMessaging_script;

			};

		};

	};

	case "onClickDiscard": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );

		//--- Dispose global type variable
		GTA_RscDisplayMessaging_composeType = nil;

		//--- Show message panel
		[ "showMessagePanel", [ _display ] ] call GTA_RscDisplayMessaging_script;

	};

	case "onClickSend": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );
		_ctrlCheckLocation = _display displayCtrl IDC_RSCDISPLAYMESSAGING_CHECKLOCATION;
		_ctrlEditCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;

		//--- Vars
		_type = +GTA_RscDisplayMessaging_composeType;
		_message = ctrlText _ctrlEditCompose;
		_pos = if ( cbChecked _ctrlCheckLocation ) then [ { player call GTA_fnc_getPos3D }, { [] } ];

		//--- Strip quotes from message
		_message = toArray _message;

		{

			if ( _x == 34 ) then {

				_message set [ _forEachIndex, 39 ];

			};

		} forEach _message;

		_message = toString _message;

		//--- Send message to server
		[ _type select 0, _message select [ 0, 600 ], _pos, _type select 1 ] call GTA_fnc_sendMessage;

		//--- Dispose global type variable
		GTA_RscDisplayMessaging_composeType = nil;

		//--- Hint
		hint "Message sent";

		//--- Show message panel
		[ "showMessagePanel", [ _display ] ] call GTA_RscDisplayMessaging_script;

	};

	case "onKeyDownCompose": {

		//--- Controls
		_display = ctrlParent ( _params select 0 );
		_ctrlEditCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;
		_ctrlValueLength = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUELENGTH;
		_ctrlButtonSend = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONSEND;

		//--- Vars
		_handle = false;

		//--- Limit length
		if ( count ctrlText _ctrlEditCompose >= 600 ) then {

			//--- Cut off
			_ctrlEditCompose ctrlSetText ( ctrlText _ctrlEditCompose select [ 0, 600 ] );

			//--- Handle
			_handle = true;

		} else {

			//--- Enable/disable send
			_ctrlButtonSend ctrlEnable ( count ctrlText _ctrlEditCompose > 0 );

		};

		//--- Display length
		_ctrlValueLength ctrlSetText format [ "%1 of 600", count ctrlText _ctrlEditCompose ];

		_handle

	};

	case "onComposeSetFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlTextCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_TEXTCOMPOSE;

		//--- Hide placeholder
		_ctrlTextCompose ctrlShow false;

	};

	case "onComposeKillFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlEditCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;
		_ctrlTextCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_TEXTCOMPOSE;

		if ( count ctrlText _ctrlEditCompose == 0 ) then {

			//--- Show placeholder
			_ctrlTextCompose ctrlShow true;

		};

	};

	case "composeMessage": {

		//--- Controls
		_display = _params select 0;
		_ctrlValueType = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUETYPE;

		//--- Vars
		_type = _params select 1;

		//--- Define global type variable
		GTA_RscDisplayMessaging_composeType = _type;

		//--- Display message type
		_ctrlValueType ctrlSetText ( if ( _type select 0 == 0 ) then { format [ "Message to %1", name ( ( _type select 1 ) select 0 ) ] } else { [ _type select 0 ] call GTA_fnc_messageTypeName } );

		//--- Show compose panel
		[ "showComposePanel", [ _display ] ] call GTA_RscDisplayMessaging_script;

	};

	case "refreshInbox": {

		//--- Controls
		_display = _params select 0;
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;

		//--- Vars
		_index = lbCurSel _ctrlListInbox;
		_messages = +GTA_messaging_messages;

		//--- Reverse messages array
		reverse _messages;

		//--- Clear list
		lbClear _ctrlListInbox;

		//--- Add messages
		{

			_type = _x select 0;
			_lbAdd = _ctrlListInbox lbAdd ( if ( _type == 0 ) then [ { _x select 2 }, { [ _type ] call GTA_fnc_messageTypeName } ] );
			_ctrlListInbox lbSetData [ _lbAdd, str _x ];
			_ctrlListInbox lbSetPicture [ _lbAdd, switch _type do {

				case 0: { "gui\data\RscDisplayMessaging\message.paa" };
				case 1: { "gui\data\RscDisplayMessaging\police_dispatch.paa" };
				case 2: { "gui\data\RscDisplayMessaging\nato_dispatch.paa" };
				case 3: { "gui\data\RscDisplayMessaging\paramedic_dispatch.paa" };
				case 4: { "gui\data\RscDisplayMessaging\hato_dispatch.paa" };
				case 5: { "gui\data\RscDisplayMessaging\public_announcement.paa" };
				case 6: { "gui\data\RscDisplayMessaging\vicinity.paa" };
				case 7: { "gui\data\RscDisplayMessaging\admin_request.paa" };
				case 8: { "gui\data\RscDisplayMessaging\admin_announcement.paa" };

			} ];

		} forEach _messages;

		//--- Select index
		if ( count _messages > 0 ) then {

			_ctrlListInbox lbSetCurSel ( if ( _index >= 0 ) then [ { _index + 1 }, { 0 } ] );

		};

	};

	case "showMessagePanel": {

		//--- Controls
		_display = _params select 0;
		_ctrlGroupMessage = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPMESSAGE;
		_ctrlGroupCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPCOMPOSE;
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;

		//--- Show/hide groups
		_ctrlGroupMessage ctrlShow true;
		_ctrlGroupCompose ctrlShow false;

		//--- Enable inbox
		_ctrlListInbox ctrlEnable true;

	};

	case "showComposePanel": {

		//--- Controls
		_display = _params select 0;
		_ctrlGroupMessage = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPMESSAGE;
		_ctrlGroupCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_GROUPCOMPOSE;
		_ctrlListInbox = _display displayCtrl IDC_RSCDISPLAYMESSAGING_LISTINBOX;
		_ctrlValueLength = _display displayCtrl IDC_RSCDISPLAYMESSAGING_VALUELENGTH;
		_ctrlCheckLocation = _display displayCtrl IDC_RSCDISPLAYMESSAGING_CHECKLOCATION;
		_ctrlEditCompose = _display displayCtrl IDC_RSCDISPLAYMESSAGING_EDITCOMPOSE;
		_ctrlButtonSend = _display displayCtrl IDC_RSCDISPLAYMESSAGING_BUTTONSEND;

		//--- Show/hide groups
		_ctrlGroupMessage ctrlShow false;
		_ctrlGroupCompose ctrlShow true;

		//--- Disable inbox
		_ctrlListInbox ctrlEnable false;

		//--- Reset
		_ctrlCheckLocation cbSetChecked true;
		_ctrlEditCompose ctrlSetText "";

		//--- Invoke compose key down event
		[ "onKeyDownCompose", [ _ctrlEditCompose ] ] call GTA_RscDisplayMessaging_script;

	};

  case "timeToHMS": {
    _params params ["_time"];
    private _timeUnit = "second";
    private _value = 0;

    //--- Time
    private _hours = floor (_time / 3600);
    private _minutes = floor ((_time / 60) % 60);
    private _seconds = floor (_time % 60);

    switch true do {
      case (_hours > 0): {
        _timeUnit = "hour";
        _value = _hours;
      };

      case (_minutes > 0): {
        _timeUnit = "minute";
        _value = _minutes;
      };

      case (_seconds > 0): {
        _timeUnit = "second";
        _value = _seconds;
      };

      default {};
    };

    //--- Pluralise
    if (_value != 1) then {
      _timeUnit = _timeUnit + "s";
    };

    format ["%1 %2 ago", _value, _timeUnit]
	};
};
