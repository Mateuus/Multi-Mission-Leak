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

		//--- Display
		_display = _params select 0;

		//--- Thread
		GTA_RscInfoText_loopHandle = [ "loop", [ _display ] ] spawn GTA_RscInfoText_script;

	};

	case "loop": {

		disableSerialization;

		//--- Display
		_display = _params select 0;

		//--- Controls
		_ctrlTextTitle = _display displayCtrl IDC_RSCINFOTEXT_TEXTTITLE;
		_ctrlTextSubtitle = _display displayCtrl IDC_RSCINFOTEXT_TEXTSUBTITLE;



		while { !isNull _display } do {

			//--- Variables
			_title = missionNamespace getVariable [ "GTA_RscInfoText_title", "" ];
			_subtitle = missionNamespace getVariable [ "GTA_RscInfoText_subtitle", "" ];

			//--- Set text
			_ctrlTextTitle ctrlSetText toUpper _title;

			if ( _subtitle == "" ) then {

				_ctrlTextSubtitle ctrlSetText "";
				_ctrlTextSubtitle ctrlShow false;

			} else {

				_ctrlTextSubtitle ctrlSetText _subtitle;
				_ctrlTextSubtitle ctrlShow true;

			};

			sleep 0.1;

		};

	};

};
