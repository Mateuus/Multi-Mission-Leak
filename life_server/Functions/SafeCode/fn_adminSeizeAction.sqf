//////////////////////////////////////////////////////////////////
// Created by: Kevin for admin seize
// Function Name: adminSeizeAction.sqf
// Description: Removes Players Weapons after RDM
// Adapted from the generic seize weapons script
//////////////////////////////////////////////////////////////////

private["_admin"];
_admin = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

removeAllWeapons player;
removeVest player;
removeBackpack player;
removeHeadGear player;
license_civ_bh = false;
if(life_inv_boltcutter > 0) then {[false,"boltcutter",life_inv_boltcutter] call life_fnc_handleInv;};

titleText [format["Since you broke the rules by random deathmatching, your weapons have been removed by Admin %1.",name _admin],"PLAIN"];
