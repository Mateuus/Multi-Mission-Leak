/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if ( [ 45, "Treating Wounds", "" ] call GTA_fnc_action ) then {

	//--- Heal
	player setDamage 0;

	//--- OSM
	titleText [ "Your wounds have been treated", "PLAIN" ];

} else {

	titleText [ "Heal interrupted", "PLAIN" ];

};
