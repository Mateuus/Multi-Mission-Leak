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

		//--- DisplayChild Settings
		_displayChildSettings = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS;
		_displayChildSettings ctrlShow false;

		//---Control ButtonCancel
		_ctrlButtonCancel = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_BUTTONCANCEL;
		_ctrlButtonCancel ctrlAddEventHandler [ "ButtonClick",  { [ "onClickCancel", [ ctrlParent ( _this select 0 ) ] ] call GTA_RscDisplayAdminChildSettings_script } ];

		//--- Control ButtonApply
		_ctrlButtonApply = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_BUTTONAPPLY;
		_ctrlButtonApply ctrlAddEventHandler [ "ButtonClick",  { [ "onClickApply", [ ctrlParent ( _this select 0 ) ] ] call GTA_RscDisplayAdminChildSettings_script } ];

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onUnload": {



	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onShow": {

		//--- Display
		_display = _params select 0;

		//--- Controls
		_ctrlCheckMapVehicles = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPENTITIES;
		_ctrlCheckMapAnimate = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPANIMATE;
		_ctrlCheckMapNames = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPNAMES;

		//--- Load settings
		_ctrlCheckMapVehicles cbSetChecked GTA_RscDisplayAdmin_mapEntities;
		_ctrlCheckMapAnimate cbSetChecked GTA_RscDisplayAdmin_mapAnimate;
		_ctrlCheckMapNames cbSetChecked GTA_RscDisplayAdmin_mapNames;

		//--- Show child display
		_displayChildSettings = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS;
		_displayChildSettings ctrlShow true;
		ctrlSetFocus _displayChildSettings;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onHide": {

		_display = _params select 0;
		_display displayRemoveAllEventHandlers "KeyDown";

		//--- Hide child display
		_displayChildSettings = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS;
		_displayChildSettings ctrlShow false;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onClickCancel": {

		_display = _params select 0;

		//--- Close settings
		[ "displayChild", [ _display, GTA_RscDisplayAdminChildSettings_script, false ] ] call GTA_RscDisplayAdmin_script;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onClickApply": {

		//--- Display
		_display = _params select 0;

		//--- Controls
		_ctrlCheckMapVehicles = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPENTITIES;
		_ctrlCheckMapAnimate = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPANIMATE;
		_ctrlCheckMapNames = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPNAMES;

		//--- Apply settings
		GTA_RscDisplayAdmin_mapEntities = cbChecked _ctrlCheckMapVehicles;
		GTA_RscDisplayAdmin_mapAnimate = cbChecked _ctrlCheckMapAnimate;
		GTA_RscDisplayAdmin_mapNames = cbChecked _ctrlCheckMapNames;

		//--- Close settings
		[ "displayChild", [ _display, GTA_RscDisplayAdminChildSettings_script, false ] ] call GTA_RscDisplayAdmin_script;

		//--- Show notification
		[ "showNotification", [ _display, "Settings applied" ] ] call GTA_RscDisplayAdmin_script;

	};

};
