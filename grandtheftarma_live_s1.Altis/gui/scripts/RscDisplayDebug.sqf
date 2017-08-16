/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"

//--- Check if player is admin
if ( [ "GTA_adminLevel" ] call GTA_fnc_const < 4 ) exitWith { closeDialog 2; };

private [ "_mode", "_params" ];
_mode = _this select 0;
_params = _this select 1;

switch _mode do {

	case "onLoad": {

		GTA_RscDebugConsole_watchSave = [ true, true, true, true ];

		//--- Defaults
		GTA_RscDisplaySelectPlayer_selected = objNull;
		GTA_RscDisplaySelectPlayer_search = "";
		GTA_RscDisplaySelectPlayer_filter = 4;

		//--- Display
		_display = _params select 0;

		//--- Control EditExpression
		_ctrlEditExpression = _display displayCtrl IDC_RSCDISPLAYDEBUG_EDITEXPRESSION;
		_ctrlEditExpression ctrlSetText ( profileNamespace getVariable [ "GTA_RscDebugConsole_expression", "" ] );
		_ctrlEditExpression ctrlAddEventHandler [ "SetFocus",  { [ "onExpressionSetFocus", _this ] call GTA_RscDisplayDebug_script; } ];
		_ctrlEditExpression ctrlAddEventHandler [ "KillFocus",  { [ "onExpressionKillFocus", _this ] call GTA_RscDisplayDebug_script; } ];
		ctrlsetfocus _ctrlEditExpression;
		[ "onExpressionSetFocus", [ _ctrlEditExpression ] ] call GTA_RscDisplayDebug_script;

		//--- Control ButtonExec
		_ctrlButtonExec = _display displayCtrl IDC_RSCDISPLAYDEBUG_BUTTONEXEC;
		_ctrlButtonExec ctrladdeventhandler [ "ButtonClick", { [ "onExecute", _this ] call GTA_RscDisplayDebug_script } ];

		//--- Watch fields
		_display displayAddEventHandler [ "MouseMoving", { [ "onWatch", _this ] call GTA_RscDisplayDebug_script; } ];
		_display displayAddEventHandler [ "MouseHolding", { [ "onWatch", _this ] call GTA_RscDisplayDebug_script; } ];

		//--- Load last watch values
		{

			_input = _display displayCtrl _x;
			_input ctrlSetText ( profileNamespace getVariable [ "GTA_RscDebugConsole_watch" + str ( _forEachIndex + 1 ), "" ] );

		} foreach [

			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT1,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT2,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT3,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT4

		];

		//--- Buttons
		_ctrlButtonConfig = _display displayCtrl IDC_RSCDISPLAYDEBUG_BUTTONCONFIG;
		_ctrlButtonConfig ctrlAddEventHandler [ "ButtonClick",  { [ ctrlParent ( _this select 0 ) ] spawn ( uiNamespace getVariable 'BIS_fnc_configViewer' ); } ];

		_ctrlButtonCamera = _display displayCtrl IDC_RSCDISPLAYDEBUG_BUTTONCAMERA;
		_ctrlButtonCamera ctrlAddEventHandler [ "ButtonClick",  { closeDialog 1; [] spawn ( uiNamespace getVariable 'BIS_fnc_camera'); } ];

	};

	case "onUnload": {

		_display = _params select 0;

		//--- Remember last values
		_ctrlEditExpression = _display displayCtrl IDC_RSCDISPLAYDEBUG_EDITEXPRESSION;
		profileNamespace setVariable [ "GTA_RscDebugConsole_expression", ctrltext _ctrlEditExpression ];

		{

			_input = _display displayCtrl _x;
			_inputValue = if ( GTA_RscDebugConsole_watchSave select _forEachIndex ) then { ctrlText _input } else { "" };
			profileNamespace setVariable [ "GTA_RscDebugConsole_watch" + str ( _forEachIndex + 1 ), _inputValue ];

		} foreach [

			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT1,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT2,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT3,
			IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT4

		];

		saveprofileNamespace;

		//--- Cleanup
		GTA_RscDebugConsole_watchSave = nil;

	};

	case "onExecute": {

		_display = ctrlParent ( _params select 0 );
		_input = _display displayCtrl IDC_RSCDISPLAYDEBUG_EDITEXPRESSION;
		_inputValue = "";

		with missionNamespace do {

			[] call compile ctrltext _input;

		};

	};

	case "onWatch": {

		_display = _params select 0;

		{
			_input = _display displayCtrl ( _x select 0 );
			_output = _display displayCtrl ( _x select 1 );
			_outputBackground = _display displayCtrl ( _x select 2 );
			_backgroundColor = [ 0, 0, 0, 0.7 ];
			_save = true;

			_inputValue = ctrlText _input;

			if ( _inputValue != "" ) then {

				_timeStart = diag_tickTime;

				with missionNamespace do {

					_inputValue = if !( isNil { call compile _inputValue } ) then {

						_timeStart = diag_tickTime;
						call compile _inputValue;

					} else { nil };

				};

				//--- Show warnign when code is taking too long; also disable saving the value
				if ( diag_tickTime - _timeStart > 0.003 ) then {

					_save = false;
					_backgroundColor = [ 0.5, 0.25, 0, 0.7 ];

				};

				_inputValue = if !( isNil { _inputValue } ) then { str _inputValue } else { "" };

			};

			_output ctrlSetText _inputValue;

			_outputBackground ctrlSetBackgroundColor _backgroundColor;
			_outputBackground ctrlCommit 0;
			GTA_RscDebugConsole_watchSave set [ _forEachIndex, _save ];

		} foreach [

			[ IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT1, IDC_RSCDISPLAYDEBUG_EDITWATCHOUTPUT1, IDC_RSCDISPLAYDEBUG_BACKGROUNDWATCHOUTPUT1 ],
			[ IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT2, IDC_RSCDISPLAYDEBUG_EDITWATCHOUTPUT2, IDC_RSCDISPLAYDEBUG_BACKGROUNDWATCHOUTPUT2 ],
			[ IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT3, IDC_RSCDISPLAYDEBUG_EDITWATCHOUTPUT3, IDC_RSCDISPLAYDEBUG_BACKGROUNDWATCHOUTPUT3 ],
			[ IDC_RSCDISPLAYDEBUG_EDITWATCHINPUT4, IDC_RSCDISPLAYDEBUG_EDITWATCHOUTPUT4, IDC_RSCDISPLAYDEBUG_BACKGROUNDWATCHOUTPUT4 ]

		];

	};

	case "onExpressionSetFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlTextExpression = _display displayCtrl IDC_RSCDISPLAYDEBUG_TEXTEXPRESSION;

		//--- Hide placeholder
		_ctrlTextExpression ctrlShow false;

	};

	case "onExpressionKillFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlEditExpression = _display displayCtrl IDC_RSCDISPLAYDEBUG_EDITEXPRESSION;
		_ctrlTextExpression = _display displayCtrl IDC_RSCDISPLAYDEBUG_TEXTEXPRESSION;

		if ( ctrlText _ctrlEditExpression == "" ) then {

			//--- Show placeholder
			_ctrlTextExpression ctrlShow true;

		};

	};

};
