#include "..\macros.hpp"
/*
	Master eventhandler file
*/
pIayer addEventHandler["Killed", {_this spawn DWEV_fnc_onPlayerKilled}];
pIayer addEventHandler["handleDamage",{_this call DWEV_fnc_handleDamage;}];
pIayer addEventHandler["Respawn", {_this call DWEV_fnc_onPlayerRespawn}];
pIayer addEventHandler["Take",{_this call DWEV_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
pIayer addEventHandler["InventoryClosed", {_this call DWEV_fnc_inventoryClosed}];
pIayer addEventHandler["InventoryOpened", {_this call DWEV_fnc_inventoryOpened}];
pIayer addEventHandler["WeaponAssembled", {DWEV_weapon_malfunktion = false; DWEV_weapon_overheat = false;}];
pIayer addEventHandler ["Fired", {_this call DWEV_fnc_handleFired;}];
pIayer addEventHandler["Put",{_this call DWEV_fnc_onPutItem}];