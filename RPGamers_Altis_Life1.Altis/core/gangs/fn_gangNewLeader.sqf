#include "..\..\script_macros.hpp"
/*
    File: fn_gangNewLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something about being a quitter.
*/
private ["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {[localize "STR_GNOTF_TransferSelect",5,"gray"] call RPG_Fnc_Msg;};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {[localize "STR_GNOTF_TransferSelf",5,"gray"] call RPG_Fnc_Msg;};

_action = [
    format [localize "STR_GNOTF_TransferMSG",_unit getVariable ["realname",name _unit]],
    localize "STR_Gang_Transfer",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    _unitID = getPlayerUID _unit;
    if (_unitID isEqualTo "") exitWith {[localize "STR_GNOTF_badUID",5,"gray"] call RPG_Fnc_Msg;}; //Unlikely?
    group player setVariable ["gang_owner",_unitID,true];
    group player selectLeader _unit;
    [_unit,group player] remoteExec ["TON_fnc_clientGangLeader",_unit]; //Boot that bitch!

    if (life_HC_isActive) then {
        [3,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
    } else {
        [3,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
    };

} else {
    [localize "STR_GNOTF_TransferCancel",5,"blue"] call RPG_Fnc_Msg;
};
[] call life_fnc_gangMenu;
