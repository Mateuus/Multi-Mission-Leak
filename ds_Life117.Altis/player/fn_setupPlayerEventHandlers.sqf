/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up all event handlers belonging to players
*/
waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DS_fnc_keyPressed"];
player addEventHandler["Killed", {_this spawn DS_fnc_playerKilled}];
player addEventHandler["Respawn", {_this call DS_fnc_playerRespawn}];
player addEventHandler["handleDamage",{_this call DS_fnc_handleDamage;}];
player addEventHandler["Fired",{_this call DS_fnc_onFired}];
player addEventHandler["Take",{_this call DS_fnc_onTakeItem}];
player addEventHandler["InventoryOpened", {_this call DS_fnc_inventoryOpened}];
//player addEventHandler["Engine", {_this call DS_fnc_useFuel}];
//player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
//player addEventHandler["Fired",{_this call life_fnc_onFired}];
//player addEventHandler["FiredNear",{_this call life_fnc_onFiredNear}];
//player addEventHandler["GetIn",{_this call life_fnc_GetIn}];

//player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
//player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];

"DS_fnc_MP_Packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call DS_fnc_MPexec;};