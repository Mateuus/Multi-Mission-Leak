/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call GTA_fnc_param;
_bad = [_this,1,false,[false]] call GTA_fnc_param;
if(_bad) then { _time = time + 1100; } else { _time = time + (20 * 60); };

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn {
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (15 * 60);
	}
		else
	{
		sleep (10 * 60);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " £%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};

	if(player distance (getMarkerPos "jail_marker") > 60) exitWith {
		_esc = true;
	};

	if(life_bail_paid) exitWith {
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		removeUniform player;
		player forceAddUniform "U_C_Commoner1_1";
		[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;
		life_is_gta_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call GTA_fnc_remoteExec;
		[5] call GTA_fnc_updatePlayerPartial;
	};

	case (_esc) :
	{
		life_is_gta_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format[localize "STR_Jail_EscapeNOTF",profileName]],"life_fnc_broadcast",nil,false] call GTA_fnc_remoteExec;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] call GTA_fnc_remoteExec;
		[5] call GTA_fnc_updatePlayerPartial;
	};

	case (alive player && !_esc && !_bail) :
	{
		removeUniform player;
		player forceAddUniform "U_C_Commoner1_1";
		[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;
		life_is_gta_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call GTA_fnc_remoteExec;
		player setPos (getMarkerPos "jail_release");
		[5] call GTA_fnc_updatePlayerPartial;
	};
};
