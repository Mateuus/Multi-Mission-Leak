/*
	File: fn_jailMe.sqf

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/

params [["_ret", [],[[]]], ["_bad", false,[false]], "_time", "_bail", "_esc", "_countDown"];

if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { 
	life_bail_amount = (_ret select 3)
} else { 
	life_bail_amount = 1500; 
	_time = time + (10 * 60)
};
_esc = false;
_bail = false;

[_bad] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then {
		uiSleep (10 * 60)
	} else {
		uiSleep (5 * 60)
	};
	life_canpay_bail = nil;
};

while {true} do
{
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
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(deadPlayer && ((round(_time - time)) > 0)) exitWith {};
	uiSleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		player addUniform A3L_Fnc_OldUniform;
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[0,format[localize "STR_Jail_EscapeNOTF",profileName]] remoteExecCall ["life_fnc_broadcast", -2];
		[getPlayerUID player,profileName,"901"] remoteExec ["life_fnc_wantedAdd",2];

	};
	
	case (!deadPlayer && !_esc && !_bail) :
	{
		player addUniform A3L_Fnc_OldUniform;
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");

	};
};

[5] call SOCK_fnc_updatePartial;
call life_fnc_saveGear;