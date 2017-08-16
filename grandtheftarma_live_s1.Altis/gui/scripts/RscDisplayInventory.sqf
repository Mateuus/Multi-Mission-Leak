/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#define SELF GTA_RscDisplayInventory_script

_mode = _this select 0;
_params = _this select 1;

switch _mode do {

	case "onLoad": {

		//--- Display
		_display = _params select 0;

		//--- Open the items tab
		[ "onClickTabItems", [] ] call SELF;


	};

	case "onUnload": {



	};

	case "onClickTabItems": {

		//--- Refresh item list
		[ "refreshItemList", [] ] call SELF;

	};

	case "refreshItemList": {

		//--- Retrieve display
		_display = [ "GTA_RscDisplayInventory" ] call GTA_fnc_getDisplay;

		//--- Controls
		_ctrlListItems = _display displayCtrl IDC_RSCDISPLAYINVENTORY_LISTITEMS;

		//--- Populate
		{

			_lbAdd = _ctrlListItems lnbAddRow [ _x select 0, str ( _x select 1 ) ];

		} forEach [ [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ], [ "test", 10 ] ];

	};

};
