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

		//--- Control ListSelect
		_ctrlListSelect = _display displayCtrl IDC_RSCDISPLAYSELECT_LISTSELECT;

		//--- Populate list
		{

			_text = _x select 0;
			_icon = _x select 1;

			//--- Add item
			_index = _ctrlListSelect lbAdd _text;

			//--- Item icon
			if ( _icon != "" ) then {

				_ctrlListSelect lbSetPicture [ _index, _icon ];

			};

		} forEach GTA_RscDisplaySelect_list;


		//--- Default focus
		ctrlSetFocus _ctrlListSelect;

	};

	case "onUnload": {

		_display = _params select 0;
		_ctrlListSelect = _display displayCtrl IDC_RSCDISPLAYSELECT_LISTSELECT;

		//--- Result
		GTA_fnc_selectList_result = lbCurSel _ctrlListSelect;

		//--- Destroy variables
		GTA_RscDisplaySelect_list = nil;

	};

};
