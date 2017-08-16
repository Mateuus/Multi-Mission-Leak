/*
	File: fn_gangManagement.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Called when the gang UI is initiated
*/

disableSerialization;

_sleep = [_this,0,false,[false]] call BIS_fnc_param;
if(_sleep) then { sleep 1;};

if (life_gang == "0") exitWith {hint "You are not currently a member of a gang. You must create one or receive an invitation.";closeDialog 0;};

waitUntil {!isNull (findDisplay 9620)};
_dialog = findDisplay 9620;
_members = _dialog displayCtrl 9621;
ctrlSetText[9601,player getVariable ["gangName", ""]];

ctrlEnable [9622, false];
ctrlEnable [9624, false];
ctrlEnable [9625, false];
ctrlEnable [9630, false];
ctrlEnable [1337, false];

[[player, life_gang],"ASY_fnc_gangMembers",false,false] spawn life_fnc_MP;