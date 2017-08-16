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

		private [ "_colorHighlight", "_bullet", "_display", "_ctrlTextMessage", "_ctrlButtonContinue", "_message", "_posText" ];
		_colorHighlight = [ "GUI", "BCG_RGB" ] call BIS_fnc_displayColorGet;
		_colorHighlight = _colorHighlight call GTA_fnc_colorRGBtoHTML;
		_bullet = "<t size='0.5' color='" + _colorHighlight + "'><img image='A3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_square' /></t>";

		//--- Controls
		_display = _params select 0;
		_ctrlTextMessage = _display displayCtrl IDC_RSCDISPLAYWELCOME_TEXTMESSAGE;
		_ctrlButtonContinue = _display displayCtrl 1;
		//_ctrlButtonContinue ctrlEnable false;

		//--- Message
		_message = "";
		_message = _message + "<t align='center' size='8' shadow='0'><img image='gui\data\gta_logo.paa' /></t><br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_PARA1", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";

		_message = _message + "<t align='center' size='8' shadow='0'><img image='\a3\missions_f_epb\data\img\b_in_overview_ca.paa' /></t>";
		_message = _message + "<br /><br />";

		//_message = _message + "<t align='center' size='4' shadow='0'><img image='\a3\ui_f\data\gui\cfg\Debriefing\enddefault_ca.paa' /></t><br />";
		//_message = _message + "<br />";

		_message = _message + format [ localize "STR_GTA_WELCOME_PARA3_TITLE", _colorHighlight, _bullet ];
		_message = _message + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST1" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST2" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST3" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST4" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST5" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST6" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST7" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST8" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST9" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST10" + "<br />";
		_message = _message + _bullet + " " + localize "STR_GTA_WELCOME_PARA3_LIST11" + "<br />";
		_message = _message + "<br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_PARA3", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";

		_message = _message + format [ localize "STR_GTA_WELCOME_PARA4_TITLE", _colorHighlight, _bullet ];
		_message = _message + "<br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_PARA4", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";
		_message = _message + _bullet + " " + format [ localize "STR_GTA_WELCOME_PARA4_LIST1", _colorHighlight, _bullet ] + "<br />";
		_message = _message + _bullet + " " + format [ localize "STR_GTA_WELCOME_PARA4_LIST2", _colorHighlight, _bullet ] + "<br />";
		_message = _message + "<br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_FOOT", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";

		/*_message = "";
		_message = _message + "<t align='center' size='8' shadow='0'><img image='gui\data\gta_logo.paa' /> <img image='A3\Data_F_Mark\Logos\arma3_mark_icon_ca' /></t><br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA1", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";

		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA2_TITLE", _colorHighlight, _bullet ];
		_message = _message + "<br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA2", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA3", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";

		_message = _message + "<t align='center' size='8' shadow='0'><img image='A3\Missions_F_Mark\data\img\Showcase_Marksman_overview_CA' /></t>";
		_message = _message + "<br /><br />";

		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA4_TITLE", _colorHighlight, _bullet ];
		_message = _message + "<br />";
		_message = _message + format [ localize "STR_GTA_WELCOME_MARK_PARA4", _colorHighlight, _bullet ];
		_message = _message + "<br /><br />";*/

		//--- Set the message
		_ctrlTextMessage ctrlSetStructuredText parseText _message;

		//--- Resize structuredText
		_posText = ctrlPosition _ctrlTextMessage;
		_ctrlTextMessage ctrlSetPosition [ _posText select 0, _posText select 1, _posText select 2, ctrlTextHeight _ctrlTextMessage ];
		_ctrlTextMessage ctrlCommit 0;

		//--- Disable continue
		/*[ _ctrlButtonContinue ] spawn {

			disableSerialization;
			private [ "_ctrlButtonContinue", "_waitTime" ];
			_ctrlButtonContinue = _this select 0;
			_waitTime = diag_tickTime + 15;

			//--- Timer
			while { diag_tickTime < _waitTime } do {

				//--- Update
				_ctrlButtonContinue ctrlSetText format [ "Wait %1", [ _waitTime - diag_tickTime, "SS.MS" ] call BIS_fnc_secondsToString ];

				uiSleep 0.01;

			};

			_ctrlButtonContinue ctrlSetText "Continue";
			_ctrlButtonContinue ctrlEnable true;

		};*/

	};

	case "onLoad": {

	};

};
