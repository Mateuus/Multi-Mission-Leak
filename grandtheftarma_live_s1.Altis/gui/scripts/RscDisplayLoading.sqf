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

		//--- Hide rings
		for "_x" from 0 to 8 do {

			( _display displayCtrl ( IDC_RSCDISPLAYLOADINGRING + _x ) ) ctrlShow false;

		};

		//--- Loading thread
		GTA_RscDisplayLoading_loadingHndl = [ "loading", [ _display ] ] spawn GTA_RscDisplayLoading_script;

	};

	case "onUnload": {

	};

	case "loading": {

		_display = _params select 0;

		//--- Progress rings
		_rings = [];
		for "_x" from 0 to 8 do {

			_rings pushBack ( _display displayCtrl ( IDC_RSCDISPLAYLOADINGRING + _x ) );

		};

		_progress = 0;
		_lastTick = diag_tickTime;

		while { !isNull _display } do {

			//--- Set new ring
			if ( diag_tickTime > _lastTick + 0.1 ) then {

				//--- Hide previous ring
				( _rings select _progress ) ctrlShow false;

				//--- Increment progress
				_progress = if ( _progress == 8 ) then { 1 } else { _progress + 1 };

				//--- Show next ring
				( _rings select _progress ) ctrlShow true;

				//--- Record last tick
				_lastTick = diag_tickTime;

			};

			uiSleep 0.01;

		};

	};

};
