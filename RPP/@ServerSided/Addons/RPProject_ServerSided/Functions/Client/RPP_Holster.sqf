/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Holster.sqf

Description:
Holster
*/
["RPP_Holster_Rifle", {
	if (["Rifle Bag"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You need a Rifle Bag";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_Rifle_Holstered isEqualTo "") then {
		RPP_Rifle_Holstered = currentWeapon player;
		RPP_Rifle_Holstered_Mag = currentMagazine player;
		player removeWeapon currentWeapon player;
		_msg = "Weapon Holstered.";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	} else {
		player addmagazine RPP_Rifle_Holstered_Mag; 
		player addWeapon RPP_Rifle_Holstered;
		_msg = "Weapon UnHolstered.";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		RPP_Rifle_Holstered = "";
	};
}] call RPP_Function;
publicVariable "RPP_Holster_Rifle";