player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage", {_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take", {_this call life_fnc_onTakeItem}];
player addEventHandler["Fired", {_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["GetInMan", {_this call life_fnc_getIn}];
player addEventHandler["GetOutMan", {_this call life_fnc_getOut}];

(finddisplay 12) displayAddEventHandler["keyDown","if ((_this select 1) == 1) then {true}"];