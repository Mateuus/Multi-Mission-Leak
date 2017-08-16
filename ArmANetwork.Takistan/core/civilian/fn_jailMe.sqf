#include <macro.h>

/*
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_bad = param [1,false,[false]];
_time = param [2,15,[0]];

_time = time + (_time * 60);

_esc = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };


while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>",_countDown];
	};

	if(player distance (getMarkerPos "jail_marker") > 200) exitWith {
		_esc = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 1;
};


switch (true) do
{
	case (_esc): {
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
		player setVariable ["tf_unable_to_use_radio", false];
	};

	case (alive player && !_esc): {
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		player setVariable ["tf_unable_to_use_radio", false];
		[5] call SOCK_fnc_updatePartial;
	};
};
