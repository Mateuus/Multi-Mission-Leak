#include <macro.h>
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param; 
_time = time + (_time * 60); //x Minutes
if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 20000;};
_esc = false;
_bail = false;

[_bad,_time] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		//uiSleep (10 * 60);
		uiSleep ( (_this select 1) * 0.5 );
	}
		else
	{
		//uiSleep (5 * 60);
		uiSleep ( (_this select 1) * 0.2 );
	};
	life_canpay_bail = nil;
};
while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 seconde(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Temps restant :\n %1\n",_countDown];
		}
		else
		{
			hintSilent format["Temps restant :\n %1\n",_countDown];
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
	
	if((round(_time - time)) < 1) exitWith {hint ""};
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
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[steamid],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[] call life_fnc_outOfJail;		
		[5] call SOCK_fnc_updatePartial;
	};	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format["%1 s'est evadé de prison !",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[steamid,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[steamid],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[] call life_fnc_outOfJail;
		[5] call SOCK_fnc_updatePartial;
	};
};