/*
	Master eventhandler file
*/

"lhm_fnc_mp_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call lhm_fnc_mpexec;};

player addEventHandler["Killed", {_this spawn lhm_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call lhm_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call lhm_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call lhm_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call lhm_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call lhm_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call lhm_fnc_inventoryOpened}];

//inGameUISetEventHandler ["PrevAction","if(isNil ""lhm_session_completed"") exitWith {}; removeAllActions player;"];
//inGameUISetEventHandler ["NextAction","if(isNil ""lhm_session_completed"") exitWith {};  removeAllActions player;"];
//inGameUISetEventHandler ["Action","if(isNil ""lhm_session_completed"") exitWith {};  removeAllActions player;"];

player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";

removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};

addMissionEventHandler ["Ended",{ _this call lhm_fnc_clientCleanup; }];

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";

//(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call lhm_fnc_keyHandler"];
//(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call lhm_fnc_mouseKeyHandler"];

[] spawn {
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	player addEventHandler["onPlayerDisconnected", {_this call SOCK_fnc_updateRequest}];
};

"LHM_clock" addPublicVariableEventHandler {(_this select 1) call lhm_fnc_hud_clockUpdate;};
