/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/

player addEventHandler["Killed", {_this call life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["Fired",{_this call life_fnc_tazerFix}];
player addEventHandler["FiredNear", {_this call life_fnc_antiCombatRevive}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["GetInMan", {_this call life_fnc_vis_setup}];
player addEventHandler["GetInMan", {_this call life_fnc_getInSZ}];
player addEventHandler["GetOutMan", {vis_saveNow = true}];
player addEventHandler["Killed", {vis_saveNow = true}];
//player addEventHandler["GetOutMan", {_this call life_fnc_forceHolster}]; //holster weapons fuck off

//player addEventHandler["GetOut", {(_this select 0) setVariable ["lastVehUpdate",serverTime,true]}];

[] spawn {
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	player addEventHandler["onPlayerDisconnected", {_this call SOCK_fnc_updateRequest}];
};