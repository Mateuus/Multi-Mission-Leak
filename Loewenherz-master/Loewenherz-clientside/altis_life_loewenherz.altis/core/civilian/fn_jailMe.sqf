/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = param [0,[],[[]]];
_bad = param [1,false,[false]];
if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { lhm_bail_amount = (_ret select 3); } else { lhm_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn
{
	lhm_canpay_bail = false;
	if(_this select 0) then
	{
		UIsleep (10 * 60);
	}
		else
	{
		UIsleep (5 * 60);
	};
	lhm_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[lhm_bail_amount] call lhm_fnc_numberText,if(isNil "lhm_canpay_bail") then {"Yes"} else {"No"}];
	};

	// LHM START
	if(player distance (getMarkerPos "jail_marker") > 110) then
	{
		player setPos (getMarkerPos "jail_marker");
		lhm_bail_amount = lhm_bail_amount + 25000;
	};
	// LHM START

	if(lhm_bail_paid) exitWith {
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	Uisleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		lhm_is_arrested = 0;
		lhm_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
		[5] call SOCK_fnc_updatePartial;
	};

	case (_esc) :
	{
		lhm_is_arrested = 0;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format[localize "STR_Jail_EscapeNOTF",profileName]],"lhm_fnc_broadcast",nil,false] call lhm_fnc_mp;
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"lhm_fnc_broadcast",nil,false] call lhm_fnc_mp;
		[5] call SOCK_fnc_updatePartial;
	};

	case (alive player && !_esc && !_bail) :
	{
		lhm_is_arrested = 0;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};