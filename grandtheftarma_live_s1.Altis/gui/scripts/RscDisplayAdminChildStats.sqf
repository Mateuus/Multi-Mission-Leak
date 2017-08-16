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

		//--- DisplayChild Stats
		_displayChildStats = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS;
		_displayChildStats ctrlShow false;

		//---Control ButtonCancel
		_ctrlButtonCancel = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_BUTTONCANCEL;
		_ctrlButtonCancel ctrlAddEventHandler [ "ButtonClick",  { [ "onClickCancel", [ ctrlParent ( _this select 0 ) ] ] call GTA_RscDisplayAdminChildStats_script } ];

		//--- Control ButtonApply
		_ctrlButtonApply = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_BUTTONAPPLY;
		_ctrlButtonApply ctrlAddEventHandler [ "ButtonClick",  { [ "onClickApply", [ ctrlParent ( _this select 0 ) ] ] call GTA_RscDisplayAdminChildStats_script } ];

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onUnload": {



	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onShow": {

		//--- Display
		_display = _params select 0;

		//--- Controls
		_ctrlEditMoneyPlayer = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYPLAYER;
		_ctrlEditMoneyBank = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYBANK;
		_ctrlEditSurvivalWater = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALWATER;
		_ctrlEditSurvivalFood = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALFOOD;

		//--- Load Stats
		_ctrlEditMoneyPlayer ctrlSetText ( GTA_money_cash call GTA_fnc_numberToString );
		_ctrlEditMoneyBank ctrlSetText ( GTA_money_bank call GTA_fnc_numberToString );
		_ctrlEditSurvivalWater ctrlSetText ( GTA_thirst call GTA_fnc_numberToString );
		_ctrlEditSurvivalFood ctrlSetText ( GTA_hunger call GTA_fnc_numberToString );

		//--- Show child display
		_displayChildStats = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS;
		_displayChildStats ctrlShow true;
		ctrlSetFocus _displayChildStats;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onHide": {

		_display = _params select 0;
		_display displayRemoveAllEventHandlers "KeyDown";

		//--- Hide child display
		_displayChildStats = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS;
		_displayChildStats ctrlShow false;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onClickCancel": {

		_display = _params select 0;

		//--- Close Stats
		[ "displayChild", [ _display, GTA_RscDisplayAdminChildStats_script, false ] ] call GTA_RscDisplayAdmin_script;

	};

	/////////////////////////////////////////////////////////////////////////////////

	case "onClickApply": {

		//--- Display
		_display = _params select 0;

		//--- Controls
		_ctrlEditMoneyPlayer = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYPLAYER;
		_ctrlEditMoneyBank = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYBANK;
		_ctrlEditSurvivalWater = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALWATER;
		_ctrlEditSurvivalFood = _display displayCtrl IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALFOOD;

		//--- Apply Stats
		_moneyPlayer = parseNumber ( ctrlText _ctrlEditMoneyPlayer );
		_moneyBank = parseNumber ( ctrlText _ctrlEditMoneyBank );
		_survivalWater = parseNumber ( ctrlText _ctrlEditSurvivalWater );
		_survivalFood = parseNumber ( ctrlText _ctrlEditSurvivalFood );

		//--- Apply values
		GTA_money_cash = _moneyPlayer max 0;
		GTA_money_bank = _moneyBank max 0;
		GTA_thirst = ( _survivalWater min 100 ) max 0;
		GTA_hunger = ( _survivalFood min 100 ) max 0;

		//--- Close Stats
		[ "displayChild", [ _display, GTA_RscDisplayAdminChildStats_script, false ] ] call GTA_RscDisplayAdmin_script;

		//--- Show notification
		[ "showNotification", [ _display, "Stats applied" ] ] call GTA_RscDisplayAdmin_script;

	};

};
