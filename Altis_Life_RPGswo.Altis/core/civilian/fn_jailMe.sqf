#include "..\..\macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = param [0,[],[[]]];
_bad = param [1,false,[false]];
_time = param [2,15,[0]];

_time = time + (_time * 60); 

if(count _ret > 0) then { DWEV_bail_amount = (_ret select 3); } else { DWEV_bail_amount = 1500; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Melde es einem Admin: JAIL_FALLBACK_15, Zeit ist null!"; };

[_bad,_time] spawn
{
	DWEV_canpay_bail = false;
	if(_this select 0) then
	{
		sleep ( (_this select 1) * 0.5 );
	}
		else
	{
		sleep ( (_this select 1) * 0.2 );
	};
	DWEV_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 Minute(n)",round(round(_time - time) / 60)]} else {format["%1 sekunde(n)",round(_time - time)]};
		if(isNil "DWEV_canpay_bail") then
		{
			hintSilent format["Verbleibende Zeit:\n %1\n\nKann Kaution zahlen:\nKautionspreis: %2€",_countDown,[DWEV_bail_amount] call DWEV_fnc_numberText];
		}
		else
		{
			hintSilent format["Verbleibende Zeit:\n %1\n",_countDown];
		};	
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith
	{
		_esc = true;
	};
	
	if(DWEV_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if (DWEV_restart_cleanup) exitWith 	{};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith{};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		DWEV_is_arrested = false;
		DWEV_bail_paid = false;
		hint "Du hast die Kaution gezahlt und bist nun frei.";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		pIayer additem "ItemMap";
		player assignItem "ItemMap";
		pIayer additem "ItemRadio";
		player assignItem "ItemRadio";
		[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
		
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		DWEV_is_arrested = false;
		hint "Du bist aus dem Knast entkommen, du behälst deine Straftaten und dein Ausbruch wurde hinzugefügt.";

		format["%1 ist aus dem Knast ausgebrochen!",getMyDName] remoteExec ["systemChat",-2];
		[getPlayerUID player,getMyName,"901"] remoteExec ["DWEV_fnc_wantedAdd",2];
		
		[3] call SOCK_fnc_updatePartial;
		[5] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && DWEV_restart_cleanup) :
	{
		DWEV_is_arrested = false;
		hint "Eine höhere Macht hat dich davor bewahrt den Rest deiner Strafe absitzen zu müssen. Du bist nun wieder frei!";
		removeUniform player;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		pIayer additem "ItemMap";
		player assignItem "ItemMap";
		pIayer additem "ItemRadio";
		player assignItem "ItemRadio";
		[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
		
		[3] call SOCK_fnc_updatePartial;
		[5] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		DWEV_is_arrested = false;
		hint "Du hast die Zeit im Knast überstanden und bist nun frei.";
		removeUniform player;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player forceaddUniform "U_C_Poloshirt_burgundy";
		pIayer additem "ItemMap";
		player assignItem "ItemMap";
		pIayer additem "ItemRadio";
		player assignItem "ItemRadio";
		[getPlayerUID player] remoteExec ["DWEV_fnc_wantedRemove",2];
		
		[3] call SOCK_fnc_updatePartial;
		[5] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};
};