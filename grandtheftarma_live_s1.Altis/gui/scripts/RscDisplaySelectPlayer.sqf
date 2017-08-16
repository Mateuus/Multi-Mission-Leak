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

		//--- Defaults
		GTA_RscDisplaySelectPlayer_selected = objNull;
		GTA_RscDisplaySelectPlayer_search = "";
		GTA_RscDisplaySelectPlayer_filter = 4;

		//--- Display
		_display = _params select 0;

		//--- Control ListPlayers
		_ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_LISTPLAYERS;
		_ctrlListPlayers ctrlAddEventHandler [ "LBSelChanged",  { [ "onSelChanged", _this ] call GTA_RscDisplaySelectPlayer_script } ];

		//--- Control EditSearch
		_ctrlEditSearch = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_EDITSEARCH;
		_ctrlEditSearch ctrlAddEventHandler [ "KeyUp",  { [ "onSearchChanged", _this ] call GTA_RscDisplaySelectPlayer_script } ];
		_ctrlEditSearch ctrlAddEventHandler [ "SetFocus",  { [ "onSearchSetFocus", _this ] call GTA_RscDisplaySelectPlayer_script } ];
		_ctrlEditSearch ctrlAddEventHandler [ "KillFocus",  { [ "onSearchKillFocus", _this ] call GTA_RscDisplaySelectPlayer_script } ];

		//--- Control Filters
		{

			_ctrl = _display displayCtrl _x;
			_ctrl ctrlAddEventHandler [ "ButtonClick",  format [ " [ 'onFilterChanged', [ ctrlParent ( _this select 0 ), %1 ] ] call GTA_RscDisplaySelectPlayer_script", _forEachIndex ] ];

		} forEach [
			IDC_RSCDISPLAYSELECTPLAYER_FILTER2,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER1,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER3,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER4,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER0
		];

		//--- Setup filter
		[ "onFilterChanged", [ _display ] ] call GTA_RscDisplaySelectPlayer_script;

		//--- Default focus
		ctrlSetFocus _ctrlListPlayers;

	};

	case "onUnload": {

		//--- Result
		GTA_fnc_selectPlayer_result = if ( _params select 1 == 1 ) then [ { GTA_RscDisplaySelectPlayer_selected }, { objNull } ];

		//--- Destroy variables
		GTA_RscDisplaySelectPlayer_selected = nil;
		GTA_RscDisplaySelectPlayer_search = nil;
		GTA_RscDisplaySelectPlayer_filter = nil;

	};

	case "updatePlayers": {

		_display = _params select 0;
		_ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_LISTPLAYERS;
		_ctrlButtonSelect = _display displayCtrl 1;
		_side = _params select 1;
		_search = GTA_RscDisplaySelectPlayer_search;

		//--- Clear player list
		lbClear _ctrlListPlayers;

		//--- Populate player list
		{

			//--- Filter side
			if (

				( _side > 3 ) ||
				{ _side == ( side group _x ) call BIS_fnc_sideID }

			) then {

				_name = name _x;

				//--- Filter name
				if ( _search == "" || { [ _search, _name ] call BIS_fnc_inString } ) then {

					_uid = getPlayerUID _x;
					_icon = "gui\data\RscDisplaySelectPlayer\icon_man.paa";
					_color = [ side group _x ] call BIS_fnc_sideColor;

					//--- Add player to list
					_lbPlayer = _ctrlListPlayers lbAdd _name;
					_ctrlListPlayers lbSetPicture [ _lbPlayer, _icon ];
					_ctrlListPlayers lbSetData [ _lbPlayer, _uid ];
					_ctrlListPlayers lbSetPictureColor [ _lbPlayer, _color ];
					_ctrlListPlayers lbSetPictureColorSelected [ _lbPlayer, _color ];

				};

			};

		} foreach ( [] call GTA_fnc_allPlayers );

		//--- Sort player list
		lbSort _ctrlListPlayers;

		//--- No selection
		_ctrlListPlayers lbSetCurSel -1;

		_ctrlButtonSelect ctrlEnable false;

	};

	case "onSearchChanged": {

		_display = ctrlParent ( _params select 0 );
		_ctrlEditSearch = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_EDITSEARCH;

		//--- Update player list
		GTA_RscDisplaySelectPlayer_search = ctrlText _ctrlEditSearch;
		[ "updatePlayers", [ _display, GTA_RscDisplaySelectPlayer_filter ] ] call GTA_RscDisplaySelectPlayer_script;

	};

	case "onSearchSetFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlTextSearch = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_TEXTSEARCH;

		//--- Hide placeholder
		_ctrlTextSearch ctrlShow false;

	};

	case "onSearchKillFocus": {

		_display = ctrlParent ( _params select 0 );
		_ctrlTextSearch = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_TEXTSEARCH;

		if ( GTA_RscDisplaySelectPlayer_search == "" ) then {

			//--- Show placeholder
			_ctrlTextSearch ctrlShow true;

		};

	};

	case "onFilterChanged": {

		_display = _params select 0;
		_ctrlBackgroundFilter = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_BACKGROUNDFILTER;
		_curSel = if ( count _params > 1 ) then { _params select 1 } else { GTA_RscDisplaySelectPlayer_filter };

		//--- Update player list
		[ "updatePlayers", [ _display, _curSel ] ] call GTA_RscDisplaySelectPlayer_script;

		//--- Update filters visual
		_delay = if ( GTA_RscDisplaySelectPlayer_init ) then { 0.1 } else { 0 };

		{

			_ctrl = _display displayCtrl _x;
			_color = _forEachIndex call BIS_fnc_sideColor;
			_alpha = 0.5;
			_scale = 0.75;

			if ( _forEachIndex == _curSel ) then {

				_alpha = 1;
				_scale = 1;
				GTA_RscDisplaySelectPlayer_filter = _forEachIndex;

			};

			_ctrl ctrlSetActiveColor _color;
			_color set [ 3, _alpha ];
			_ctrl ctrlSetTextColor _color;
			_pos = [ _ctrl, _scale, _delay ] call BIS_fnc_ctrlSetScale;

			if ( _forEachIndex == _curSel ) then {

				_ctrlBackgroundFilter ctrlSetPosition _pos;
				_ctrlBackgroundFilter ctrlCommit _delay;

			};

		} forEach [
			IDC_RSCDISPLAYSELECTPLAYER_FILTER2,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER1,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER3,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER4,
			IDC_RSCDISPLAYSELECTPLAYER_FILTER0
		];

	};

	case "onSelChanged": {

		_display = ctrlParent ( _params select 0 );
		_ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYSELECTPLAYER_LISTPLAYERS;
		_ctrlButtonSelect = _display displayCtrl 1;
		_curSel = lbCurSel _ctrlListPlayers;
		_uid = _ctrlListPlayers lbData _curSel;

		GTA_RscDisplaySelectPlayer_selected = _uid call GTA_fnc_unitByUID;
		_ctrlButtonSelect ctrlEnable true;

	};

};
