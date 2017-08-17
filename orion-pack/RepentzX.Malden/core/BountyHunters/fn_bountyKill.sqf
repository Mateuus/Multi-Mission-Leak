#include "..\..\script_macros.hpp"
/*
    File: fn_bountyKill.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Removes the bounty on a selected player.
*/
private ["_display","_list"];
disableSerialization;
if !(license_civ_bountyH) exitWith {["Only registered bounty hunters can remove bountys on peoples heads!",false,"slow"] call life_fnc_notificationSystem;};
_display = findDisplay 66600;
_list = _display displayCtrl 24020;
_data = lbData[77700,(lbCurSel 77700)];
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
if (!(_data isEqualType [])) exitWith {};
if (_data isEqualTo []) exitWith {};
private _remover = getPlayerUID player;
private _removed = _data select 0;

//if (_remover isEqualTo _removed) exitWith {["You cannot remove your self from the bounty hunters list! You must die to be removed!",false,"slow"] call life_fnc_notificationSystem;};


if (life_HC_isActive) then {
    [(_data select 0)] remoteExecCall ["HC_fnc_bountyRemove",HC_Life];
} else {
    [(_data select 0)] remoteExecCall ["life_fnc_bountyRemove",RSERV];
};
