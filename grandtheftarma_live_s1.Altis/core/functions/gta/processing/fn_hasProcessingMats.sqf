/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_materials", "_return" ];
_materials = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_return = false;

//--- Check if player has the required materials
{

	private "_var";
	_var = [ _x select 0, 0 ] call life_fnc_varHandle;

	//--- Check if player has required number of material
	_return = !( missionNamespace getVariable [ _var, 0 ] < _x select 1 );

	//--- Exit if return is false
	if ( !_return ) exitWith {};

} forEach _materials;

_return
