/*
	Master eventhandler file
*/
[] spawn
{
	waitUntil { !(isNull findDisplay 46) };
	player addEventHandler["Killed", {_this spawn life_fnc_qabrebuzewa}];
	player addEventHandler["HandleDamage",{_this call life_fnc_tratrachemu;}];
	player addEventHandler["Respawn", {_this call life_fnc_dresewatut}];
	player addEventHandler["Put",{_this call life_fnc_xuzegetrep}];
	player addEventHandler["Take",{_this call life_fnc_frutrustus}];
	player addEventHandler["Fired",{_this call life_fnc_thuspachub}];
	player addEventHandler["InventoryClosed",{_this call life_fnc_yemacruxus}];
	player addEventHandler["InventoryOpened",{_this call life_fnc_vefrecaphe}];
	player addEventHandler["HandleRating", {0}];
	player addMPEventHandler ["MPhit", "uidshooter = getPlayerUID (_this select 1);hittime = diag_tickTime;(_this select 0) setVariable ['lastHit', (_this select 1)];"];
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call life_fnc_trehutraqev"];
	true
};
removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";
inGameUISetEventHandler ["PrevAction","removeAllActions player; false;"];
inGameUISetEventHandler ["NextAction","removeAllActions player; false;"];
inGameUISetEventHandler ["Action","removeAllActions player; _this call life_fnc_kuthatrufav;"];
/*
(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";
*/
