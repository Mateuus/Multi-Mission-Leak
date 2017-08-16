#include "..\..\script_macros.hpp"
/*
    File: fn_jailMe.sqf
    Author Bryan "Tonic" Boardwine

    Description:
    Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown","_spawnPos"];

params [
    ["_ret",[],[[]]],
    ["_bad",false,[false]]
];


if (_bad) then { _time = time + 2500; } else { _time = time + (15 * 60); };

if (count _ret > 0) then { life_bail_amount = (_ret select 2); } else { life_bail_amount = 100000; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn {
    life_canpay_bail = false;
    if (_this select 0) then {
        uiSleep (10 * 60);
    } else {
        UiSleep (7 * 60);
    };
    life_canpay_bail = true;
};

for "_i" from 0 to 1 step 0 do {
    if ((round(_time - time)) > 0) then {
        _countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
        hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if (life_canpay_bail) then {"Yes"} else {"No"}];
    };

    if (player distance (getMarkerPos "jail_marker") > 600) exitWith {
        _esc = true;
    };

    if (life_bail_paid) exitWith {
        _bail = true;
    };

    if ((round(_time - time)) < 1) exitWith {hint ""};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    uiSleep 0.1;
};


switch (true) do {
    case (_bail): {
        life_is_arrested = false;
		life_istazed = false;
        life_bail_paid = false;
        hint localize "STR_Jail_Paid";
        serv_wanted_remove = [player];	
		_SpawnLocation = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250]; 
		_SpawnLocation = _SpawnLocation call BIS_fnc_selectRandom;
		_SpawnLocation = _SpawnLocation buildingPos 0;
		_position = _SpawnLocation;
		Uisleep 0.1;
		player setPos (_position);
		player allowdamage true;

        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };

        [5] call SOCK_fnc_updatePartial;

    };

    case (_esc): {
        life_is_arrested = false;
		life_istazed = false;
        hint localize "STR_Jail_EscapeSelf";
        [0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		player allowdamage true;
		
        if (life_HC_isActive) then {
            [getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        [5] call SOCK_fnc_updatePartial;

    };

    case (alive player && !_esc && !_bail): {
        life_is_arrested = false;
		life_istazed = false;
        hint localize "STR_Jail_Released";

        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };
		player allowdamage true;
		_SpawnLocation = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250]; 
		_SpawnLocation = _SpawnLocation call BIS_fnc_selectRandom;
		_SpawnLocation = _SpawnLocation buildingPos 0;
		_position = _SpawnLocation;
		Uisleep 0.1;
		player setPos (_position);
        [5] call SOCK_fnc_updatePartial;

    };
};
