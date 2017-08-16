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

		//--- Controls
		_display = _params select 0;

		//--- Control ListTypes
		_ctrlListTypes = _display displayCtrl IDC_RSCDISPLAYMESSAGETYPE_LISTTYPES;

		//--- Message
		_ctrlListTypes lbAdd "Message";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "0" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\message.paa" ];

		//--- Police Dispatch
		_ctrlListTypes lbAdd "Police Dispatch";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "1" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\police_dispatch.paa" ];

		//--- NATO Dispatch
		_ctrlListTypes lbAdd "NATO Dispatch";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "2" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\nato_dispatch.paa" ];

		//--- Paramedic Dispatch
		_ctrlListTypes lbAdd "Paramedic Dispatch";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "3" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\paramedic_dispatch.paa" ];

		//--- HATO Dispatch
		_ctrlListTypes lbAdd "HATO Dispatch";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "4" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\hato_dispatch.paa" ];

		//--- Public Announcement
		if (

			//--- Police / NATO
			playerSide == west && { [ "GTA_copRank" ] call GTA_fnc_const >= 7 || [ "GTA_milRank" ] call GTA_fnc_const >= 4 }
			||
			//--- NHS / HATO
			{ playerSide == independent && { [ "GTA_medRank" ] call GTA_fnc_const >= 5 || [ "GTA_hatoRank" ] call GTA_fnc_const >= 3 } }

		) then {

			_ctrlListTypes lbAdd "Public Announcement";
			_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "5" ];
			_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\public_announcement.paa" ];

		};

		//--- Vicinity
		/*_ctrlListTypes lbAdd "Vicinity";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "6" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\vicinity.paa" ];*/

		//--- Admin Request
		_ctrlListTypes lbAdd "Staff Request";
		_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "7" ];
		_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\admin_request.paa" ];

		//--- Admin Announcement
		if ( [ "GTA_adminLevel", 0 ] call GTA_fnc_getConstant > 1 ) then {

			_ctrlListTypes lbAdd "Staff Announcement";
			_ctrlListTypes lbSetData [ lbSize _ctrlListTypes - 1, "8" ];
			_ctrlListTypes lbSetPicture [ lbSize _ctrlListTypes - 1, "gui\data\RscDisplayMessaging\admin_announcement.paa" ];

		};

		//--- Select first item
		_ctrlListTypes lbSetCurSel 0;

	};

	case "onUnload": {

		//--- Controls
		_display = _params select 0;
		_ctrlListTypes = _display displayCtrl IDC_RSCDISPLAYMESSAGETYPE_LISTTYPES;

		[ parseNumber ( _ctrlListTypes lbData lbCurSel _ctrlListTypes ), _params select 1 ] spawn {

			disableSerialization;
			_index = _this select 0;
			_exitCode = _this select 1;

			//--- Result
			GTA_fnc_selectMessageType_result = ( if ( _exitCode == 1 ) then {

				_result = [ _index, [] ];

				//--- Additional params
				switch _index do {

					//---- Message
					case 0 : { ( _result select 1 ) pushBack ( [] call GTA_fnc_selectPlayer ); };

				};

				_result

			} else { [ -1 ] } );

		};

	};

};
