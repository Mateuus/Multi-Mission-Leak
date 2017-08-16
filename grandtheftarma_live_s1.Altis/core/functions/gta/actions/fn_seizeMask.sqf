/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_update";
_update = [ _this, 0, true, [true] ] call GTA_fnc_param;

{

	//--- Goggles
	if ( _x in ( GTA_masks select 0 ) ) then {

		//--- Remove
		removeGoggles player;

	};

	//--- Headgear
	if ( _x in ( GTA_masks select 1 ) ) then {

		//--- Remove
		removeHeadgear player;

	};

	//--- Uniform
	if ( _x in ( GTA_masks select 2 ) ) then {

		private [ "_uniform", "_uniformItems" ];

		//--- Replacement uniform
		_uniform = switch _x do {

			case "U_B_GhillieSuit": { "U_B_CombatUniform_mcam" };
			case "U_O_GhillieSuit": { "U_O_CombatUniform_ocamo" };
			case "U_I_GhillieSuit": { "U_I_CombatUniform_shortsleeve" };
			case "U_I_FullGhillie_ard": { "U_I_CombatUniform_shortsleeve" };
			case "U_I_FullGhillie_sard": { "U_I_CombatUniform_shortsleeve" };
			case "U_I_FullGhillie_lsh": { "U_I_CombatUniform_shortsleeve" };

		};

		//--- Uniform items
		_uniformItems = uniformItems player;

		//--- Remove
		removeUniform player;

		//--- Replace
		if ( !isNil "_uniform" ) then {

			player forceAddUniform _uniform;
			{ player addItemToUniform _x } forEach _uniformItems;

			[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;

		};

	};

} forEach [ goggles player, headgear player, uniform player ];

//--- Update
if ( _update ) then {

	[ 3 ] call GTA_fnc_updatePlayerPartial;

};
