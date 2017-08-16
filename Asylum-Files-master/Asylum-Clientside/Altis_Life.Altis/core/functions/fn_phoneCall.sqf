/*
	File: fn_phoneCall.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiate or receive a phone call.
*/

private ["_init","_unit","_callStart"];
_init = [_this,0,true,[true]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if (isNull _unit) exitWith
{
	_to = objNull;
	_toString = format["%1",(lbData[5004,(lbCurSel 5004)])];
	if (_toString == "911" && isNull life_dispatcher) exitWith { hint "Police dispatch is currently unavailable. Please try again later or send an emergency text message." };
	if (_toString == "911") then { _to = life_dispatcher }
	else { _to = call compile _toString; };
	if (isNull _to) exitWith {};
	[true,_to] spawn life_fnc_phoneCall;
};

if (life_phone_status != 0) exitWith {};

_callStart = time;

if (_init) then
{
	if (life_phone_channel > -1) exitWith {};
	life_phone_status = 2;
	[[0,2], format["Calling %1...", name _unit]] call life_fnc_broadcast;
	[[false,player],"life_fnc_phoneCall",_unit,false] spawn life_fnc_MP;
	while {life_phone_status == 2} do
	{
		if (life_phone_channel > -1) exitWith { life_phone_status = 3 };
		if (time - _callStart > 60) exitWith { life_phone_status = 0 };
		playSound "PhoneDial";
		sleep 4;
	};
	if (life_phone_status == 0) then { [[0,2], format["%1 did not answer their phone.", name _unit]] call life_fnc_broadcast; };
	if (life_phone_status == 3 || life_phone_channel > -1) then { [[0,2], format["%1 added to phone session.", name _unit]] call life_fnc_broadcast; };
}
else
{
	life_phone_status = 1;
	[[0,2], format["Incoming call from %1. Press 9 to answer or 8 to ignore.", name _unit]] call life_fnc_broadcast;
	while {life_phone_status == 1} do
	{
		if (time - _callStart > 55) exitWith { life_phone_status = 0 };
		if (life_ringer) then { playSound "PhoneRing"; };
		sleep 3;
	};
	if (life_phone_status == 3) then
	{
		if(player == life_dispatcher) then {[name _unit, getPos _unit, "911 CALL"] spawn life_fnc_createMarker};
		[[_unit,player,false],"ASY_fnc_managePhone",false,false] spawn life_fnc_MP;
	};
};