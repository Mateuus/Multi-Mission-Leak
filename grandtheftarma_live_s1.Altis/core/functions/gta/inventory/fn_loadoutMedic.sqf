/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_medRank";
_medRank = [ "GTA_medRank" ] call GTA_fnc_const;

//--- Strip
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

//--- Add
player forceAddUniform "U_B_CombatUniform_mcam";

player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemRadio";
player linkItem "ItemWatch";
player linkItem "NVGoggles";

player addItem "FirstAidKit";
player addItem "FirstAidKit";

player addBackpack "B_Carryall_khk";
player addItem "Medikit";

//--- Binocular or rangefinder check
if ( _medRank >= 4 )  then {

	player addWeapon "Rangefinder";

} else {

	player addWeapon "Binocular";

};

//-- Virtual items
[ true, "water", 5 ] call life_fnc_handleInv;

if ( _medRank < 3 )  then {

	[ true, "apple", 5 ] call life_fnc_handleInv;

};

if ( _medRank >= 3 )  then {

	[ true, "salad", 5 ] call life_fnc_handleInv;
	[ true, "lockpick", 2 ] call life_fnc_handleInv;

  if ( _medRank >= 4 )  then {

    [ true, "fuelF", 1 ] call life_fnc_handleInv;

  };

};
