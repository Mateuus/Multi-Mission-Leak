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

		//--- Block ESC
		GTA_RscDisplaySpawnSelection_keyDownEH = _display displayAddEventHandler [ "KeyDown", { _this select 1 == 1 } ];

		//--- Control ListLocations
		_ctrlListLocations = _display displayCtrl IDC_RSCDISPLAYSPAWNSELECTION_LISTLOCATIONS;
		_ctrlListLocations ctrlAddEventHandler [ "LBSelChanged",  { [ "onSelectedLocation", _this ] call GTA_RscDisplaySpawnSelection_script } ];

		//--- Populate locations
		_spCfg = [] call GTA_fnc_spawnPoints;
		GTA_RscDisplaySpawnSelection_spCfg = _spCfg;

		{

			_ctrlListLocations lbAdd ( _x select 0 );
			_ctrlListLocations lbSetPicture [ _forEachIndex, _x select 1 ];
			_ctrlListLocations lbSetPictureColor [ _forEachIndex, _x select 2 ];

		} forEach _spCfg;

		_ctrlListLocations lbSetCurSel 0;

		//--- Control ButtonCancel
		_ctrlButtonCancel = _display displayCtrl IDC_RSCDISPLAYSPAWNSELECTION_BUTTONCANCEL;
		_ctrlButtonCancel ctrlAddEventHandler [ "ButtonClick",  { [ "onClickCancel", _this ] call GTA_RscDisplaySpawnSelection_script } ];

		//--- Control ButtonSpawn
		_ctrlButtonSpawn = _display displayCtrl IDC_RSCDISPLAYSPAWNSELECTION_BUTTONSPAWN;
		_ctrlButtonSpawn ctrlAddEventHandler [ "ButtonClick",  { [ "onClickSpawn", _this ] call GTA_RscDisplaySpawnSelection_script } ];

		//--- Control TextName
		_ctrlTextName = _display displayCtrl IDC_RSCDISPLAYSPAWNSELECTION_TEXTNAME;
		_ctrlTextName ctrlSetText ( name player );

	};

	case "onUnload": {

		GTA_RscDisplaySpawnSelection_keyDownEH = nil;
		GTA_RscDisplaySpawnSelection_spCfg = nil;
		GTA_RscDisplaySpawnSelection_sp = nil;

	};

	case "onSelectedLocation": {

		_display = ctrlParent ( _params select 0 );
		_ctrlListPlayers = _params select 0;
		_ctrlMap = _display displayCtrl IDC_RSCDISPLAYSPAWNSELECTION_MAP;
		_index = _params select 1;

		if ( _index == -1 ) exitWith {};

		//--- Retrive spawn point config and select current spawn point
		_sp = GTA_RscDisplaySpawnSelection_spCfg select _index;
		GTA_RscDisplaySpawnSelection_sp = _sp;

		//--- Get the position
		_pos = _sp select 3;
		_posXYZ = if ( typeName _pos == typeName objNull ) then { getPos _pos } else { _pos };

		//--- Clear any map animations in progress
		if ( !ctrlMapAnimDone _ctrlMap ) then { ctrlMapAnimClear _ctrlMap };

		//--- Animate map control to current spawn point
		_ctrlMap ctrlMapAnimAdd [ 0.7, ctrlMapScale _ctrlMap, _posXYZ ];
		ctrlMapAnimCommit _ctrlMap;

	};

	case "onClickCancel": {

		//--- Close spawn selection display
		closeDialog 1;

		//--- End the mission
		endMission "END1";

	};

	case "onClickSpawn": {

		//--- Close spawn selection display
		closeDialog 1;

		//--- Move player to selected spawn point
		_sp = GTA_RscDisplaySpawnSelection_sp;
		_name = _sp select 0;
		_pos = _sp select 3;

		switch ( true ) do {

			//--- Building spawn
			case ( typeName _pos == typeName objNull ) : {

				//--- Get list of building positions
				_pos = _pos call GTA_fnc_buildingPositions;

				//--- Select a random building position
				_pos = _pos call BIS_fnc_selectRandom;

				//--- Move player to selected building
				player setPosATL _pos;

			};

			//--- Building radius spawn
			case ( count _sp > 5 ) : {

				_buildingTypes = _sp select 4;
				_radius = _sp select 5;

				//--- Get list of predefined building types within a predefined radius
				_buildings = nearestObjects [ _pos, _buildingTypes, _radius ];

				//--- Check if any buildings found
				if ( count _buildings > 0 ) then {

					//--- Select a random building
					_building = _buildings call BIS_fnc_selectRandom;

					//--- Move player to selected building
					player setPos ( _building buildingPos 0 );

				} else {

					player setPosATL _pos;

				};

			};

			default {

				player setPosATL _pos;
				player setDir ( _sp select 4 );

			};

		};

		//--- Fade screen in from black
		titleText [  "", "BLACK IN", 4 ];

	};

};
