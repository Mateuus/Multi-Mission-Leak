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

		//--- Hide all buttons
		for "_x" from 0 to 14 do {

			_ctrl = _display displayCtrl ( IDC_RSCDISPLAYINTERACT_BUTTON + _x );
			_ctrl ctrlShow false;

		};

		_index = 0;

		//--- Sort interactions by priority
		_interactions = [ GTA_RscDisplayInteract_interactions, [], { [ _x, 2, 0, [0] ] call GTA_fnc_param }, "DESCEND" ] call BIS_fnc_sortBy;

		//--- Add interactions
		{

			private [ "_text", "_fnc", "_enable", "_tooltip", "_ctrl" ];
			_text = _x select 0;
			_fnc = _x select 1;
			_enable = [ _x, 3, true, [true] ] call GTA_fnc_param;
			_tooltip = [ _x, 4, "", [""] ] call GTA_fnc_param;

			//--- Control
			_ctrl = _display displayCtrl ( IDC_RSCDISPLAYINTERACT_BUTTON + _index );

			//--- Set text
			_ctrl ctrlSetText _text;

			//--- Set function
			_ctrl ctrlAddEventHandler [ "ButtonClick", format [ "[ 'invoke', [ _this select 0, %1 ] ] call GTA_RscDisplayInteract_script", _fnc ] ];

			//--- Enable
			_ctrl ctrlEnable _enable;

			if ( !_enable ) then {

				//--- Tooltip
				_ctrl ctrlSetTooltip _tooltip;

			};

			//--- Unhide
			_ctrl ctrlShow true;

			//--- Increment index
			_index = _index + 1;

		} forEach _interactions;

	};

	case "onUnload": {

		GTA_RscDisplayInteract_object = nil;

	};

	case "invoke": {

		_ctrl = _params select 0;
		_fnc = _params select 1;

		//--- Close the display
		closeDialog 1;

		//--- Call the function
		GTA_RscDisplayInteract_object spawn _fnc;

	};

};
