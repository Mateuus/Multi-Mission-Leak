/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
private _gangName = ctrlText ((findDisplay 2521) displayCtrl 1400);
private _chrByte = toArray (_gangName);
private _allowed = toArray ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
private _gangCost = getNumber (missionConfigFile >> "CfgGangs" >> "life_gang_price");

if ((count _chrByte) > 32) exitWith 
{
	["Gang Name needs to be below 32 characters",true,[1,0,0,1]] call life_fnc_notificationHandler;
};

private _badChar = false;

{
	if !(_x in _allowed) exitWith 
	{
		_badChar = true;
	};
} forEach _chrByte;

if (_badChar) exitWith 
{
	["Gang Name contains bad characters",true,[1,0,0,1]] call life_fnc_notificationHandler;
};

if ([_gangName,"TSO"] call KRON_StrInStr) exitWith {};
if ([_gangName,"EMS"] call KRON_StrInStr) exitWith {};

if (an_bank < _gangCost) exitWith 
{
	["Not enough in the bank to create a gang",true,[1,0,0,1]] call life_fnc_notificationHandler;
};

[player,_gangName] remoteExec ["life_fnc_gangCreateRequest",2];
["Sending Gang Info to Server...",true,[0,1,0,1]] call life_fnc_notificationHandler;
closeDialog 0;
life_action_gangInUse = true;
