scriptName "fn_giveUnitLoadout";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_giveUnitLoadout.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_giveUnitLoadout.sqf"

_unit = param[0,objNull,[objNull]];

// Get gear
_gear = getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "ConvoyConfigurationsPool" >> mav_convoy_class >> "AIUnits" >> "gear");

// Assign gear to unit
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit addHeadgear (_gear select 0);
_unit addGoggles (_gear select 1);
_unit forceAddUniform (_gear select 2);
_unit addVest (_gear select 3);
_unit addBackpackGlobal (_gear select 4);

// Assign weapons and ammunition
for "_i" from 1 to (_gear select 5 select 2) do {_unit addItemToUniform (_gear select 5 select 1);};
_unit addWeaponGlobal (_gear select 5 select 0);

for "_i" from 1 to (_gear select 6 select 2) do {_unit addItemToUniform (_gear select 6 select 1);};
_unit addWeaponGlobal (_gear select 6 select 0);