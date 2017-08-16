player addEventHandler["Killed", { _this spawn XY_fnc_onPlayerKilled; } ];
player addEventHandler["HandleDamage", { _this call XY_fnc_handleDamage; } ];
player addEventHandler["Respawn", { _this call XY_fnc_onPlayerRespawn; } ];
player addEventHandler["Fired", { _this call XY_fnc_onFired; } ];

player addEventHandler["InventoryOpened", { _this call XY_fnc_inventoryOpened; } ];
player addEventHandler["InventoryClosed", { _this call XY_fnc_inventoryClosed; } ];

player addEventHandler["Put", { XY_forceSaveTime = time + 3; _this call XY_fnc_onPutItem; }];
player addEventHandler["Take", { XY_forceSaveTime = time + 3; _this call XY_fnc_onTakeItem; } ];