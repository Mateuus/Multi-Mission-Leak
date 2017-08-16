/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired; private ["_al_flare"]; _al_flare = _this select 6;[[[_al_flare],"core\action\fn_flare.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
