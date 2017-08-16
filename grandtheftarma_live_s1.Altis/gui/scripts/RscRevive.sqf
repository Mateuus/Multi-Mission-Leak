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

		//--- Controls
		_ctrlTextStatus = _display displayCtrl IDC_RSCREVIVE_TEXTSTATUS;
		_ctrlTextAction = _display displayCtrl IDC_RSCREVIVE_TEXTACTION;
		_ctrlTextMedic = _display displayCtrl IDC_RSCREVIVE_TEXTMEDIC;

		//--- Action text
		_colorHighlight = [ "GUI", "BCG_RGB" ] call BIS_fnc_displayColorGet;
		_colorHighlight = _colorHighlight call GTA_fnc_colorRGBtoHTML;
		_ctrlTextAction ctrlSetStructuredText parseText ( format [ "PRESS <t color='%1'>[%2]</t> TO RESPAWN", _colorHighlight, call compile ( toUpper keyName 1 ) ] );
		_ctrlTextAction ctrlShow false;

		//--- Thread
		GTA_RscRevive_loop = [ "loop", [ _display ] ] spawn GTA_RscRevive_script;

	};

	case "onUnload": {

		if ( !isNil "GTA_RscRevive_loop" ) then { terminate GTA_RscRevive_loop };
		GTA_RscRevive_loop = nil;

	};

	case "loop": {

		disableSerialization;

		//--- Display
		_display = _params select 0;
		_ctrlTextStatus = _display displayCtrl IDC_RSCREVIVE_TEXTSTATUS;
		_ctrlTextAction = _display displayCtrl IDC_RSCREVIVE_TEXTACTION;
		_ctrlTextMedic = _display displayCtrl IDC_RSCREVIVE_TEXTMEDIC;
		_ctrlProgressBlood = _display displayCtrl IDC_RSCREVIVE_PROGRESSBLOOD;

		while { !isNull _display } do {

			_blood = player getVariable [ "GTA_revive_blood", 1 ];

			//--- Text status
			if ( isNull ( player getVariable [ "GTA_revive_helper", objNull ] ) ) then {

				_ctrlProgressBlood ctrlSetTextColor [ 0.7, 0, 0, 1 ];
				_ctrlTextStatus ctrlSetText "BLEEDING OUT";

			} else {

				_ctrlProgressBlood ctrlSetTextColor [ 0, 0.7, 0, 1 ];
				_ctrlTextStatus ctrlSetText "BEING REVIVED";

			};

			//--- Respawn action
			_ctrlTextAction ctrlShow (_blood <= 0.7);

			//--- Check if any medics are online
			if ( { [ _x ] call GTA_fnc_isMedic } count ( allPlayers ) > 0 ) then {

				//--- Retrive distances from medics
				_distances = [];

				{

					if ( [ _x ] call GTA_fnc_isMedic && { _x != player } ) then {

						_distances pushBack ( player distance _x );

					};

				} forEach ( allPlayers );

				if ( count _distances > 0 ) then {

					//--- Find closest
					_distance = [ _distances, 0 ] call BIS_fnc_findExtreme;
					_distance = ceil _distance;

					//--- Text medic
					_ctrlTextMedic ctrlSetText format [ "MEDIC: %1m", [ _distance ] call life_fnc_numberText ];

					//--- Show medic distance
					_ctrlTextMedic ctrlShow true;

				};

			} else {

				//--- Hide medic distance
				_ctrlTextMedic ctrlShow false;

			};

			//--- Progress blood
			_ctrlProgressBlood progressSetPosition _blood;

			uiSleep 0.01

		};

		//--- Unload
		[ "GTA_RscRevive" ] call GTA_fnc_destroyRscLayer;

	};

};
