// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_gather","_itemWeight","_diff","_itemName","_val","_requiredItem","_zone"];

if( player getVariable ["surrender", false] ) exitWith {};

//Find out what zone we're near and get its configuration
_zone = "";
_gather = "";
_val = 0;
_requiredItem = "";

{
    {
        if(player distance (getMarkerPos _x) < 40) exitWith {
            _zone = _x;
        };
    } forEach (_x select 0);

    if( _zone != "" ) exitWith {
        _gather = (_x select 1);
        _val = (_x select 2);
        _requiredItem = (_x select 3);
    };
} forEach XY_resourceZones;

if(_zone isEqualTo "" || _val isEqualTo 0 || _gather isEqualTo "" || vehicle player != player) exitWith { false; };

if( _zone find "underwater" >= 0 && { (getPosATL player) select 2 > -30 } ) exitWith { false; };

// Check if we have the required item
if( _requiredItem != "" && (missionNamespace getVariable [format["%1%2", XY_ssv_mniPrefix, _requiredItem], 0]) <= 0 ) exitWith {
    hint "Dir fehlt das passende Werkzeug!";
    false;
};

_diff = [_gather, _val, XY_carryWeight, XY_maxWeightCurrent] call XY_fnc_calcWeightDiff;
if( isNil "_diff" ) exitWith {
    diag_log format["ERROR CALCULATING DIFF: |%1|%2|%3|%4", _gather, _val, XY_carryWeight, XY_maxWeightCurrent];
    false;
};
if(_diff <= 0) exitWith {
    hint "Inventar voll";
    false;
};

// KK: Holster weapon:
if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 3;
};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
sleep 2.5;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
sleep 2.5;

if( [true, _gather, _diff] call XY_fnc_handleInv ) then {
    titleText[ format["Du hast %1 %2 gesammelt", _diff, ([_gather] call XY_fnc_itemConfig) select 2], "PLAIN" ];
};

true;