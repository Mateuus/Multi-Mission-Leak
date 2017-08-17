#include "..\..\script_macros.hpp"
/*
 Author Bryan "Tonic" Boardwine
 Description:
 Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown","_prisonvault"];
params [
 ["_ret",[],[[]]],
 ["_bad",false,[false]],
 ["_time",15,[0]]
];

_prisonvaultVariablesPos = [10044.836,6061.898,-1.612];
_prisonvault = nearestObject [_prisonvaultVariablesPos,"Land_Canal_WallSmall_10m_F"];
_time = time + (_time * 60);
if (count _ret > 0) then { 
	life_bail_amount = (_ret select 2); 
} else { 
	life_bail_amount = 1500;
};

_esc = false;
_bail = false;
if(_time <= 0) then { 
	_time = time + (15 * 60); 
	hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!";
};

[_bad,_time] spawn {
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then {
		sleep ( (_this select 1) * 0.5 );
	} else {
		sleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do {
	if((round(_time - time)) > 0) then {
		_countDown = if(round (_time - time) > 60) then {
			format["%1 Minutes",round(round(_time - time) / 60)];
		} else {
			format["%1 Seconds",round(_time - time)];
		};
 
		if(isNil "life_canpay_bail") then {
			hintSilent format["Time Remaining:\n %1\n\nCan pay Bail: %3\nBail Amount: $%2",_countDown,[life_bail_amount] call life_fnc_numberText, "Yes"];
		} else {
			hintSilent format["Time Remaining:\n %1\n",_countDown];
		};
	};
 
	if (LIFE_SETTINGS(getNumber,"jail_forceWalk") isEqualTo 1) then {
        player forceWalk true;
    };
	
	if(player distance (getMarkerPos "jail_marker") > 150) exitWith {
		_esc = true;
	};

	if(life_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 1;
};

switch (true) do {
	case (_bail): {
		life_is_arrested = false;
		player setVariable ["arrested", false, true];
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		life_is_arrested = false;
		player setVariable ["arrested", false, true];
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		player setVariable ["arrested", false, true];
		hint localize "STR_Jail_Released";
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};

player forceWalk false; // Enable running & jumping
