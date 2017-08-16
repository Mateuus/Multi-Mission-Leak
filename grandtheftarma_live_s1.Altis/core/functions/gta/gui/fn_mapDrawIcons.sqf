/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_dispose", "_display", "_ctrlMap" ];
disableSerialization;

//--- Get map control
waitUntil { !isNull findDisplay 12 };
_display = findDisplay 12;
_ctrlMap = _display displayCtrl 51;

//--- Dispose function
/*_fnc_dispopse = {

	//--- Terminate draw loop
	if ( !isNil "GTA_fnc_mapDrawIcons_loopHandle" ) then {

		terminate GTA_fnc_mapDrawIcons_loopHandle;

	};

	//--- Remove draw event handler
	if ( !isNil "GTA_fnc_mapDrawIcons_drawHandle" ) then {

		_ctrlMap ctrlRemoveEventHandler [ "Draw", GTA_fnc_mapDrawIcons_drawHandle ];

	};

	//--- Destroy variables
	GTA_fnc_mapDrawIcons_draw = nil;
	GTA_fnc_mapDrawIcons_loopHandle = nil;
	GTA_fnc_mapDrawIcons_drawHandle = nil;

};

//--- Dispose previous instances
[] call _fnc_dispopse;*/

//--- Center the map to the player
/*_ctrlMap ctrlMapAnimAdd [ 0, ctrlMapScale _ctrlMap, getPosASLVisual player ];
ctrlMapAnimCommit _ctrlMap;*/

//--- Draw loop
GTA_fnc_mapDrawIcons_draw = [];
GTA_fnc_mapDrawIcons_loopHandle = [] spawn {

	_sideColors = [

		[ 1, 1, 1, 1 ],
		[ 0, 0.2, 1, 1 ],
		[ 0.2, 1, 0, 1 ],
		[ 1, 0.5, 0., 1 ],
		sideUnknown call BIS_fnc_sideColor

	];

	while { true } do {

		waitUntil { visibleMap };

		_draw = [];
		_units = [];
		_blacklist = [];

		switch playerSide do {

			//--- NATO and Police
			case west: {

				{ if ( side group _x == west || { [ _x ] call GTA_fnc_isHATO } ) then { _units pushBack _x } } forEach playableUnits;

			};

			//--- Independent
			case independent: {

				if ( [] call GTA_fnc_isMedic ) then {

					//--- Paramedics
					{ if ( [ _x ] call GTA_fnc_isMedic ) then { _units pushBack _x } } forEach playableUnits;

					//--- Revive markers
					{

						if ( _x getVariable [ "incapacitated", false ] ) then {

							_draw pushBack [ _x, "\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa", [ 1, 0, 0, 1 ], name _x, 30, 2 ];

						};

					} foreach playableUnits;

				};

				if ( [] call GTA_fnc_isHATO ) then {

					//--- HATO and West
					{ if ( side group _x == west || { [ _x ] call GTA_fnc_isHATO } ) then { _units pushBack _x } } forEach playableUnits;

					//--- Empty vehicles
					{

						if ( { alive _x } count crew _x == 0 && { ( [ _x, [ "Car_F", "Tank_F" ] ] call GTA_fnc_isKindOf ) } ) then {

							_icon = ( getText ( configFile >> "CfgVehicles" >> typeOf vehicle _x >> "icon" ) ) call BIS_fnc_textureVehicleIcon;
							_draw pushBack [ _x, _icon, [ 1, 0.5, 0, 1 ], "", 26, 0 ];

						};

					} foreach vehicles;

				};

			};

			//--- Gang
			case civilian: {

				if ( [ "teamviewer" ] call GTA_fnc_hasPerk ) then {

					_units = units group player;

				};

			};

		};

		//--- Remove player from units
		_units = _units - [ player ];

		//--- Player icon
		_draw pushBack [ player, "\a3\ui_f\data\map\Markers\System\empty_ca.paa", [ 1, 0, 0, 1 ], "", 30, 0 ];

		//--- Loop though units
		{

			private [ "_unit", "_icon", "_name", "_sideID", "_color" ];
			_unit = _x;

			if ( !( vehicle _unit in _blacklist ) && { [ _unit ] call GTA_fnc_hasGPS } ) then {

				//--- Check if player is in vehicle
				if ( vehicle _unit == _unit ) then {

					//--- On foot
					_icon = "\A3\ui_f\data\map\vehicleicons\iconmanvirtual_ca.paa";

				} else {

					//--- In vehicle
					_blacklist pushBack vehicle _unit;
					_icon = ( getText ( configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "icon" ) ) call BIS_fnc_textureVehicleIcon;

				};

				//--- Name
				_name = name ( effectiveCommander vehicle _unit );

				//--- Color
				_sideID = ( side group _unit ) call BIS_fnc_sideID;
				_color = _sideColors select _sideID;

				//--- Push to draw array
				_draw pushBack [ _unit, _icon, _color, _name, 26, 2 ];

			};

		} forEach _units;

		//--- Push to draw array
		GTA_fnc_mapDrawIcons_draw = _draw;

		sleep 2;

	};

};

//--- Add draw event handler
GTA_fnc_mapDrawIcons_drawHandle = _ctrlMap ctrlAddEventHandler [ "Draw", {

	if ( !visibleMap || { isNil "GTA_fnc_mapDrawIcons_draw" } ) exitWith {};

	//--- Draw player icons
	{

		_unit = _x select 0;
		_icon = _x select 1;
		_color = _x select 2;
		_name = _x select 3;
		_size = _x select 4;
		_shadow = _x select 5;

		( _this select 0 ) drawIcon [

			_icon,
			_color,
			getPosASLVisual vehicle _unit,
			_size,
			_size,
			getDirVisual vehicle _unit,
			_name,
			_shadow,
			.08,
			"PuristaBold",
			"right"

		];

	} foreach GTA_fnc_mapDrawIcons_draw;

} ];

//--- Wait for map to close
//waitUntil { !visibleMap };

//--- Dispose
//[] call _fnc_dispopse;
