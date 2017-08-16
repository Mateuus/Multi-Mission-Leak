/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; //##80

_time = time + (_time * 60); //x Minutes

//if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); }; //##80 (time loaded from DB)

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 20000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn
{
	life_canpay_bail = false;
	life_bail_amount = life_bail_amount * 5;
	if(_this select 0) then
	{
		//uiSleep (10 * 60);
		//50% of time
		uiSleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//uiSleep (5 * 60);
		//20% of time
		uiSleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Time Remaining:\n %1\n\nCan pay Bail: %3\nBail Amount: $%2",_countDown,[life_bail_amount] call tanoarpg_fnc_numberText];
		}
		else
		{
			hintSilent format["Time Remaining:\n %1\n",_countDown];
		};
		
	};
	
	if(player distance (getMarkerPos "jail_marker") > 180) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hintSilent ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	uiSleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hintSilent localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		//player setPos (getMarkerPos "jail_release");
		player setPosASL [11151.4,5413.56,4];
		[getPlayerUID player] remoteExec ["tanoarpg_fnc_wantedRemove", 2, false];
		[5] call XAS_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hintSilent localize "STR_Jail_EscapeSelf";
		[0,format["%1 ist aus dem Gefängnis ausgebrochen!",profileName]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		[getPlayerUID player,profileName,"901"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];
		[5] call XAS_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hintSilent localize "STR_Jail_Released";
		[getPlayerUID player] remoteExec ["tanoarpg_fnc_wantedRemove", 2, false];
		//player setPos (getMarkerPos "jail_release");
		player setPosASL [11151.4,5413.56,4];
		[5] call XAS_fnc_updatePartial;
	};
};