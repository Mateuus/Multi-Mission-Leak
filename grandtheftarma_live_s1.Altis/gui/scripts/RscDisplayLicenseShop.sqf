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

		_type = GTA_RscDisplayLicenseShop_type;
		_cfg = missionConfigFile >> "GTA_CfgLicenseShops" >> _type;

		//--- Display
		_display = _params select 0;

		//--- Control ListSelect
		_ctrlListLicenses = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_LISTLICENSES;
		_ctrlListLicenses ctrlAddEventHandler [ "LBSelChanged", { [ "onSelectLicense", _this ] call GTA_RscDisplayLicenseShop_script } ];
		_ctrlListLicenses ctrlAddEventHandler [ "LBDblClick", { [ "onClickTrain", _this ] call GTA_RscDisplayLicenseShop_script } ];

		//--- Populate list
		{

			//--- License details
			_license = [ _x, 0 ] call life_fnc_licenseType;
			_price = [ _x ] call life_fnc_licensePrice;

			//--- Add row
			_index = _ctrlListLicenses lnbAddRow [ _license select 1, format [ "£%1", [ _price ] call life_fnc_numberText ] ];
			_ctrlListLicenses lnbSetData [ [ _index, 0 ], _x ];

			//--- Check if player owns license
			if ( missionNamespace getVariable [ _license select 0, false ] ) then {

				//--- Fade license
				_ctrlListLicenses lnbSetColor [ [ _index, 0 ], [ 1, 1, 1, 0.5 ] ];
				_ctrlListLicenses lnbSetColor [ [ _index, 1 ], [ 1, 1, 1, 0.5 ] ];

			};

		} forEach getArray ( _cfg >> "licenses" );

		//--- Control ButtonTrain
		_ctrlButtonTrain = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_BUTTONTRAIN;
		_ctrlButtonTrain ctrlAddEventHandler [ "ButtonClick", { [ "onClickTrain", _this ] call GTA_RscDisplayLicenseShop_script } ];
		_ctrlButtonTrain ctrlEnable false;

		//--- Focus
		ctrlSetFocus _ctrlListLicenses;

	};

	case "onUnload": {

		//--- Update licenses
		//[ 2 ] call GTA_fnc_updatePlayerPartial;

	};

	case "onSelectLicense": {

		_display = ctrlParent ( _params select 0 );
		_ctrlListLicenses = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_LISTLICENSES;
		_ctrlButtonTrain = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_BUTTONTRAIN;

		//--- Get selected license
		_license = _ctrlListLicenses lnbData [ lnbCurSelRow _ctrlListLicenses, 0 ];

		//--- Get license type
		_license = [ _license, 0 ] call life_fnc_licenseType;

		//--- Enable/disable train button
		_ctrlButtonTrain ctrlEnable !( missionNamespace getVariable [ _license select 0, false ] );

	};

	case "onClickTrain": {

		_display = ctrlParent ( _params select 0 );
		_ctrlListLicenses = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_LISTLICENSES;
		_ctrlButtonTrain = _display displayCtrl IDC_RSCDISPLAYLICENSESHOP_BUTTONTRAIN;

		//--- Get selected license data
		_license = _ctrlListLicenses lnbData [ lnbCurSelRow _ctrlListLicenses, 0 ];

		//--- Attempt to buy license
		if ( [ _license ] call GTA_fnc_buyLicense ) then {

			//--- Fade license
			_ctrlListLicenses lnbSetColor [ [ lnbCurSelRow _ctrlListLicenses, 0 ], [ 1, 1, 1, 0.5 ] ];
			_ctrlListLicenses lnbSetColor [ [ lnbCurSelRow _ctrlListLicenses, 1 ], [ 1, 1, 1, 0.5 ] ];

			//--- Disable train button
			_ctrlButtonTrain ctrlEnable false;

		};

	};

};
