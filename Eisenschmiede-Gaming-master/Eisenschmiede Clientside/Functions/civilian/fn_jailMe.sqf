#include "..\script_macros.hpp"
/*
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];
_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"]; ["U_B_CombatUniform_mcam",true] call ES_fnc_handleItem; waitUntil {uniform player == "U_B_CombatUniform_mcam"}; removeVest player; removeHeadgear player; 

params [
	["_ret",[],[[]]],
	["_bad",false,[false]]
];


if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { ES_bail_amount = SEL(_ret,3); } else { ES_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn {
	ES_canpay_bail = false;
	if(_this select 0) then {
		sleep (10 * 60);
	} else {
		sleep (5 * 60);
	};
	ES_canpay_bail = nil;
};

while {true} do {
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[ES_bail_amount] call ES_fnc_numberText,if(isNil "ES_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith {
		_esc = true;
	};
	
	if(ES_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do {
	case (_bail): {
		ES_is_arrested = false;
		ES_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] remoteExec ["ES_fnc_wantedRemove",2];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		ES_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExec ["ES_fnc_broadcast",-2];
		[getPlayerUID player,profileName,"901"] remoteExec ["ES_fnc_wantedAdd",2];
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail): {
		ES_is_arrested = false;
		hint localize "STR_Jail_Released";
		[getPlayerUID player] remoteExec ["ES_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};