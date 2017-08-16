/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_primary", "_name", "_type", "_magazines" ];

{

	//--- Get weapon config
	_name = getText ( configFile >> "CfgWeapons" >> _x >> "displayName" );
	_type = getNumber ( configFile >> "CfgWeapons" >> _x >> "type" );
	_magazines = getArray ( configFile >> "CfgWeapons" >> _x >> "magazines" );

	//--- Check type
	if ( _type in [ 1, 2 ] ) then {

		//--- Remove weapon
		if ( _x in items player ) then {

			player removeItem _x;

		} else {

			player removeWeapon _x;

		};

		//--- Magazines
		{

			//--- Check if magazine fits the weapon
			if ( _x in _magazines ) then {

				//--- Remove magazine
				player removeMagazine _x;

			};

		} forEach magazines player;

		//--- Broadcast
		[ [ 0, [ "STR_GTA_ACTIONS_SEIZEWEAPON", profileName, _name ] ], "GTA_fnc_broadcast" ] call GTA_fnc_remoteExec;

	};

} forEach weapons player;

//--- Update
[ 3 ] call GTA_fnc_updatePlayerPartial;
