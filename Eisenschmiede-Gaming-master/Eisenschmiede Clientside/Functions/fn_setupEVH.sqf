/*
	Master eventhandler file
*/

player addEventHandler["Killed", {_this spawn ES_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call ES_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call ES_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call ES_fnc_onTakeItem}];
player addEventHandler["Fired",{_this call ES_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call ES_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call ES_fnc_inventoryOpened}];
player addEventHandler["GetOut", {[_this select 2] call ES_fnc_PlayerGetOut}];
player addEventHandler["HandleHeal", {
    _unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
    _healer = [_this,1,objNull,[objNull]] call BIS_fnc_param;
    if(_unit != player) exitWith {};
    _text = "Person angewendet Basismedikation auf sich.";
    if(!isNull _healer && {isPlayer _healer}) then {
    	if(_healer != _unit) then
    	{
    		_text = format["%1 angewandten Basismedikation zu dieser Person.",_healer getVariable["realname",name _healer]];
    	};
    };
    [_unit,_text] call ES_fnc_medilogSubmit;
}];

"ES_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call ES_fnc_MPexec;};

// inGameUISetEventHandler ["PrevAction","removeAllActions player; false;"];
// inGameUISetEventHandler ["NextAction","removeAllActions player; false;"];
inGameUISetEventHandler ["Action","_this call ES_fnc_Action;"];

player removeAllMPEventHandlers "MPHit";
player removeAllMPEventHandlers "MPKilled";
player removeAllMPEventHandlers "MPRespawn";

removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Loaded";
removeAllMissionEventHandlers "Ended";

onEachFrame {};

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonDown";
(findDisplay 46) displayRemoveAllEventHandlers "MouseButtonUp";