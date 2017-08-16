/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Strip
removeUniform player;
removeVest player;
removeBackpackGlobal player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

//--- Assign items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

//--- Random uniform
player forceAddUniform ( [

	"U_NikosBody",
	"U_C_Poor_1",
	"U_C_Poloshirt_burgundy",
	"U_OrestesBody",
	"U_C_Poloshirt_tricolour",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_C_Commoner_shorts",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_ShirtSurfer_shorts",
	"U_C_TeeSurfer_shorts_1"

] call BIS_fnc_selectRandom );

//--- Random fedora
player addHeadgear ( [

	"H_StrawHat",
	"H_StrawHat_dark",
	"H_Hat_blue",
	"H_Hat_brown",
	"H_Hat_grey",
	"H_Hat_checker",
	"H_Hat_tan"

] call BIS_fnc_selectRandom );

//--- GPS perk
if ( [ "chauffeur" ] call GTA_fnc_hasPerk ) then {

	player linkItem "ItemGPS";

};

//--- Nightvision perk
if ( [ "night_owl" ] call GTA_fnc_hasPerk && { hmd player == "" } ) then {

	player linkItem "NVGoggles_INDEP";

};
