/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Sets up all event handlers belonging to players
*/

waitUntil {!(isNull (findDisplay 46))};

(findDisplay 46) displayAddEventHandler ["KeyDown","_this call DS_fnc_keyPressed"];
player addEventHandler ["Killed",{_this spawn DS_fnc_playerKilled}];
player addEventHandler ["Respawn",{_this call DS_fnc_playerRespawn}];
player addEventHandler ["HandleDamage",{_this call DS_fnc_handleDamage;}];
//player addEventHandler ["HandleHeal",{_this call DS_fnc_handleHeal;}];
player addEventHandler ["Fired",{_this call DS_fnc_onFired}];
player addEventHandler ["InventoryOpened",{_this call DS_fnc_inventoryOpened}];
player addEventHandler ["GetInMan",{_this call DS_fnc_getIn}];
player addEventHandler ["SeatSwitchedMan",{_this call DS_fnc_seatSwitched}];