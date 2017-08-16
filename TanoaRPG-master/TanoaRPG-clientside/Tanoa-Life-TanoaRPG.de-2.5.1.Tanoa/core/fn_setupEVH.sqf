/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn tanoarpg_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call tanoarpg_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call tanoarpg_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call tanoarpg_fnc_onTakeItem}]; //Skins and so on
player addEventHandler["Fired",{_this call tanoarpg_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call tanoarpg_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call tanoarpg_fnc_inventoryOpened}];
//"tanoarpg_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call tanoarpg_fnc_MPexec;};