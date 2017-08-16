/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
	["_object", objNull, [objNull]]
];

//--- Signs
private _signs = [
	[ "Diversion Front", "textures\signs\diversion_front.paa" ],
	[ "Diversion Left", "textures\signs\diversion_left.paa" ],
	[ "Diversion Right", "textures\signs\diversion_right.paa" ],
	[ "Diversion Ahead", "textures\signs\diversion_ahead.paa" ],
	[ "Diversion Ends", "textures\signs\diversion_ends.paa" ],
	[ "Parking Left", "textures\signs\parking_left.paa" ],
	[ "Parking Right", "textures\signs\parking_right.paa" ],
	[ "No Parking", "textures\signs\no_parking.paa" ],
	[ "Park at own risk", "textures\signs\risk.paa" ],
	[ "Restricted Area", "textures\signs\restricted_area.paa" ],
	[ "Road Closed", "textures\signs\road_closed.paa" ],
	[ "Reduce Speed", "textures\signs\reduce_speed.paa" ],
	[ "Checkpoint", "textures\signs\checkpoint.paa" ],
	[ "Checkpoint Waiting", "textures\signs\checkpoint_wait.paa" ],
	[ "Checkpoint End", "textures\signs\checkpoint_end.paa" ],
	[ "Max Speed 50", "textures\signs\max_speed.paa" ],
	[ "Highway Maintenance", "textures\signs\highway_maintenance.paa" ],
	[ "Free Recovery", "textures\signs\recovery.paa" ]
];

if ([] call GTA_fnc_isMilitary) then {
	_signs pushBack [ "NATO Checkpoint", "textures\signs\nato_checkpoint.paa" ];
};

//--- Selection
private _index = [ _signs ] call GTA_fnc_selectList;

if ( _index > -1 ) then {
	//--- Set texture
	_object setObjectTextureGlobal [ 0, ( _signs select _index ) select 1 ];
};
