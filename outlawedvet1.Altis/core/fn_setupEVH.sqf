/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
#define SAFETY_ZONES    [["campnorth", 300],["campsouth", 300],["spawn_island", 200],["Donator_Zone_1", 280]]


player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
             deleteVehicle (_this select 6);
             titleText ["You Are In A Safe Zone! Shooting, damaging, trolling, ect... is not allowed!", "PLAIN", 2];
             } else {
			 _this call life_fnc_onFired;
			 };
}]; 
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
[] spawn {
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	player addEventHandler["onPlayerDisconnected", {_this call SOCK_fnc_updateRequest;}];
};