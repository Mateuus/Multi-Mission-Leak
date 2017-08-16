/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_interactions" ];
_object = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_interactions = [];

//--- Error checks
if !( [ player, _object, 2 ] call GTA_fnc_boundingCollision ) exitWith { _interactions };
if ( !isNull attachedTo _object && { attachedTo _object != player } ) exitWith { _interactions };

//--- West, HATO or Admin
if ( playerSide == west || { [] call GTA_fnc_isHATO } || { [ "GTA_adminLevel" ] call GTA_fnc_const >= 3 } ) then {

	//--- Move
	_interactions pushBack [ "Move", GTA_fnc_buildGuide ];

	//--- Dismantle
	_interactions pushBack [ "Dismantle", GTA_fnc_buildDismantle ];

	//--- Level
	_interactions pushBack [ "Level", { _this setVectorUp [ 0, 0, 5 ] } ];

	//--- Flush
	_interactions pushBack [ "Flush", { _this setVectorUp surfaceNormal ( _this modelToWorldVisual [ 0, 0, 0 ] ) } ];

	//--- Paint sign
	if ( typeOf _object == "SignAd_Sponsor_F" ) then {

		_interactions pushBack [ "Paint Sign", GTA_fnc_buildSign ];

	};

};

_interactions
