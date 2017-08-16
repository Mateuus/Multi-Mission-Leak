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

		GTA_RscSpeedRadar_drawObjects = [];
		GTA_RscSpeedRadar_markers = [];

		//--- Display
		_display = _params select 0;

		//--- Control MapRadar
		_ctrlMap = _display displayCtrl IDC_RSCSPEEDRADAR_MAP;
		_ctrlMap ctrlAddEventHandler [ "Draw",  { [ "onDraw", _this ] call GTA_RscSpeedRadar_script } ];

		//--- Thread
		GTA_RscSpeedRadar_loopHndl = [ "loop", [ _display ] ] spawn GTA_RscSpeedRadar_script;

		//--- Hide map markers
		{

			GTA_RscSpeedRadar_markers pushBack [ _x, markerAlpha _x ];
			_x setMarkerAlphaLocal 0;

		} forEach allMapMarkers;

	};

	case "onUnload": {

		//--- Terminate loop
		if ( !isNil "GTA_RscSpeedRadar_loopHndl" && { !isNull GTA_RscSpeedRadar_loopHndl } ) then { terminate GTA_RscSpeedRadar_loopHndl };

		//--- Show markers
		{

			_marker = _x select 0;
			_alpha = _x select 1;

			_marker setMarkerAlphaLocal _alpha;

		} forEach GTA_RscSpeedRadar_markers;

		//--- Destroy vars
		GTA_RscSpeedRadar_loopHndl = nil;
		GTA_RscSpeedRadar_drawObjects = nil;
		GTA_RscSpeedRadar_markers = nil;

	};

	case "loop": {

		disableSerialization;

		//--- Display
		_display = _params select 0;

		while { !isNull _display } do {

			//--- Condition to use
			if !( ( goggles player ) in [ "G_Tactical_Black", "G_Tactical_Clear" ] ) exitWith { hint "You need to be wearing tactical glasses to use the speed radar."; };
			if ( dialog ) exitWith {};

			_drawObjects = [];
			_objects = player nearEntities [ "Car", 250 ];
			_objects = _objects - [ vehicle player ];

			//--- Check objects
			{

				if ( side group ( driver _x ) == civilian ) then {

					if !( lineIntersects [ eyePos player, ATLToASL ( _x modelToWorldVisual [ 0, 0, 0 ] ), vehicle player, _x ] ) then {

						_icon = [ getText ( configFile >> "CfgVehicles" >> typeOf vehicle _x >> "icon" ) ] call BIS_fnc_textureVehicleIcon;
						_drawObjects pushBack [ _x, _icon ];

					};

				};

			} forEach _objects;

			//--- Push draw objects to global array
			GTA_RscSpeedRadar_drawObjects = _drawObjects;

			sleep 0.5;

		};

		//--- Unload
		[ "GTA_RscSpeedRadar" ] call GTA_fnc_destroyRscLayer;

	};

	case "onDraw": {

		_ctrlMap = _params select 0;

		//--- Center the map to the player
		_ctrlMap ctrlMapAnimAdd [ 0, 0.03, getPosASLVisual player ];
		ctrlMapAnimCommit _ctrlMap;

		//--- Draw player
		_ctrlMap drawIcon [

			[ getText ( configFile >> "CfgVehicles" >> typeOf vehicle player >> "icon" ) ] call BIS_fnc_textureVehicleIcon,
			[ .2, 1, 0, 1 ],
			getPosVisual vehicle player,
			26,
			26,
			getDirVisual vehicle player,
			"",
			0

		];

		//--- Draw map objects
		{

			_object = _x select 0;
			_icon = _x select 1;

			_ctrlMap drawIcon [

				_icon,
				[ 0.902, 0.451, 0.102, 1 ],
				getPosVisual _object,
				36,
				36,
				getDirVisual _object,
				format [ "%1 km/h", round speed _object ],
				2,
				0.06,
				'PuristaSemiBold'

			];

		} forEach GTA_RscSpeedRadar_drawObjects;

	};

};
