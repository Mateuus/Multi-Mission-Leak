#include "..\..\script_macros.hpp"

private ["_display","_list"];
disableSerialization;
if !(license_civ_bountyH) exitWith {["Only registered bounty hunters can remove bountys on peoples heads!",5,"orange"] call RPG_Fnc_Msg;};
_display = findDisplay 69690;
_list = _display displayCtrl 24020;
_data = lbData[6969,(lbCurSel 6969)];
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
if (!(_data isEqualType [])) exitWith {};
if (_data isEqualTo []) exitWith {};
private _remover = getPlayerUID player;
private _removed = _data select 0;

if (_remover isEqualTo _removed) exitWith {["You cannot remove your self from the bounty hunters list!",5,"gray"] call RPG_Fnc_Msg;};


if (life_HC_isActive) then {
    [(_data select 0)] remoteExecCall ["HC_fnc_bountyRemove",HC_Life];
} else {
    [(_data select 0)] remoteExecCall ["life_fnc_bountyRemove",RSERV];
};
