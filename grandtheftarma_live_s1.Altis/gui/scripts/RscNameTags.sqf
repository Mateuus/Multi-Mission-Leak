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

		GTA_RscNameTags_drawObjects = [];

		//--- Display
		_display = _params select 0;

		//--- Thread
		GTA_RscNameTags_loopHndl = [ "loop", [ _display ] ] spawn GTA_RscNameTags_script;

		//--- Add Draw3D event handler
		if ( isNil "GTA_RscNameTags_draw3DHndl" ) then {

			GTA_RscNameTags_draw3DHndl = addMissionEventHandler [ "Draw3D" , { [ "draw3D", _this ] call GTA_RscNameTags_script } ];

		};

	};

	case "onUnload": {

		//--- Terminate loop
		if ( !isNil "GTA_RscNameTags_loopHndl" ) then { terminate GTA_RscNameTags_loopHndl };

		//--- Remove Draw3D EH
		if ( !isNil "GTA_RscNameTags_draw3DHndl" ) then { removeMissionEventHandler [ "Draw3D", GTA_RscNameTags_draw3DHndl ] };

		//--- Destroy vars
		GTA_RscNameTags_drawObjects = nil;
		GTA_RscNameTags_loopHndl = nil;
		GTA_RscNameTags_draw3DHndl = nil;

	};

	case "loop": {

		disableSerialization;

		//--- Display
		_display = _params select 0;
		_titleColor = [ .2, 1, 0, 1 ] call GTA_fnc_colorRGBtoHTML;
		_iconColor = [ 1, 1, 1, 1 ] call GTA_fnc_colorRGBtoHTML;

		while { !isNull _display } do {

			_drawObjects = [];

			//--- Check if loop should collect nearby objects
			_objects = if ( visibleMap || { !alive player } || { dialog } ) then {

				//--- Don't draw
				[]

			} else {

				//--- Get nearby objects
				( nearestObjects [ player call GTA_fnc_getPos3D, [ "Man", "Car_F", "Tank_F", "Ship_F", "Air", "Land_Pallet_MilBoxes_F", "Land_Sink_F", "Land_InfoStand_V2_F", "Land_Device_assembled_F", "Land_Laptop_unfolded_F", "Land_InfoStand_V1_F" ], 15 ] ) - [ player ]

			};

			//--- Index
			_i = 0;

			//--- Loop through objects
			{

				_object = _x;

				_title = _object getVariable "nametag_title";
				_subtitle = _object getVariable "nametag_subtitle";
				_prefix = _object getVariable "nametag_prefix";
				_icon = _object getVariable "nametag_icon";

				_masked = [ _object ] call GTA_fnc_isMasked;
				_hidden = ( uniform _object in [ "U_B_FullGhillie_ard", "U_B_FullGhillie_sard", "U_B_FullGhillie_lsh", "U_I_FullGhillie_ard", "U_I_FullGhillie_sard", "U_I_FullGhillie_lsh" ] && { stance _object in [ "CROUCH", "PRONE" ] } );
				_gangName = ( group _object ) getVariable [ "gang_name", "" ];
				_copRank = _object getVariable [ "cop_rank", -1 ];
				_milRank = _object getVariable [ "mil_rank", -1 ];
				_medRank = _object getVariable [ "med_rank", -1 ];
				_hatoRank = _object getVariable [ "hato_rank", -1 ];

				//--- Check draw conditions
				if ( !isNil "_title" && { !_hidden } && { !( _object getVariable [ "nametag_hide", false ] ) } && { !( lineIntersects [ eyePos vehicle player, eyePos _object, vehicle player, _object ] ) } ) then {

					//--- Masked
					if ( _masked && { _object isKindOf "Man" } && { alive _object } ) then {

						//--- Player is a group member
						if !( _object in units group player ) then {

							_title = "Unknown";
							_subtitle = "Masked Player";
							_prefix = "";

						};

						_icon = "textures\icons\mask.paa";

					};

					//--- Prefix
					if ( isNil "_prefix" ) then {

						_prefix = switch true do {

							//--- Cop rank
							case ( _copRank > 0 ): {

								switch _copRank do {

									case 1: { "CSO" };
									case 2: { "PCSO" };
									case 3: { "PC" };
									case 4: { "PC" };
									case 5: { "PC" };
									case 6: { "SPC" };
									case 7: { "SGT" };
									case 8: { "Insp" };
									case 9: { "C/Insp" };
									case 10: { "Supt" };
									case 11: { "C/Supt" };
									case 12: { "CC" };

								};

							};

							//--- Military rank
							case ( _milRank > 0 ): {

								switch _milRank do {

									case 1: { "Pvt." };
									case 2: { "L/Cpl." };
									case 3: { "Cpl." };
									case 4: { "Sgt." };
									case 5: { "Lieut." };
									case 6: { "Capt." };
									case 7: { "Maj." };
									case 8: { "Col." };

								};

							};

							//--- Medic rank
							case ( _medRank > 0 ): {

								switch _medRank do {

									case 1: { "HCA" };
									case 2: { "Nurse" };
									case 3: { "Dr." };
									case 4: { "Surgeon" };
									case 5: { "Director" };
									case 6: { "CEO" };

								};

							};

							//--- HATO rank
							case ( _hatoRank > 0 ): {

								switch _hatoRank do {

									case 1: { "T." };
									case 2: { "T/O." };
									case 3: { "SOOC." };
									case 4: { "T/M." };
									case 5: { "O/M." };

								};

							};

							default { "" };

						};

					};

					//--- Space the prefix
					if ( _prefix != "" ) then {

						_prefix = _prefix + " ";

					};

					//--- Subtitle
					if ( isNil "_subtitle" ) then {

						_subtitle = switch true do {

							//--- Cop
							case ( _copRank > 0 ): { "Altis Constabulary" };

							//--- Military
							case ( _milRank > 0 ): { "NATO" };

							//--- HATO
							case ( _hatoRank > 0 ): { "Highways Altis" };

							//--- Paramedic
							case ( _medRank > 0 ): { "NHS" };

							//--- Gang
							case ( _gangName != "" ): { _gangName };

							default { "" };

						};

					};

					//--- Icon
					if ( isNil "_icon" ) then {

						//--- Check if object has a rank
						_icon = switch true do {

							//--- Cop rank
							case ( _copRank > 0 ): {

								switch _copRank do {

									case 3: { "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa" };
									case 4: { "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa" };
									case 5: { "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa" };
									case 6: { "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa" };
									case 7: { "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa" };
									case 8: { "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa" };
									case 9: { "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa" };
									case 10: { "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa" };
									case 11: { "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa" };
									case 12: { "\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa" };
									default { "" };

								}

							};

							//--- Military rank
							case ( _milRank > 0 ): {

								switch _milRank do {

									case 2: { "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa" };
									case 3: { "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa" };
									case 4: { "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa" };
									case 5: { "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa" };
									case 6: { "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa" };
									case 7: { "\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa" };
									case 8: { "\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa" };
									default { "" };

								}

							};

							//--- HATO rank
							case ( _hatoRank > 0 ): { "textures\hato\icon_hato.paa" };

							//--- Medic rank
							case ( _medRank > 0 ): { "\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa" };

							default { "" };

						};

					};

					//--- Icon structured text
					if ( _icon != "" ) then {

						_icon = format [ "<img image='%1' size='1' align='center' color='%2' />", _icon, _iconColor ];

					};

					//--- Add the icon and title
					_text = format [ "%1<br /><t align='center' color='%2'>%3%4</t>", _icon, _titleColor, _prefix, _title ];

					//--- Add the subtitle
					if ( _subtitle != "" ) then {

						_text = format [ "%1<br /><t font='PuristaMedium' align='center' size='0.85' color='%2'>%3</t>", _text, "#ffffff", _subtitle ];

					};

					//--- Tag IDC
					_idc = IDC_RSCNAMETAGS_TAG + _i;

					//--- Push the object to objects array
					_drawObjects pushBack [ _object, parseText _text, _display displayCtrl _idc ];

					//--- Increment index
					_i = _i + 1;

				};

				sleep 0.01;

			} forEach _objects;

			//--- Hide unused tags
			for "_x" from ( count _drawObjects ) to 110 do {

				_ctrl = ( _display displayCtrl IDC_RSCNAMETAGS_TAG + _x );

				_ctrl ctrlShow false;
				_ctrl ctrlSetStructuredText parseText "";

			};

			GTA_RscNameTags_drawObjects = _drawObjects;

			sleep 0.5;

		};

		//--- RscNameTags layer
		[ "GTA_RscNameTags" ] call GTA_fnc_createRscLayer;

	};

	case "draw3D": {

		//--- Loop through objects
		{

			_object = _x select 0;
			_text = _x select 1;
			_ctrl = _x select 2;

			//--- Set control text
			_ctrl ctrlSetStructuredText _text;

			//--- Get the object's 3d position in render scope
			private	"_pos";
			switch true do {

				case ( _object isKindOf "Man" ): {

					_pos = _object selectionPosition "head";
					_pos = [ 0, 0, ( _pos select 2 ) + 0.6 ];
					_pos = _object modelToWorldVisual _pos;

				};

				case ( typeOf _object == "Land_Pallet_MilBoxes_F" );
				case ( typeOf _object == "Land_Sink_F" );
				case ( typeOf _object == "Land_InfoStand_V2_F" );
				case ( typeOf _object == "Land_Device_assembled_F" ): {

					_pos = _object call GTA_fnc_getPos3D;
					_pos set [ 2, ( _pos select 2 ) + 1.8 ];

				};

				case ( typeOf _object == "Land_Laptop_unfolded_F" ): {

					_pos = _object call GTA_fnc_getPos3D;
					_pos set [ 2, ( _pos select 2 ) + 0.8 ];

				};

				default {

					_pos = boundingBoxReal _object;
					_pos = _object modelToWorldVisual [ 0, 0, ( _pos select 1 ) select 2 ];

				};

			};

			//--- Convert position to 2D screen coordinates
			_posScreen = worldToScreen _pos;

			//--- Check if screen position is visible
			if ( count _posScreen > 1 ) then {

				_ctrlPos = ctrlPosition _ctrl;

				//--- Control screen position and dimensions
				_pW = _ctrlPos select 2;
				_pH = _ctrlPos select 3;
				_pX = ( _posScreen select 0 ) - ( _pW / 2 );
				_pY = _posScreen select 1;

				//--- Set the screen position
				_ctrl ctrlSetPosition [ _pX, _pY, _pW, _pH ];
				_ctrl ctrlCommit 0;

				if !( ctrlShown _ctrl ) then {

					_ctrl ctrlShow true;

				};

			} else {

				//--- Don't display tag
				_ctrl ctrlShow false;

			};

			//--- Revive
			if ( isPlayer _object && { alive _object } && { _object getVariable [ "incapacitated", false ] } ) then {

				drawIcon3D [
					"\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa",
					[ 0.75, 0, 0, 0.9 ],
					_object modelToWorld ( _object selectionPosition "Spine3" ),
					0.6,
					0.6,
					0,
					"",
					1
				];

			};

		} count GTA_RscNameTags_drawObjects;

	};

};
