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
		_display displayAddEventHandler [ "ChildDestroyed", { [ "onChildDestroyed", _this ] call GTA_RscDisplayMenu_script } ];

		//--- NLR timer
		_nlr = missionNamespace getVariable "GTA_nlrTick";
		if ( !isNil "_nlr" && { diag_tickTime - ( 15 * 60 ) <= _nlr } ) then {

			//--- NLR timer thread
			GTA_RscSpeedRadar_loopHandle = [ "nlrTimer", [ _display ] ] spawn GTA_RscDisplayMenu_script;

		};

		//--- Tooltips
		GTA_RscDisplayMenu_tooltips = [];

		{

			private [ "_ctrl", "_className" ];
			_ctrl = _display displayCtrl _x;
			_className = ctrlClassName _ctrl;

			//--- Tooltip array
			GTA_RscDisplayMenu_tooltips pushBack _className;
			GTA_RscDisplayMenu_tooltips pushBack getText ( missionConfigFile >> "GTA_RscDisplayMenu" >> "Controls" >> "GroupButtons" >> "Controls" >> _className >> "tooltip" );

			//--- Events
			_ctrl ctrlAddEventHandler [ "MouseEnter", { [ "onMouseEnterButton", _this ] call GTA_RscDisplayMenu_script } ];
			_ctrl ctrlAddEventHandler [ "MouseExit", { [ "onMouseExitButton", _this ] call GTA_RscDisplayMenu_script } ];
			_ctrl ctrlAddEventHandler [ "SetFocus", { [ "onSetFocusButton", _this ] call GTA_RscDisplayMenu_script } ];

		} forEach [

			IDC_RSCDISPLAYMENU_BUTTONEXIT,
			IDC_RSCDISPLAYMENU_BUTTONPERKS,
			IDC_RSCDISPLAYMENU_BUTTONMONEY,
			IDC_RSCDISPLAYMENU_BUTTONINVENTORY,
			IDC_RSCDISPLAYMENU_BUTTONKEYS,
			IDC_RSCDISPLAYMENU_BUTTONMESSAGING,
			IDC_RSCDISPLAYMENU_BUTTONGANG,
			IDC_RSCDISPLAYMENU_BUTTONSETTINGS,
			IDC_RSCDISPLAYMENU_BUTTONSYNC,
			IDC_RSCDISPLAYMENU_BUTTONMARKET,
			IDC_RSCDISPLAYMENU_BUTTONWANTED,
			IDC_RSCDISPLAYMENU_BUTTONADMIN,
			IDC_RSCDISPLAYMENU_BUTTONCONSOLE

		];

		//--- Tooltip functions
		GTA_RscDisplayMenu_setTooltip = {

			GTA_RscDisplayMenu_tooltips set [ ( GTA_RscDisplayMenu_tooltips find ( _this select 0 ) ) + 1, _this select 1 ];

		};

		GTA_RscDisplayMenu_getTooltip = {

			( GTA_RscDisplayMenu_tooltips select ( GTA_RscDisplayMenu_tooltips find ( _this select 0 ) ) + 1 );

		};

		//--- Center cursor
		setMousePosition [ 0.5, 0.5 ];

		//--- Blackout
		_ctrlBlackout = _display displayCtrl IDC_RSCDISPLAYMENU_BLACKOUT;
		_ctrlBlackout ctrlSetFade 1;
		_ctrlBlackout ctrlCommit 0;
		_ctrlBlackout ctrlSetFade 0;
		_ctrlBlackout ctrlCommit 0.5;

		//--- Fade out controls
		{

			private "_ctrl";
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 0;

		} forEach [

			IDC_RSCDISPLAYMENU_BUTTONPERKS,
			IDC_RSCDISPLAYMENU_BUTTONMONEY,
			IDC_RSCDISPLAYMENU_BUTTONINVENTORY,
			IDC_RSCDISPLAYMENU_BUTTONKEYS,
			IDC_RSCDISPLAYMENU_BUTTONMESSAGING,
			IDC_RSCDISPLAYMENU_BUTTONGANG,
			IDC_RSCDISPLAYMENU_BUTTONSETTINGS,
			IDC_RSCDISPLAYMENU_BUTTONSYNC,
			IDC_RSCDISPLAYMENU_BUTTONMARKET,
			IDC_RSCDISPLAYMENU_BUTTONWANTED,
			IDC_RSCDISPLAYMENU_BUTTONADMIN,
			IDC_RSCDISPLAYMENU_BUTTONCONSOLE,
			IDC_RSCDISPLAYMENU_BUTTONEXIT,
			IDC_RSCDISPLAYMENU_TEXTHEADER

		];

		//--- Control ButtonPerks
		_ctrlButtonPerks = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONPERKS;
		_ctrlButtonPerks ctrlAddEventHandler [ "ButtonClick",  { createDialog "GTA_RscDisplayPerks" } ];

		//--- Control ButtonMoney
		_ctrlButtonMoney = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONMONEY;
		_ctrlButtonMoney ctrlAddEventHandler [ "ButtonClick",  { [] call life_fnc_p_openMenu } ];

		//--- Control ButtonInventory
		_ctrlButtonInventory = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONINVENTORY;
		_ctrlButtonInventory ctrlAddEventHandler [ "ButtonClick",  { [] call life_fnc_p_openMenu } ];

		//--- Control ButtonKeys
		_ctrlButtonKeys = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONKEYS;
		_ctrlButtonKeys ctrlAddEventHandler [ "ButtonClick",  { createDialog "Life_key_management" } ];

		//--- Control ButtonMessaging
		_ctrlButtonMessaging = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONMESSAGING;
		_ctrlButtonMessaging ctrlAddEventHandler [ "ButtonClick",  { createDialog "GTA_RscDisplayMessaging" } ];

		//--- Disable messaging without radio
		if !( "ItemRadio" in assignedItems player ) then {

			_ctrlButtonMessaging ctrlEnable false;

		};

		//--- Control ButtonGang
		_ctrlButtonGang = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONGANG;

		//--- Only available to civilians
		if ( playerSide == civilian ) then {

			_ctrlButtonGang ctrlAddEventHandler [ "ButtonClick",  { if ( isNil "life_action_gangInUse" ) then { if( isNil { ( group player ) getVariable "gang_owner" } ) then { createDialog "Life_Create_Gang_Diag" } else { [] spawn life_fnc_gangMenu } } } ];

		} else {

			_ctrlButtonGang ctrlEnable false;

		};

		//--- Control ButtonSettings
		_ctrlButtonSettings = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONSETTINGS;
		_ctrlButtonSettings ctrlAddEventHandler [ "ButtonClick",  { [] call life_fnc_settingsMenu } ];

		//--- Control ButtonSync
		_ctrlButtonSync = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONSYNC;
		_ctrlButtonSync ctrlAddEventHandler [ "ButtonClick",  { [] call GTA_fnc_sync } ];

		//--- Control ButtonMarket
		_ctrlButtonMarket = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONMARKET;
		_ctrlButtonMarket ctrlAddEventHandler [ "ButtonClick",  { createDialog "GTA_DisplayResourceIndex" } ];

		//--- Control ButtonWanted
		_ctrlButtonWanted = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONWANTED;

		//--- Available only to cops and civilians with perk
		if ( playerSide == west || playerSide == civilian && { "inside_knowledge" call GTA_fnc_perkRank > 0 } ) then {

			_ctrlButtonWanted ctrlAddEventHandler [ "ButtonClick",  { [] call life_fnc_wantedMenu } ];

		} else {

			_ctrlButtonWanted ctrlEnable false;

		};

		//--- Control ButtonAdmin
		_ctrlButtonAdmin = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONADMIN;

		//--- Only avilable to admins
		if ( [ "GTA_adminLevel", 0 ] call GTA_fnc_getConstant >= 2 ) then {

			_ctrlButtonAdmin ctrlAddEventHandler [ "ButtonClick",  { createDialog "GTA_RscDisplayAdmin" } ];

		} else {

			_ctrlButtonAdmin ctrlEnable false;
			_ctrlButtonAdmin ctrlShow false;

		};

		//--- Control ButtonConsole
		_ctrlButtonConsole = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONCONSOLE;

		//--- Only avilable to admins
		if ( [ "GTA_adminLevel" ] call GTA_fnc_const >= 4 ) then {

			_ctrlButtonConsole ctrlAddEventHandler [ "ButtonClick",  { closeDialog 1; createDialog "GTA_RscDisplayDebug" } ];

		} else {

			_ctrlButtonConsole ctrlEnable false;
			_ctrlButtonConsole ctrlShow false;

		};

		//--- Control ButtonExit
		_ctrlButtonExit = _display displayCtrl IDC_RSCDISPLAYMENU_BUTTONEXIT;
		_ctrlButtonExit ctrlAddEventHandler [ "ButtonClick",  { closeDialog 1 } ];

		//--- Header
		[ "setHeaderTooltip", [ _ctrlButtonPerks ] ] call GTA_RscDisplayMenu_script;
		uiNamespace setVariable [ "GTA_RscDisplayMenu_focus", _ctrlButtonPerks ];
		ctrlSetFocus _ctrlButtonPerks;

		//--- Fade in bottom buttons
		[ _display ] spawn {

			disableSerialization;

			private "_display";
			_display = _this select 0;

			{

				private "_ctrl";
				_ctrl = _display displayCtrl _x;
				_ctrl ctrlSetFade 0;
				_ctrl ctrlCommit 0.4;
				sleep 0.02;

			} forEach [

				IDC_RSCDISPLAYMENU_BUTTONPERKS,
				IDC_RSCDISPLAYMENU_BUTTONMONEY,
				IDC_RSCDISPLAYMENU_BUTTONINVENTORY,
				IDC_RSCDISPLAYMENU_BUTTONKEYS,
				IDC_RSCDISPLAYMENU_BUTTONMESSAGING,
				IDC_RSCDISPLAYMENU_BUTTONEXIT


			];

		};

		//--- Fade in top buttons
		[ _display ] spawn {

			disableSerialization;

			sleep 0.04;

			private "_display";
			_display = _this select 0;

			{

				private "_ctrl";
				_ctrl = _display displayCtrl _x;
				_ctrl ctrlSetFade 0;
				_ctrl ctrlCommit 0.4;
				sleep 0.02;

			} forEach [

				IDC_RSCDISPLAYMENU_BUTTONSETTINGS,
				IDC_RSCDISPLAYMENU_BUTTONSYNC,
				IDC_RSCDISPLAYMENU_BUTTONMARKET,
				IDC_RSCDISPLAYMENU_BUTTONWANTED,
				IDC_RSCDISPLAYMENU_BUTTONGANG,
				IDC_RSCDISPLAYMENU_BUTTONADMIN,
				IDC_RSCDISPLAYMENU_BUTTONCONSOLE,
				IDC_RSCDISPLAYMENU_TEXTHEADER

			];

		};

	};

	case "onUnload": {

		GTA_RscDisplayMenu_tooltips = nil;
		uiNamespace setVariable [ "GTA_RscDisplayMenu_focus", nil ];

	};

	case "nlrTimer": {

		disableSerialization;

		//--- Controls
		_display = _params select 0;
		_ctrlTextTimer = _display displayCtrl IDC_RSCDISPLAYADMIN_TEXTTIMER;

		while { !isNull _display } do {

			_delta = ( 15 * 60 ) - ( diag_tickTime - GTA_nlrTick );
			if ( _delta < 0 ) exitWith { _ctrlTextTimer ctrlSetText ""; };

			_ctrlTextTimer ctrlSetText format [ "NLR: %1", [ _delta, "MM:SS" ] call BIS_fnc_secondsToString ];
			sleep 0.1;

		};

	};

	case "setHeaderTooltip": {

		_ctrl = _params select 0;
		_display = ctrlParent _ctrl;
		_className = ctrlClassName _ctrl;
		_ctrlTextHeader = _display displayCtrl IDC_RSCDISPLAYMENU_TEXTHEADER;
		_tooltip = [ _className ] call GTA_RscDisplayMenu_getTooltip;

		//--- Set header text
		_ctrlTextHeader ctrlSetText _tooltip;

	};

	case "onMouseEnterButton": {

		[ "setHeaderTooltip", _params ] call GTA_RscDisplayMenu_script;

	};

	case "onMouseExitButton": {

		[ "setHeaderTooltip", [ uiNamespace getVariable [ "GTA_RscDisplayMenu_focus", controlNull ] ] ] call GTA_RscDisplayMenu_script;

	};

	case "onSetFocusButton": {

		uiNamespace setVariable [ "GTA_RscDisplayMenu_focus", _params select 0 ];
		[ "setHeaderTooltip", [ uiNamespace getVariable [ "GTA_RscDisplayMenu_focus", controlNull ] ] ] call GTA_RscDisplayMenu_script;

	};

	case "onChildDestroyed": {

		_display = _params select 0;
		_child = _params select 1;
		_code = _params select 2;

	};

};
