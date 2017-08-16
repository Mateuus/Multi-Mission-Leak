/*
    File: fn_receiveItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Receive an item from a player.
*/
// @TODO KK: This sucks and needs to be rewritten, nice and clean

private _unit = param[0, objNull, [objNull]];
private _item = param[1, "", [""]];
private _val = param[2, -1, [0]];
private _from = param[3, objNull, [objNull]];

if( isNull _unit || { _unit != player } || { isNull _from } || { _val <= 0 } || { _item isEqualTo "" } ) exitWith {};

if( (_item find "si_") isEqualTo 0 ) exitWith {
     private _licenseName = [_item, (count _item) - 3] call KRON_StrRight;
     private _license = objNull;
    {
        if( (_x select 0) isEqualTo _licenseName ) exitWith {
            _license = _x;
        };
    } forEach (XY_licenses + XY_training);

    if( _license isEqualTo objNull ) exitWith {
        diag_log format["receiveItemLicense failed (%1)", _this];
        hint "Du hast ein wertloses Dokument erhalten";
    };

    private _licenseSide = switch( _license select 1 ) do {
        case( "cop" ): { west };
        case( "thw" ): { east };
        case( "med" ): { independent };
        default { civilian };
    };

    if( playerSide != _licenseSide ) exitWith {
        diag_log format["receiveItemLicense failed (%1) - side check failure", _this];
        hint "Du hast ein wertloses Dokument erhalten";
    };

    hint format["Du hast die Lizenz '%1' erhalten", _license select 2];
    missionNamespace setVariable[_licenseName, true];
    [] call XY_fnc_updateRequest;
};

private _diff = [_item, _val, XY_carryWeight, XY_maxWeightCurrent] call XY_fnc_calcWeightDiff;
private _config = [_item] call XY_fnc_itemConfig;

if( _diff != _val ) then {
    if(([true,_item,_diff] call XY_fnc_handleInv)) then {
        hint format[localize "STR_MISC_TooMuch_3", _from getVariable["realName", name _from], _val, _diff, _val - _diff];
        [_from, _item, _val - _diff, _unit] remoteExec ["XY_fnc_giveDiff", _from];
        [getPlayerUID player, 2, format ["Hat von %1 (%2) %3x %4 erhalten", name _from, getPlayerUID _from, _diff, _config select 2]] remoteExec ["XYDB_fnc_log", XYDB];
    } else {
        [_from, _item, _val, _unit, false] remoteExec ["XY_fnc_giveDiff", _from];
    };
} else {
    if(([true, _item, _val] call XY_fnc_handleInv)) then {
        hint format[localize "STR_NOTF_GivenItem", _from getVariable["realName", name _from], _val, _config select 2];
        [getPlayerUID player, 2, format ["Hat von %1 (%2) %3x %4 erhalten", name _from, getPlayerUID _from, _val, _config select 2]] remoteExec ["XYDB_fnc_log", XYDB];
    } else {
        [_from, _item, _val, _unit, false] remoteExec ["XY_fnc_giveDiff", _from];
    };
};
XY_forceSaveTime = time + 8;