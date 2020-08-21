#include "..\..\script_macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];

params [
	["_ret",[],[[]]],
	["_bad",false,[false]],
	["_time",15,[0]]
];

_time = time + (_time * 60); //x Minutes

if(count _ret > 0) then { life_bail_amount = SEL(_ret,2); } else { life_bail_amount = 1500; };
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Napisz do Admina: JAIL_FALLBACK_15, czas jest zero!"; };
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

for "_i" from 0 to 1 step 0 do {
	if((round(_time - time)) > 0) then {
		_countDown = if(round (_time - time) > 60) then {format["%1 minut(y)",round(round(_time - time) / 60)]} else {format["%1 sekund(y)",round(_time - time)]};
	        if(isNil "life_canpay_bail") then {
	            hintSilent format["Pozostały Czas:\n%1\nKaucja:\n$%2",_countDown,[life_bail_amount] call life_fnc_numberText];
	        } else {
	            hintSilent format["Pozostały Czas:\n %1\n",_countDown];
	        };
	};
	
	if(player distance (getMarkerPos "jail_marker") > 180) exitWith {
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
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		
		if(life_HC_isActive) then {
			[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
		} else {
			[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		};
		
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		if(life_HC_isActive) then {
			[getPlayerUID player,profileName,"901"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		} else {
			[getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		};
		
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		
		if(life_HC_isActive) then {
			[getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
		} else {
			[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		};
		
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};
