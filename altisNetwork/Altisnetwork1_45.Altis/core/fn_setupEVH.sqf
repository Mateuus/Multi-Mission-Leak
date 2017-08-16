/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];

addMissionEventHandler ["Draw3D", {call life_fnc_PlayerTags;}];

if (!isDedicated) then { waitUntil {!(isNull player)}; };

"life_phone_channel" addPublicVariableEventHandler
{
	_message = if (life_phone_channel < 0) then { "Your phone call has ended." } else { "Phone link established!" };
	if (life_phone_channel < 0) then { playSound "PhoneHangup"; };
	[[0,2], _message] call life_fnc_broadcast;
	if (life_phone_channel > -1) then { life_phone_status = 3; setCurrentChannel life_phone_channel; };
};