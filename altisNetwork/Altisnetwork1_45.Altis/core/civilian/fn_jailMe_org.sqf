#include "..\..\script_macros.hpp"
/*
    File: fn_jailMe.sqf
    Author Bryan "Tonic" Boardwine

    Description:
    Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];

params [
    ["_ret",[],[[]]],
    ["_bad",false,[false]]
];

removeVest player;
removeHeadgear player;
removeAllWeapons player;
removeBackpack player;
{player removeMagazine _x} forEach (magazines player);

player addUniform "U_B_CombatUniform_mcam_vest";

if (_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if (count _ret > 0) then { life_bail_amount = (_ret select 2); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn {
    life_canpay_bail = false;
    if (_this select 0) then {
        sleep (10 * 60);
    } else {
        sleep (5 * 60);
    };
    life_canpay_bail = nil;
};

for "_i" from 0 to 1 step 0 do {
    if ((round(_time - time)) > 0) then {
        _countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
        hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if (isNil "life_canpay_bail") then {"Yes"} else {"No"}];
    };

    if (player distance (getMarkerPos "jail_marker") > 60) exitWith {
        _esc = true;
    };

    if (life_bail_paid) exitWith {
        _bail = true;
    };

    if ((round(_time - time)) < 1) exitWith {hint ""};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    sleep 0.1;
};


switch (true) do {
    case (_bail): {
        life_is_arrested = false;
        life_bail_paid = false;
        hint localize "STR_Jail_Paid";
        serv_wanted_remove = [player];
        player setPos (getMarkerPos "jail_release");

        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };
        [(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
        [5] call SOCK_fnc_updatePartial;
    };
/*
    case (_esc): {
        life_is_arrested = false;
        hint localize "STR_Jail_EscapeSelf";
        [0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

        if (life_HC_isActive) then {
            [getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        [5] call SOCK_fnc_updatePartial;
    };
*/

    case (_esc): {
		 life_is_arrested = false;
		 [localize "STR_Jail_EscapeSelf",5,"blue"] call RPG_Fnc_Msg;
		("JAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",civilian];
		[0,"STR_Jail_EscapeDispatch",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
		[1,"STR_Jail_EscapeDispatch",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
	    if (life_HC_isActive) then {
	        [getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	    } else {
	        [getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	    };
	    [5] call SOCK_fnc_updatePartial;
		call life_fnc_saveGear;
	};

    case (alive player && !_esc && !_bail): {
        life_is_arrested = false;
        hint localize "STR_Jail_Released";

        if (life_HC_isActive) then {
            [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
        } else {
            [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        };

        player setPos (getMarkerPos "jail_release");
        
        [(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
        [5] call SOCK_fnc_updatePartial;
    };
};
