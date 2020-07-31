#include "..\..\script_macros.hpp"
/*
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];

params [
	["_ret",[],[[]]],
	["_bad",false,[false]]
];


//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };
_time = life_arrestedTime * 60;

//if(count _ret > 0) then { life_bail_amount = SEL(_ret,3); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_tick = 0;
_bail = false;
_bailMultiplayer = 3000;
life_bail_amount = life_arrestedTime * _bailMultiplayer;

[_bad] spawn {
	life_canpay_bail = false;
	if(_this select 0) then {
		sleep (10 * 60);
	} else {
		sleep (5 * 60);
	};
	life_canpay_bail = nil;
};
while {true} do {
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith {
		_esc = true;
	};
	
	if(life_bail_paid) exitWith {
		_bail = true;
	};
	_tick = _tick + 0.1;
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	if(_tick == 60) then {
		_tick = 0;
		life_arrestedTime = life_arrestedTime - 1;
		life_bail_amount = life_bail_amount - _bailMultiplayer;
		[5] call SOCK_fnc_updatePartial;
	};
	sleep 0.1;
};

switch (true) do {
	case (_bail): {
		life_is_arrested = false;
		life_bail_paid = false;
		life_arrestedTime = 0;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[getPlayerUID player,profileName,"901"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		life_arrestedTime = 0;
		hint localize "STR_Jail_Released";
		[getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};